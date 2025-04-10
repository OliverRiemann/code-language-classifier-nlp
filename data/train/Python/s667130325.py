# -*- coding: utf-8 -*-

import sys

def length(a, b):
    return ((a[0] - b[0])**2 + (a[1] - b[1])**2)**0.5

def solve_sim_equ(a, b, c, d, e, f):
    '''
    From Problem 0004.
    This function solves following equation.
    ax + by = c
    dx + ey = f
    '''
    if a==0 and d==0:
        if b==0 and e==0:
            return 0., 0.
        if b != 0:
            return 0., c/b+0.
        else:
            return 0., f/e+0.
    elif b==0 and e==0:
        if a != 0:
            return 0., d/a+0.
        else:
            return 0., a/d+0.

    if b == 0:
        a, d = d, a
        b, e = e, b
        c, f = f, c
    g = e / b
    x = (g*c - f) / (g*a - d)
    y = (c - a*x) / b
    return x+0., y+0.


def circumscribed_circle(x, y, z):
    def get_equ_coef(p, q):
        h_x = (p[0] + q[0]) / 2
        h_y = (p[1] + q[1]) / 2
        a = q[1] - p[1]
        b = p[0] - q[0]
        c = b * h_x - a * h_y
        return b, -a, c
    coef = get_equ_coef(x, y) + get_equ_coef(y, z)
    center = solve_sim_equ(*coef)
    r = length(center, x)
    return center, r


def main():
    N = int(input())
    for i in range(N):
        vs = [float(v) for v in input().split()]
        a = (vs[0], vs[1])
        b = (vs[2], vs[3])
        c = (vs[4], vs[5])
        center, r = circumscribed_circle(a, b, c)
        print('{0:.3f} {1:.3f} {2:.3f}'.format(center[0], center[1], r))


if __name__ == '__main__':
    main()