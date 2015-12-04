#include <iostream>
#include "papi.h"
#include <stdio.h>

int main()
{

	int temp = PAPI_L1_DCM;

	int numCounters = PAPI_VER_CURRENT;


	std::cout << temp;
	std::cout << "\n";

   	std::cout << numCounters;
	std::cout << "\n";
	std::cout << "Hello, world!\n";
}
