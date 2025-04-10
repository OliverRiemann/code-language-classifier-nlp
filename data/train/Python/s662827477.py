#!/usr/bin/env python3
# -*- coding: utf-8 -*-


import collections
import math


LIMIT = 1e-10


class Vector2(collections.namedtuple("Vector2", "x y")):

    __slots__ = ()

    def __add__(self, other):
        return Vector2(self.x + other.x, self.y + other.y)

    def __sub__(self, other):
        return Vector2(self.x - other.x, self.y - other.y)

    def __mul__(self, other):
        return self.x * other.y - self.y * other.x

    def __neg__(self):
        return Vector2(-self.x, -self.y)

    def __pos__(self):
        return Vector2(+self.x, +self.y)

    def __abs__(self):
        return math.sqrt(float(self.x * self.x + self.y * self.y))

    def dotproduct(self, other):
        return self.x * other.x + self.y * other.y


def main():
    n = int(input())
    for i in range(n):
        [x1, y1, x2, y2, x3, y3, x4, y4] = [float(z) for z in input().split()]
        vector_ab = Vector2(x2 - x1, y2 - y1)
        vector_cd = Vector2(x4 - x3, y4 - y3)
        if abs(vector_ab * vector_cd) < LIMIT:
            print("YES")
        else:
            print("NO")


if __name__ == "__main__":
    main()