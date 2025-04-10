#!/usr/bin/env python3
import sys


def Print(array):
    for r in range(len(array)):
        print(array[r])
    print()


def Gauss(array):
    # for r in range(len(array)):
    #     array[r].append(r)

    for r in range(len(array)):
        # array.sort(key=lambda x: x[r], reverse=True)
        div = array[r][r]
        for c in range(r, len(array) + 1):
            array[r][c] /= div
        for r2 in range(r + 1, len(array)):
            head = array[r2][r]
            for c in range(r, len(array) + 1):
                array[r2][c] -= head * array[r][c]

    result = [0] * len(array)
    for r in range(len(array) - 1, -1, -1):
        result[r] = array[r][
            len(array)] - sum([result[x] * array[r][x] for x in range(r + 1, len(array))])
    return result


for line in sys.stdin:
    [a, b, c, d, e, f] = [int(x) for x in line.split()]
    result = Gauss([[a, b, c], [d, e, f]])
    for i in range(len(result) - 1):
        print("{0:.3f}".format(result[i]), end=" ")
    print("{0:.3f}".format(result[-1]))