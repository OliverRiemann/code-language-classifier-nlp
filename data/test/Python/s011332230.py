import sys


class Paper(object):
    def __init__(self, x=None, y=None):
        if x == None:
            self.x = 10
        else:
            self.x = x
        if y == None:
            self.y = 10
        else:
            self.y = y
        t = [0] * self.x
        self.sheet = [t[:] for _ in range(self.y)]

    def drop_ink(self, ink):
        x, y, s = ink
        if s == 1:
            self.process_ink(x, y)
            self.process_ink(x+1, y)
            self.process_ink(x-1, y)
            self.process_ink(x, y+1)
            self.process_ink(x, y-1)
        elif s == 2:
            self.process_ink(x-1, y-1)
            self.process_ink(x, y-1)
            self.process_ink(x+1, y-1)
            self.process_ink(x-1, y)
            self.process_ink(x, y)
            self.process_ink(x+1, y)
            self.process_ink(x-1, y+1)
            self.process_ink(x, y+1)
            self.process_ink(x+1, y+1)
        elif s == 3:
            self.process_ink(x, y-2)
            self.process_ink(x-1, y-1)
            self.process_ink(x, y-1)
            self.process_ink(x+1, y-1)
            self.process_ink(x-2, y)
            self.process_ink(x-1, y)
            self.process_ink(x, y)
            self.process_ink(x+1, y)
            self.process_ink(x+2, y)
            self.process_ink(x-1, y+1)
            self.process_ink(x, y+1)
            self.process_ink(x+1, y+1)
            self.process_ink(x, y+2)

    def process_ink(self, x, y):
        if 0 <= x < self.x and 0 <= y < self.y:
            self.sheet[y][x] += 1

    def print_sheet(self):
        for row in self.sheet:
            print(row)


if __name__ == '__main__':
    ink_drops = []
    for line in sys.stdin:
        ink_drops.append([int(x) for x in line.strip().split(',')])

#    for line in sys.stdin:
#        try:
#            ink_drops.append([int(x) for x in line.strip().split(',')])
#        except ValueError:
#            break

    p = Paper(10, 10)
    for ink in ink_drops:
        p.drop_ink(ink)
        #p.print_sheet()
        #print('=' * 64)

    white_cell = 0
    max_ink = 0
    for r in p.sheet:
        white_cell += r.count(0)
        max_ink = max(max(r), max_ink)
    print(white_cell)
    print(max_ink)