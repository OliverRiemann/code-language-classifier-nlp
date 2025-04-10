class Point(object):
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def __str__(self):
        return "x = {0}, y = {1}".format(self.x, self.y)

class Line(Point):
    eps = 10**(-10)
    def __init__(self, p1, p2):
        self.p1 = p1
        self.p2 = p2

    def isParallel(self, another_p):
        try:
            angle1 = (self.p1.y - self.p2.y) / (self.p1.x - self.p2.x)
            angle2 = (another_p.p1.y - another_p.p2.y) / (another_p.p1.x - another_p.p2.x)
            if angle1 >= angle2-self.eps and angle1 <= angle2+self.eps:
                return True
            else:
                return False
        except ZeroDivisionError:
            if self.p1.x == self.p2.x and another_p.p1.x == another_p.p2.x:
                return True
            else:
                return False


n = int(input())
for i in range(n):
    x1, y1, x2, y2, x3, y3, x4, y4 = map(float, input().split())
    A = Point(x1, y1)
    B = Point(x2, y2)
    C = Point(x3, y3)
    D = Point(x4, y4)

    AB = Line(A, B)
    CD = Line(C, D)

    if AB.isParallel(CD):
        print("YES")
    else:
        print("NO")