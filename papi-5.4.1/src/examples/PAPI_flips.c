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
  
  int numberOfElements = 4;


  int Events[4] = { 0 }; // array size = numberOfElements

  Events[0] = PAPI_TLB_TL;
  Events[1] = PAPI_TOT_CYC;
  Events[2] = PAPI_BR_INS;
  Events[3] = PAPI_FAD_INS;
  long long values[numberOfElements];


  printf("\n\n\n");



  if (PAPI_start_counters(Events, numberOfElements) != PAPI_OK)
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


  if (PAPI_stop_counters(values, numberOfElements) != PAPI_OK)
  {
    printf("not okay to stop");
  }

  PAPI_read_counters(values, numberOfElements);


  printf("Total TLB misses: %llu\n", values[0]);
  printf("Total instruction cycles: %llu\n", values[1]);
  printf("Branch instructions: %llu\n", values[2]);
  printf("Floating point add instructions: %llu\n", values[3]);



  printf("\n\n\n");

  exit(0);
}
