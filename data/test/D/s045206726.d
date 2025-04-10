import std.stdio;
import std.string;
import std.conv;



void main() {
    string input;
    const string[] classBoxing = ["light fly", "fly", "bantam", "feather", "light", "light welter", "welter", "light middle", "middle", "light heavy", "heavy"];

    while ((input = readln.chomp).length != 0) {
        double weight = input.to!double;
        uint index;

        if (weight <= 48.00) {
            index = 0;
        } else if (weight <= 51.00) {
            index = 1;
        } else if (weight <= 54.00) {
            index = 2;
        } else if (weight <= 57.00) {
            index = 3;
        } else if (weight <= 60.00) {
            index = 4;
        } else if (weight <= 64.00) {
            index = 5;
        } else if (weight <= 69.00) {
            index = 6;
        } else if (weight <= 75.00) {
            index = 7;
        } else if (weight <= 81.00) {
            index = 8;
        } else if (weight <= 91.00) {
            index = 9;
        } else {
            index = 10;
        }

        writeln(classBoxing[index]);
    }
}