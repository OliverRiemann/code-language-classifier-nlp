import sys

class Point(object):
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def isLeft(self, vector):
        tmpVector = DirectedVector(vector.start, self)
        sin = tmpVector * vector
        if sin > 0:
            return True
        else:
            return False

class DirectedVector(object):
    def __init__(self, start, end):
        self.start = start
        self.end = end
    @property
    def x(self):
        return self.end.x - self.start.x
    @property
    def y(self):
        return self.end.y - self.start.y
    def __mul__(self, other):
        return self.x * other.y - self.y * other.x

def getDataSets():
    for line in sys.stdin.readlines():
        line = line.strip()
        x1, y1, x2, y2, x3, y3, xp, yp = [float(x) for x in line.split()]
        p1 = Point(x1, y1)
        p2 = Point(x2, y2)
        p3 = Point(x3, y3)
        px = Point(xp, yp)
        yield p1, p2, p3, px

def main():
    for p1, p2, p3, px in getDataSets():
        evaluate = [
                px.isLeft(DirectedVector(p1, p2)),
                px.isLeft(DirectedVector(p2, p3)),
                px.isLeft(DirectedVector(p3, p1)),
                ]
        if(all(evaluate) or not any(evaluate)):
            print 'YES'
        else:
            print 'NO'

if __name__ == "__main__":
    main()