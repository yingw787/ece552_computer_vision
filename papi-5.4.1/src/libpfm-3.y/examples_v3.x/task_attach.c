/*
 * task_attach.c - example of how to attach to another task for monitoring
 *
 * Copyright (c) 2002-2006 Hewlett-Packard Development Company, L.P.
 * Contributed by Stephane Eranian <eranian@hpl.hp.com>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
 * of the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
 * INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
 * PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
 * CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
 * OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
#include <sys/types.h>
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <errno.h>
#include <unistd.h>
#include <string.h>
#include <stdarg.h>
#include <sys/wait.h>
#include <sys/ptrace.h>

#include <perfmon/pfmlib.h>
#include <perfmon/perfmon.h>

#include "detect_pmcs.h"

#define NUM_PMCS PFMLIB_MAX_PMCS
#define NUM_PMDS PFMLIB_MAX_PMDS

#define MAX_EVT_NAME_LEN	128

static void fatal_error(char *fmt,...) __attribute__((noreturn));

static void
fatal_error(char *fmt, ...)
{
	va_list ap;

	va_start(ap, fmt);
	vfprintf(stderr, fmt, ap);
	va_end(ap);

	exit(1);
}

int
parent(pid_t pid)
{
	pfmlib_input_param_t inp;
	pfmlib_output_param_t outp;
	pfarg_pmr_t pc[NUM_PMCS];
	pfarg_pmr_t pd[NUM_PMDS];
	pfarg_sinfo_t sif;
	pfarg_msg_t msg;
	unsigned int i, num_counters;
	int status, ret;
	int ctx_fd;
	char name[MAX_EVT_NAME_LEN];


	memset(pc, 0, sizeof(pc));
	memset(pd, 0, sizeof(pd));
	memset(&inp,0, sizeof(inp));
	memset(&outp,0, sizeof(outp));
	memset(&sif,0, sizeof(sif));

	pfm_get_num_counters(&num_counters);

	if (pfm_get_cycle_event(&inp.pfp_events[0]) != PFMLIB_SUCCESS)
		fatal_error("cannot find cycle event\n");

	if (pfm_get_inst_retired_event(&inp.pfp_events[1]) != PFMLIB_SUCCESS)
		fatal_error("cannot find inst retired event\n");

	i = 2;

	/*
	 * set the privilege mode:
	 * 	PFM_PLM3 : user level
	 * 	PFM_PLM0 : kernel level
	 */
	inp.pfp_dfl_plm   = PFM_PLM3;

	if (i > num_counters) {
		i = num_counters;
		printf("too many events provided (max=%d events), using first %d event(s)\n", num_counters, i);
	}

	/*
	 * how many counters we use
	 */
	inp.pfp_event_count = i;

	/*
	 * now create a session. we will later attach it to the task we are creating.
	 */
	ctx_fd = pfm_create(0, &sif);
	if (ctx_fd == -1) {
		if (errno == ENOSYS) {
			fatal_error("Your kernel does not have performance monitoring support!\n");
		}
		fatal_error("cannot create session %s\n", strerror(errno));
	}
	/*
	 * build the pfp_unavail_pmcs bitmask by looking
	 * at what perfmon has available. It is not always
	 * the case that all PMU registers are actually available
	 * to applications. For instance, on IA-32 platforms, some
	 * registers may be reserved for the NMI watchdog timer.
	 *
	 * With this bitmap, the library knows which registers NOT to
	 * use. Of source, it is possible that no valid assignement may
	 * be possible if certina PMU registers  are not available.
	 */
	detect_unavail_pmu_regs(&sif, &inp.pfp_unavail_pmcs, NULL);

	/*
	 * let the library figure out the values for the PMCS
	 */
	if ((ret=pfm_dispatch_events(&inp, NULL, &outp, NULL)) != PFMLIB_SUCCESS) {
		fatal_error("cannot configure events: %s\n", pfm_strerror(ret));
	}
	/*
	 * Now prepare the argument to initialize the PMDs and PMCS.
	 * We must pfp_pmc_count to determine the number of PMC to intialize.
	 * We must use pfp_event_count to determine the number of PMD to initialize.
	 * Some events causes extra PMCs to be used, so  pfp_pmc_count may be >= pfp_event_count.
	 *
	 * This step is new compared to libpfm-2.x. It is necessary because the library no
	 * longer knows about the kernel data structures.
	 */
	for (i=0; i < outp.pfp_pmc_count; i++) {
		pc[i].reg_num   = outp.pfp_pmcs[i].reg_num;
		pc[i].reg_value = outp.pfp_pmcs[i].reg_value;
	}
	for(i=0; i < outp.pfp_pmd_count; i++)
		pd[i].reg_num = outp.pfp_pmds[i].reg_num;

	/*
	 * Now program the registers
	 *
	 * We don't use the save variable to indicate the number of elements passed to
	 * the kernel because, as we said earlier, pc may contain more elements than
	 * the number of events we specified, i.e., contains more thann counting monitors.
	 */

	if (pfm_write(ctx_fd, 0, PFM_RW_PMC, pc, outp.pfp_pmc_count * sizeof(*pc)) == -1)
		fatal_error("pfm_write error errno %d\n",errno);

	/*
	 * To be read, each PMD must be either written or declared
	 * as being part of a sample (reg_smpl_pmds)
	 */
	if (pfm_write(ctx_fd, 0, PFM_RW_PMD, pd, outp.pfp_pmd_count * sizeof(*pd)) == -1)
		fatal_error("pfm_write(PMD) error errno %d\n",errno);

	ret = ptrace(PTRACE_ATTACH, pid, NULL, 0);
	if (ret == -1) {
		fatal_error("cannot attach to %d: %s\n", pid, strerror(errno));
	}

	/*
	 * wait for the child to be actually stopped
	 */
	waitpid(pid, &status, WUNTRACED);

	/*
	 * check if process exited early
	 */
	if (WIFEXITED(status))
		fatal_error("command process %d exited too early with status %d\n", pid, WEXITSTATUS(status));

	/*
	 * the task is stopped at this point
	 */
	
	/*
	 * now we attach the session to ourself
	 */
	if (pfm_attach(ctx_fd, 0, pid) == -1)
		fatal_error("pfm_attach error errno %d\n",errno);

	/*
	 * activate monitoring. The task is still STOPPED at this point. Monitoring
	 * will not take effect until the execution of the task is resumed.
	 */
	if (pfm_set_state(ctx_fd, 0, PFM_ST_START) == -1)
		fatal_error("pfm_set_state(start) error errno %d\n",errno);

	/*
	 * now resume execution of the task, effectively activating
	 * monitoring.
	 */
	ptrace(PTRACE_DETACH, pid, NULL, 0);

	/*
	 * now the task is running
	 */

	/*
	 * We cannot simply do a waitpid() because we may be attaching to a process
	 * totally unrelated to our program. Instead we use a perfmon facility that
	 * notifies us when the monitoring task is exiting.
	 *
	 * When a task with a monitoring session attached to it exits, a PFM_MSG_END
	 * is generated. It can be retrieve with a simple read() on the session's descriptor.
	 *
	 * Another reason why you might return from the read is if there was a counter
	 * overflow, unlikely in this example.
	 *
	 * To measure only for short period of time, use select or poll with a timeout,
	 * see task_attach_timeout.c
	 *
	 */
	ret = read(ctx_fd, &msg, sizeof(msg));
	if (ret == -1)
		fatal_error("cannot read from descriptor: %s\n", strerror(errno));

	if (msg.type != PFM_MSG_END)
		fatal_error("unexpected msg type : %d\n", msg.type);

	/*
	 * the task has exited, we can simply read the results
	 */

	/*
	 * now simply read the results.
	 */
	if (pfm_read(ctx_fd, 0, PFM_RW_PMD, pd, inp.pfp_event_count * sizeof(*pd)) == -1)
		fatal_error("pfm_read error errno %d\n",errno);

	/*
	 * print the results
	 *
	 * It is important to realize, that the first event we specified may not
	 * be in PMD4. Not all events can be measured by any monitor. That's why
	 * we need to use the pc[] array to figure out where event i was allocated.
	 *
	 */
	for (i=0; i < inp.pfp_event_count; i++) {
		pfm_get_full_event_name(&inp.pfp_events[i], name, MAX_EVT_NAME_LEN);
		printf("PMD%-3u %20"PRIu64" %s\n",
			pd[i].reg_num,
			pd[i].reg_value,
			name);
	}
	/*
	 * free the session
	 */
	close(ctx_fd);

	return 0;
}

int
main(int argc, char **argv)
{
	pfmlib_options_t pfmlib_options;
	pid_t pid;
	int ret;

	if (argc < 2) {
		fatal_error("usage: %s pid\n", argv[0]);
	}

	pid = atoi(argv[1]);

	/*
	 * pass options to library (optional)
	 */
	memset(&pfmlib_options, 0, sizeof(pfmlib_options));
	pfmlib_options.pfm_debug = 0; /* set to 1 for debug */
	pfm_set_options(&pfmlib_options);

	/*
	 * Initialize pfm library (required before we can use it)
	 */
	ret = pfm_initialize();
	if (ret != PFMLIB_SUCCESS)
		fatal_error("Cannot initialize library: %s\n", pfm_strerror(ret));

	return parent(pid);
}
