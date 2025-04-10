from __future__ import (division, absolute_import, print_function,
                        unicode_literals)
from sys import stdin
from operator import attrgetter
from collections import namedtuple

Point = namedtuple('Point', 'x y')

def linear(p1, p2):
    gradient = (p1.y - p2.y) / (p1.x - p2.x)
    y_intercept = p1.y - gradient * p1.x
    return lambda x: gradient * x + y_intercept

def takeout(seq):
    gen = (Point(next(seq), next(seq)) for _ in xrange(3))
    for p in sorted(gen, key=attrgetter('x')):
        yield p
    yield Point(next(seq), next(seq))

for line in stdin:
    A, B, C, P = takeout(float(s) for s in line.split())
    assert A.x <= B.x <= C.x
    if P.x <= A.x or C.x <= P.x:
        print('NO')
        continue
    if A.x == B.x or B.x <= P.x <= C.x:
        L = (linear(B, C), linear(A, C))
    elif B.x == C.x or A.x <= P.x <= B.x:
        L = (linear(A, B), linear(A, C))
    else:
        print('NO')
        continue

    y1, y2 = sorted(f(P.x) for f in L)
    if y1 < P.y < y2:
        print('YES')
    else:
        print('NO')