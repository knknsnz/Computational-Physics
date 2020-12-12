// problem4.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>

double squared(double x);  //declare the function to compute a square

#define N 10; //size of the array

int main() {

	double matrix[10][10] = { 0 }; //create an array

	for (int i = 0; i < N; i++) {  //loop over i
		for (int j = 0; j < N; i++) {  //loop over j
			double value = ((double)(abs(i - j)));  //compute |i-j|
			matrix[i][j] = squared(value);  // plug |i-j| into the matrix
		}
	}

	for (int i = 0; i < N; i++) {  //loop over i
		for (int j = 0; j < N; j++) {  //loop over j
			std::cout << matrix[i][j] << " ";  //print the matrix to the terminal
		}
		std::cout << "\n";//print a new line
	}
	return 0;
}


double squared(double x) {  //define the function to compute a square
	return x*x;  //compute x^2 and return it
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
