import sys

class P(object):
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __repr__(self):
        return 'P:{0:.3f} {1:.3f}'.format(self.x, self.y)

class Line(object):
    def __init__(self, p1, p2):
        self.p1 = p1
        self.p2 = p2
        self.epsilon = 1e-8

    def is_over(self, p):
        if abs(self.p2.x - self.p1.x) < self.epsilon:
            return self.p1.x > p.x
        elif abs(self.p2.y - self.p1.y) < self.epsilon:
            return self.p1.y > p.y
        else:
            a = (self.p2.y - self.p1.y) / (self.p2.x - self.p1.x)
            b = self.p1.y
            y = a * (p.x - self.p1.x) + b
            return y > p.y

def run():
    for i in sys.stdin:
        x1, y1, x2, y2, x3, y3, xp, yp = list(map(float, i.split()))
        p1, p2, p3, p = P(x1, y1), P(x2, y2), P(x3, y3), P(xp, yp)
        l_12 = Line(p1, p2)
        l_23 = Line(p2, p3)
        l_31 = Line(p3, p1)

        res = l_12.is_over(p3) == l_12.is_over(p)
        res &= l_23.is_over(p1) == l_23.is_over(p)
        res &= l_31.is_over(p2) == l_31.is_over(p)

        if res:
            print('YES')
        else:
            print('NO')

if __name__ == '__main__':
    run()


