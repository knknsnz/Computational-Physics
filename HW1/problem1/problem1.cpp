// problem1.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <fstream>
#include <math.h>

double logistic_calculate(double t);
double derivative_calculate(double t);
#define n 20
#define m 1
int main()
{
	double x = 0.1;
	int t = 2;
	double dt = 0.1;
	double fdt[n][m] = { {0} };
	for (int i = 0; i < n; i++) {
		double x1 = logistic_calculate(2);
		double tdt = (int)t + pow(10, -(i));
		double x2 = logistic_calculate(tdt);
		double x_prime = derivative_calculate(2);
		fdt[i][m] = x_prime - (x2 - x1) / dt;
	}

	double logistic_calculate(double t){ 
		return 1 / (1 + 9 * pow(e,-t));
	}

	double derivative_calculate(double t) {
		return -9 * exp(-t) * log(1 + 9 * pow(e, -t));
	}
}
// Run program: Ctrl + F5 or Debug > Start Without Debugging menu
// Debug program: F5 or Debug > Start Debugging menu

// Tips for Getting Started: 
//   1. Use the Solution Explorer window to add/manage files
//   2. Use the Team Explorer window to connect to source control
//   3. Use the Output window to see build output and other messages
//   4. Use the Error List window to view errors
//   5. Go to Project > Add New Item to create new code files, or Project > Add Existing Item to add existing code files to the project
//   6. In the future, to open this project again, go to File > Open > Project and select the .sln file
