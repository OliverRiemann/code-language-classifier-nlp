import sys

SIZE = 10
paper = []


def main():
    init()

    for line in sys.stdin:
        data = line.strip().split(',')
        i = int(data[0])
        j = int(data[1])
        size = int(data[2])

        if   size == 1:
            drop_small(i, j)
        elif size == 2:
            drop_medium(i, j)
        elif size == 3:
            drop_large(i, j)

    print count_white()
    print find_max()

def find_max():
    mx = 0
    for i in xrange(SIZE):
        for j in xrange(SIZE):
            mx = max(mx, paper[i][j])

    return mx

def count_white():
    c = 0
    for i in xrange(SIZE):
        for j in xrange(SIZE):
            if paper[i][j] == 0:
                c += 1

    return c

def init():
    global paper
    for i in xrange(SIZE):
        paper.append([0]*SIZE)


def check(i, j):
    if i < 0 or SIZE <= i:
        return False
    if j < 0 or SIZE <= j:
        return False

    return True


def drop(i, j):
    global paper
    if not check(i, j):
        return False

    paper[i][j] += 1
    return True


def drop_small(i, j):
    drop(i, j)
    drop(i - 1, j)
    drop(i + 1, j)
    drop(i, j - 1)
    drop(i, j + 1)


def drop_medium(i, j):
    drop_small(i, j)
    drop(i - 1, j - 1)
    drop(i - 1, j + 1)
    drop(i + 1, j - 1)
    drop(i + 1, j + 1)


def drop_large(i, j):
    drop_medium(i, j)
    drop(i - 2, j)
    drop(i, j - 2)
    drop(i, j + 2)
    drop(i + 2, j)

main()