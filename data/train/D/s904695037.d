import std.stdio;
import std.algorithm;
import std.string;
import std.range;

string[dchar] code1;
dchar[string] code2;

void main() {
	code1[' '] = "101";
	code1['\''] = "000000";
	code1[','] = "000011";
	code1['-'] = "10010001";
	code1['.'] = "010001";
	code1['?'] = "000001";
	code1['A'] = "100101";
	code1['B'] = "10011010";
	code1['C'] = "0101";
	code1['D'] = "0001";
	code1['E'] = "110";
	code1['F'] = "01001";
	code1['G'] = "10011011";
	code1['H'] = "010000";
	code1['I'] = "0111";
	code1['J'] = "10011000";
	code1['K'] = "0110";
	code1['L'] = "00100";
	code1['M'] = "10011001";
	code1['N'] = "10011110";
	code1['O'] = "00101";
	code1['P'] = "111";
	code1['Q'] = "10011111";
	code1['R'] = "1000";
	code1['S'] = "00110";
	code1['T'] = "00111";
	code1['U'] = "10011100";
	code1['V'] = "10011101";
	code1['W'] = "000010";
	code1['X'] = "10010010";
	code1['Y'] = "10010011";
	code1['Z'] = "10010000";

	code2["00000"] = 'A';
	code2["00001"] = 'B';
	code2["00010"] = 'C';
	code2["00011"] = 'D';
	code2["00100"] = 'E';
	code2["00101"] = 'F';
	code2["00110"] = 'G';
	code2["00111"] = 'H';
	code2["01000"] = 'I';
	code2["01001"] = 'J';
	code2["01010"] = 'K';
	code2["01011"] = 'L';
	code2["01100"] = 'M';
	code2["01101"] = 'N';
	code2["01110"] = 'O';
	code2["01111"] = 'P';
	code2["10000"] = 'Q';
	code2["10001"] = 'R';
	code2["10010"] = 'S';
	code2["10011"] = 'T';
	code2["10100"] = 'U';
	code2["10101"] = 'V';
	code2["10110"] = 'W';
	code2["10111"] = 'X';
	code2["11000"] = 'Y';
	code2["11001"] = 'Z';
	code2["11010"] = ' ';
	code2["11011"] = '.';
	code2["11100"] = ',';
	code2["11101"] = '-';
	code2["11110"] = '\'';
	code2["11111"] = '?';
	while(!stdin.eof()) {
		auto s1 = readln().chomp();
		if(!s1.empty()) {
			auto s2 = map!(a => code1[a])(s1).join("");
			while(!s2.empty()) {
				while(s2.length < 5)
					s2 = s2 ~ '0';
				write(code2[s2[0..5]]);
				s2 = s2.drop(5);
			}
			writeln();
		}
	}
}