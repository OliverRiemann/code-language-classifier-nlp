import std.stdio, std.string, std.conv, std.algorithm, std.array, std.typecons, std.range, std.functional;


bool nextPermutation(alias less="a<b", BidirectionalRange)
                    (ref BidirectionalRange range)
{
    // Ranges of 0 or 1 element have no distinct permutations.
    if (range.empty) return false;

    auto i = retro(range);
    auto last = i.save;

    // Find last occurring increasing pair of elements
    size_t n = 1;
    for (i.popFront(); !i.empty; i.popFront(), last.popFront(), n++)
    {
        if (binaryFun!less(i.front, last.front))
            break;
    }

    if (i.empty) {
        // Entire range is decreasing: it's lexicographically the greatest. So
        // wrap it around.
        range.reverse();
        return false;
    }

    // Find last element greater than i.front.
    auto j = find!((a) => binaryFun!less(i.front, a))(
                   takeExactly(retro(range), n));

    assert(!j.empty);   // shouldn't happen since i.front < last.front
    swap(i.front, j.front);
    reverse(takeExactly(retro(range), n));

    return true;
}


void main()
{
    int[3] ops = [cast(int)'+', cast(int)'-', cast(int)'*'];
    loop:while(true)
    {
        int[] input = readln.split.map!(to!int).array;
        if(input[0] == 0) break;

        foreach(a; ops) foreach(b; ops) foreach(c; ops)
        {
            int[] sorted = (input ~ [a, b, c]).sort;
            while(sorted.nextPermutation)
            {
                if(string exp = sorted.calc)
                {
                    exp.writeln;
                    continue loop;
                }
            }
        }

        0.writeln;
    }
}

string calc(int[] input)
{
    auto op = [
        '+': (int a, int b) => a + b,
        '-': (int a, int b) => a - b,
        '*': (int a, int b) => a * b,
    ];

    int[7] calcStack;
    string[7] expStack;
    int stackLen;
    foreach(num; input)
    {
        switch(num)
        {
            case '+':
            case '-':
            case '*':
                if(stackLen < 2) return null;
                calcStack[stackLen - 2] = op[cast(char)num](calcStack[stackLen - 2] ,calcStack[stackLen - 1]);
                expStack[stackLen - 2] = "(" ~ expStack[stackLen - 2] ~ cast(char)num ~ expStack[stackLen - 1] ~ ")";
                --stackLen;
                break;
            default:
                calcStack[stackLen] = num;
                expStack[stackLen] = num.to!string;
                ++stackLen;
        }
    }
    return calcStack[0] == 10 ? expStack[0] : null;
}