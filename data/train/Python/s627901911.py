
import sys


class Paper:
    def __init__(self):
        self.paper = [[0 for x in range(10)] for y in range(10)]

    def white_space(self):
        s = 0
        for x in range(10):
            for y in range(10):
                if self.paper[x][y] == 0:
                    s += 1
        return s

    def most_dark(self):
        s = 0
        for x in range(10):
            for y in range(10):
                if self.paper[x][y] > s:
                    s = self.paper[x][y]
        return s

    def drop(self, x, y, size):
        r = []
        if size == 1:
            r.append((x,y))
            r.append((x-1,y))
            r.append((x+1,y))
            r.append((x,y-1))
            r.append((x,y+1))
        elif size == 2:
            r = [(i,j) for i in range(x-1, x+2) for j in range(y-1, y+2)]
        elif size == 3:
            r = [(i,j) for i in range(x-1, x+2) for j in range(y-1, y+2)]
            r.append((x-2, y))
            r.append((x+2, y))
            r.append((x, y-2))
            r.append((x, y+2))
        else:
            pass
#        print r
        r = filter(self.out_of_paper, r)
#        print r
        try:
            for p in r:
                self.paper[p[0]][p[1]] += 1
        except:
            pass
        return self

    def out_of_paper(self, p):
        if 0 <= p[0] < 10 and 0 <= p[1] < 10:
            return True
        else:
            return False



paper = Paper()
for line in sys.stdin:
    (x, y, size) = tuple(map(int, line.split(',')))
    paper.drop(x, y, size)
print paper.white_space()
print paper.most_dark()