import std.stdio, std.string, std.conv;
import std.array, std.algorithm, std.range;

void main()
{
    foreach(s;stdin.byLine())
    {
        string i;
        foreach(c;s)
        {
            switch(c)
            {
            case ' ': i~="101";break;
            case'\'': i~="000000";break;
            case ',': i~="000011";break;
            case '-': i~="10010001";break;
            case '.': i~="010001";break;
            case '?': i~="000001";break;
            case 'A': i~="100101";break;
            case 'B': i~="10011010";break;
            case 'C': i~="0101";break;
            case 'D': i~="0001";break;
            case 'E': i~="110";break;
            case 'F': i~="01001";break;
            case 'G': i~="10011011";break;
            case 'H': i~="010000";break;
            case 'I': i~="0111";break;
            case 'J': i~="10011000";break;
            case 'K': i~="0110";break;
            case 'L': i~="00100";break;
            case 'M': i~="10011001";break;
            case 'N': i~="10011110";break;
            case 'O': i~="00101";break;
            case 'P': i~="111";break;
            case 'Q': i~="10011111";break;
            case 'R': i~="1000";break;
            case 'S': i~="00110";break;
            case 'T': i~="00111";break;
            case 'U': i~="10011100";break;
            case 'V': i~="10011101";break;
            case 'W': i~="000010";break;
            case 'X': i~="10010010";break;
            case 'Y': i~="10010011";break;
            case 'Z': i~="10010000";break;
            default: assert(false);break;
            }
        }
        i~='0'.repeat().take((5-i.length%5)%5).array();
        string t;
        foreach(c;0..i.length/5)
        {
            int v=0;
            foreach(b;i[c*5..(c+1)*5]) v=(v<<1)+(b-'0');
            t~="ABCDEFGHIJKLMNOPQRSTUVWXYZ .,-'?"[v];
        }
        writeln(t);
    }
}