/*****************************************************************************
 * This example demonstrates the usage of the high level function PAPI_flips *
 * which measures the number of floating point instructions executed and the *
 * MegaFlop rate(defined as the number of floating point instructions per    *
 * microsecond). To use PAPI_flips you need to have floating point           *
 * instructions event supported by the platform.                             * 
 *****************************************************************************/

/*****************************************************************************
 * The first call to PAPI_flips initializes the PAPI library, set up the     *
 * counters to monitor PAPI_FP_INS and PAPI_TOT_CYC events, and start the    *
 * counters. Subsequent calls will read the counters and return total real   *
 * time, total process time, total floating point instructions, and the      *
 * Mflins/s rate since the last call to PAPI_flips.                          *
 *****************************************************************************/

 
#include <stdio.h>
#include <stdlib.h>
#include "papi.h"


main()
{ 
  
  int Events[40] = { 
    PAPI_L1_DCM, PAPI_L1_ICM, PAPI_L2_DCM, PAPI_L2_ICM, PAPI_L1_TCM, 
    PAPI_L2_TCM, PAPI_FPU_IDL, PAPI_TLB_DM, PAPI_TLB_IM, PAPI_TLB_TL,
    PAPI_STL_ICY, PAPI_HW_INT, PAPI_BR_TKN, PAPI_BR_MSP, PAPI_TOT_INS,
    PAPI_FP_INS, PAPI_BR_INS, PAPI_VEC_INS};
  long long values[40];


  printf("\n\n\n");



  if (PAPI_start_counters(Events, 2) != PAPI_OK)
  {
    printf("not okay to start");
  }

    // include function here 
    printf("Hello World!\n");
    printf("Hello World!\n");
    printf("Hello World!\n");
    printf("Hello World!\n");
    printf("Hello World!\n");
    printf("Hello World!\n");
    printf("Hello World!\n");
    printf("Hello World!\n");
    printf("Hello World!\n");
    printf("Hello World!\n");


  if (PAPI_stop_counters(values, 2) != PAPI_OK)
  {
    printf("not okay to stop");
  }

  PAPI_read_counters(values, 2);

  printf("num counters: %d", PAPI_num_counters());

  printf("Level 1 Data Cache Misses: %llu\n", values[0]);
  printf("Level 1 Instruction Cache Misses: %llu\n", values[1]);
  printf("Level 2 Data Cache Misses: %llu\n", values[2]);
  printf("Level 2 Instruction Cache Misses: %llu\n", values[3]);
  printf("Level 1 cache misses: %llu\n", values[4]);
  printf("Level 2 cache misses: %llu\n", values[5]);
  printf("Cycles floating point units are idle: %llu\n", values[6]);
  printf("Data translation lookaside buffer misses: %llu\n", values[7]);
  printf("Instruction translation lookaside buffer misses: %llu\n", values[8]);
  printf("Total translation lookaside buffer misses: %llu\n", values[9]);
  // printf("Cycles with no instruction issue: %d\n", (int) values[10]);
  // printf("Hardware interrupts: %lu\n", (int) values[11]);
  // printf("Conditional branch instructions taken: %d\n", (int) values[12]);
  // printf("Conditional branch instructions mispredicted: %d\n", (int) values[13]);
  printf("Instructions completed: %llu\n", values[14]);
  // printf("Floating point instructions: %d\n", (int) values[15]);
  // printf("Branch instructions: %d\n", (int) values[16]);
  // printf("Vector/SIMD instructions: d\n", (int) values[17]);
  // printf(": %d\n", (int) values[9]);
  // printf(": %d\n", (int) values[9]);
  // printf(": %d\n", (int) values[9]);
  // printf(": %d\n", (int) values[9]);
  // printf(": %d\n", (int) values[9]);
  // printf(": %d\n", (int) values[9]);
  // printf(": %d\n", (int) values[9]);
  // printf(": %d\n", (int) values[9]);
  // printf(": %d\n", (int) values[9]);
  // printf(": %d\n", (int) values[9]);
  // printf(": %d\n", (int) values[9]);





  printf("\n\n\n");

  exit(0);
}

int your_slow_code()
{
  int i;
  double  tmp=1.1;

  for(i=1; i<2000; i++)
  { 
    tmp=(tmp+100)/i;
  }
  return 0;
}

