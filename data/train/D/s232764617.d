import std.stdio, std.string, std.conv;

void main()
{
    loop:
    do
    {
        bool[8][8] map;

        foreach(y; 0..8) foreach(x, c; readln.chomp)
        {
            map[y][x] = c == '1';
        }

        foreach(y; 0 .. 7) foreach(x; 0 .. 7)
        {
            if(map[y][x] && map[y + 1][x] && map[y][x + 1] && map[y + 1][x + 1])
            {
                "A".writeln;
                continue loop;
            }
        }

        foreach(y; 0 .. 5) foreach(x; 0 .. 8)
        {
            if(map[y][x] && map[y + 1][x] && map[y + 2][x] && map[y + 3][x])
            {
                "B".writeln;
                continue loop;
            }
        }

        foreach(y; 0 .. 8) foreach(x; 0 .. 5)
        {
            if(map[y][x] && map[y][x + 1] && map[y][x + 2] && map[y][x + 3])
            {
                "C".writeln;
                continue loop;
            }
        }

        foreach(y; 0 .. 6) foreach(x; 0 .. 7)
        {
            if(map[y][x + 1] && map[y + 1][x] && map[y + 1][x + 1] && map[y + 2][x])
            {
                "D".writeln;
                continue loop;
            }
        }

        foreach(y; 0 .. 7) foreach(x; 0 .. 6)
        {
            if(map[y][x] && map[y][x + 1] && map[y + 1][x + 1] && map[y + 1][x + 2])
            {
                "E".writeln;
                continue loop;
            }
        }

        foreach(y; 0 .. 6) foreach(x; 0 .. 7)
        {
            if(map[y][x] && map[y + 1][x] && map[y + 1][x + 1] && map[y + 2][x + 1])
            {
                "F".writeln;
                continue loop;
            }
        }

        foreach(y; 0 .. 7) foreach(x; 0 .. 6)
        {
            if(map[y + 1][x] && map[y + 1][x + 1] && map[y][x + 1] && map[y][x + 2])
            {
                "G".writeln;
                continue loop;
            }
        }
    } while (readln !is null);
}