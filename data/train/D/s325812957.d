module Main;

import std.stdio;
import std.string;
import std.conv;
import std.array;
import std.math;
import std.algorithm;



void main() {
    string input;
    immutable limitList = 50022;
    bool[] listPrimeNumber = new bool[](limitList);
    int number, primeNumberSmaller, primeNumberBigger;

    listPrimeNumber.fill(true);
    foreach (i; 2..limitList.to!double.sqrt.to!int) {
        if (listPrimeNumber[i]) {
            for (int j = i*2; j < limitList; j += i) listPrimeNumber[j] = false;
        }
    }

    while ((input = readln.chomp).length != 0) {
        number = input.to!int;

        primeNumberSmaller = getPrimeNumber(listPrimeNumber, number, false);
        primeNumberBigger  = getPrimeNumber(listPrimeNumber, number, true);

        writeln(primeNumberSmaller, " ", primeNumberBigger);
    }
}

int getPrimeNumber(in bool[] list, in int input, in bool flagBigger) {
    int temp;
    if (flagBigger) {
        temp = input + 1;
    } else {
        temp = input - 1;
    }

    if (list[temp]) {
        return temp;
    } else {
        return getPrimeNumber(list, temp, flagBigger);
    }
}