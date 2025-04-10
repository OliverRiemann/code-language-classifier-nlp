import sys
table = [[0 for j in range(10)] for i in range(10)]


def flag(x, y):
    if x > 9 or y > 9 or x < 0 or y < 0:
        return False
    else:
        return True


def small(x, y):
    table[x][y] += 1
    if flag(x+1, y):
        table[x+1][y] += 1
    if flag(x-1, y):
        table[x-1][y] += 1
    if flag(x, y+1):
        table[x][y+1] += 1
    if flag(x, y-1):
        table[x][y-1] += 1


def medium(x, y):
    small(x, y)
    if flag(x+1, y+1):
        table[x+1][y+1] += 1
    if flag(x+1, y-1):
        table[x+1][y-1] += 1
    if flag(x-1, y+1):
        table[x-1][y+1] += 1
    if flag(x-1, y-1):
        table[x-1][y-1] += 1


def large(x, y):
    medium(x, y)
    if flag(x+2, y):
        table[x+2][y] += 1
    if flag(x-2, y):
        table[x-2][y] += 1
    if flag(x, y+2):
        table[x][y+2] += 1
    if flag(x, y-2):
        table[x][y-2] += 1


def ink(x, y, s):
    if s == 1:
        small(x, y)
    if s == 2:
        medium(x, y)
    if s == 3:
        large(x, y)


def Search():
    counter = 0
    thickest = 0
    for i in range(10):
        for j in range(10):
            if table[i][j] == 0:
                counter += 1
            elif thickest < table[i][j]:
                thickest = table[i][j]
    print(counter)
    print(thickest)


for l in sys.stdin:
    data = list(map(int, l.split(",")))
    x, y, s = data
    ink(x, y, s)

Search()