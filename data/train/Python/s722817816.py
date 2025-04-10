# -*- coding:utf-8 -*-

import sys
import math

def solve(x1,y1,x2,y2,x3,y3):
    z1 = -1 * (x1**2 + y1**2)
    z2 = -1 * (x2**2 + y2**2)
    z3 = -1 * (x3**2 + y3**2)

    a11,a12,a13 = x1,y1,1
    a21,a22,a23 = x2,y2,1
    a31,a32,a33 = x3,y3,1
    det = a11*a22*a33 + a21*a32*a13 + a31*a12*a23 - a11*a32*a23 - a31*a22*a13 - a21*a12*a33

    l = ((a22*a33 - a23*a32)*z1 + (a13*a32 - a12*a33)*z2 + (a12*a23 - a13*a22)*z3)/det
    m = ((a23*a31 - a21*a33)*z1 + (a11*a33 - a13*a31)*z2 + (a13*a21 - a11*a23)*z3)/det
    n = ((a21*a32 - a22*a31)*z1 + (a12*a31 - a11*a32)*z2 + (a11*a22 - a12*a21)*z3)/det

    x,y,r = round(-l/2,3),round(-m/2,3),round(math.sqrt((l**2)/4+(m**2)/4-n),3)
    sol = [x, y, r]
    return sol


n,count = int(input()),0
array = []
for i in sys.stdin:
    array.append(i)
    count += 1
    if count == n:
        break

    
for i in range(len(array)):
    x = array[i]
    p = x.split()
    res = solve(float(p[0]),float(p[1]),float(p[2]),float(p[3]),float(p[4]),float(p[5]))
    print('{:.3f} {:.3f} {:.3f}'.format(res[0], res[1], res[2]))