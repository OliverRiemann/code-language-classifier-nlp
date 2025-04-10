
import math

PI = math.pi
EPS = 10**-10

def edge(a, b):
    return ((a[0]-b[0])**2+(a[1]-b[1])**2)**.5

def area(a, b, c):
    s = (a+b+c)/2
    return (s*(s-a)*(s-b)*(s-c))**.5

def LawOfCosines(a, b, c): #余弦定理
    return math.acos( (b*b+c*c-a*a) / (2.0*b*c) );

def is_same(x, y): 
    return abs(x-y) < EPS

class Triangle:
    def __init__(self, p):
        a, b, c = p
        self.a = a
        self.b = b
        self.c = c

        self.edgeA = edge(b, c)
        self.edgeB = edge(c, a)
        self.edgeC = edge(a, b)

        self.area = area(self.edgeA, self.edgeB, self.edgeC)

        self.angleA = LawOfCosines(self.edgeA, self.edgeB, self.edgeC)
        self.angleB = LawOfCosines(self.edgeB, self.edgeC, self.edgeA)
        self.angleC = LawOfCosines(self.edgeC, self.edgeA, self.edgeB)

    def circumscribeadCircleRadius(self): #外接円の半径を返す
        return self.edgeA / math.sin(self.angleA) / 2.0

    def circumscribedCircleCenter(self): #外接円の中心の座標を返す
        a = math.sin(2.0*self.angleA);
        b = math.sin(2.0*self.angleB);
        c = math.sin(2.0*self.angleC);
        X = (self.a[0] * a + self.b[0] * b + self.c[0] * c) / (a+b+c);
        Y = (self.a[1] * a + self.b[1] * b + self.c[1] * c) / (a+b+c);
        return X, Y

    def inscribedCircleRadius(self): #内接円の半径
        return 2 * self.area / (self.edgeA + self.edgeB + self.edgeC)

    def inscribedCircleCenter(self): #内接円の中心の座標
        points = [self.a, self.b, self.c]
        edges = [self.edgeA, self.edgeB, self.edgeC]
        s = sum(edges)
        return [sum([points[j][i]*edges[j] for j in range(3)])/s for i in range(2)]

    def isInner(self, p): #点が三角形の内側か判定
        cross = lambda a, b: a[0]*b[1]-a[1]*b[0]

        c1 = 0
        c2 = 0
        points = [self.a, self.b, self.c]
        for i in range(3):
            a = [points[i][0]-points[(i+1)%3][0], points[i][1]-points[(i+1)%3][1]]
            b = [points[i][0]-p[0],  points[i][1]-p[1]]
            c = cross(a, b)
            if c > 0:
                c1 += 1
            elif c < 0:
                c2 += 1
        if c1 == 3 or c2 == 3:
            return True
        else:
            return c1+c2 != 3 and (c1 == 0 or c2 == 0)

if __name__ == "__main__":
    while True:
        try:
            c = list(map(float, input().split()))
            points = [(c[i], c[i+1]) for i in range(0, 6, 2)]
            point = [c[6], c[7]] 
            t = Triangle(points)
            print(["NO","YES"][t.isInner(point)])
        except:
            break

