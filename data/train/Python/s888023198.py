# -*- coding: utf-8 -*-

import cmath

class Point(object):
    def __init__(self, x, y):
        self.point = complex(x, y)
    def __str__(self):
        return "x = {0}, y = {1}".format(self.point.real, self.point.imag)

class Triangle(Point):
    def __init__(self, a, b, c):
        self.a = a
        self.b = b
        self.c = c
        # ３辺の長さ
        self.edgeA = abs(b.point-c.point)
        self.edgeB = abs(c.point-a.point)
        self.edgeC = abs(a.point-b.point)
        # ３角の大きさ
        self.angleA = Triangle.angle(self.edgeA, self.edgeB, self.edgeC)
        self.angleB = Triangle.angle(self.edgeB, self.edgeC, self.edgeA)
        self.angleC = Triangle.angle(self.edgeC, self.edgeA, self.edgeB)

    # 角度を求める
    def angle(A, B, C):
        return cmath.acos( (B*B+C*C-A*A)/(2*B*C) )


    # 外接円の半径
    def circumscribedCircleRadius(self):
        return abs((self.edgeA/cmath.sin(self.angleA))/2)

    # 外心
    def circumscribedCircleCenter(self):
        A = cmath.sin(2*self.angleA)
        B = cmath.sin(2*self.angleB)
        C = cmath.sin(2*self.angleC)
        X = (self.a.point.real*A + self.b.point.real*B + self.c.point.real*C) / (A+B+C)
        Y = (self.a.point.imag*A + self.b.point.imag*B + self.c.point.imag*C) / (A+B+C)
        return complex(X, Y)

n = int(input())
for i in range(n):
    line = list(map(float, input().split()))
    p1 = Point(line[0], line[1])
    p2 = Point(line[2], line[3])
    p3 = Point(line[4], line[5])
    T = Triangle(p1, p2, p3)
    center = T.circumscribedCircleCenter()
    print("{0:.3f} {1:.3f} {2:.3f}".format(center.real, center.imag, T.circumscribedCircleRadius()))