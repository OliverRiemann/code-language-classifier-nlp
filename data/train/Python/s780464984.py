# -*- coding: utf-8 -*-
import sys
import cmath
import math

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
        return cmath.acos( (B*B+C*C-A*A)/(2*B*C) ).real


eps = 0.0001
for line in sys.stdin:
    line = [float(x) for x in line.split()]
    p1 = Point(line[0], line[1])
    p2 = Point(line[2], line[3])
    p3 = Point(line[4], line[5])
    P  = Point(line[6], line[7])
    t1 = Triangle(p1, p2, P)
    t2 = Triangle(p2, p3, P)
    t3 = Triangle(p3, p1, P)
    if (math.degrees(t1.angleC + t2.angleC + t3.angleC) <= 360+eps) and (math.degrees(t1.angleC + t2.angleC + t3.angleC) >= 360-eps):
        print("YES")
    else:
        print("NO")