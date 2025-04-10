import sys

paper = [[0] * 10 for x in xrange(10)]

def dropInc(coord, size):
    x, y = coord
    if size == 1:
        paper[y][x] += 1
        if y > 0:
            paper[y-1][x] += 1
        if y < 9:
            paper[y+1][x] += 1
        if x > 0:
            paper[y][x-1] += 1
        if x < 9:
            paper[y][x+1] += 1
    elif size == 2:
        dropInc(coord, 1)
        if y > 0 and x > 0:
            paper[y-1][x-1] += 1
        if x < 9 and y > 0:
            paper[y-1][x+1] += 1
        if x > 0 and y < 9:
            paper[y+1][x-1] += 1
        if x < 9 and y < 9:
            paper[y+1][x+1] += 1
    elif size == 3:
        dropInc(coord, 2)
        if x > 1:
            paper[y][x-2] += 1
        if x < 8:
            paper[y][x+2] += 1
        if y > 1:
            paper[y-2][x] += 1
        if y < 8:
            paper[y+2][x] += 1

for line in sys.stdin.readlines():
    line = line.strip()
    x,y,size = map(int, line.split(","))
    dropInc((x,y), size)

print sum([1 if x == 0  else 0 for y in paper for x in y])
print max([x for y in paper for x in y])