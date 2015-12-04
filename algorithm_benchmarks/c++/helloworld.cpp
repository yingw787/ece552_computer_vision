#include <iostream>
#include "/usr/local/include/papi.h"
// #include "/usr/local/lib/libpapi.a"
// #include "/usr/local/lib/libpapi.so"
#include <stdio.h>

int PAPI_start_counters(int *events, int array_len); /**< start counting hardware events */
int PAPI_stop_counters(long long * values, int array_len); /**< stop counters and return current counts */


int main()
{
	int Events[1] = { PAPI_TOT_CYC };
	long long values[1];

	if (PAPI_start_counters(Events, 2) != PAPI_OK)
	{
//		std::cout "not okay to start";
	}

	std::cout << "Hello, world!\n";

	if (PAPI_stop_counters(values, 2) != PAPI_OK)
	{
//		std::cout "not okay to stop";
	}


}
