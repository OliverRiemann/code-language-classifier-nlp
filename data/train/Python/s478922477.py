from math import *
def g(x):
    y = (int((1000 * abs(x)) * 2 + 1) // 2) / 1000
    if x < 0:
        y *= -1
    return y
'''
def f(x):
    a = (x[2] - x[4]) * (x[1] - x[3]) - (x[0] - x[2]) * (x[3] - x[5])
    b = (x[0] - x[2]) * (x[4] - x[0]) - (x[5] - x[1]) * (x[1] - x[3])
    l = 0.5 * b / a
    X = 0.5 * x[2] + 0.5 * x[4] + l * (x[3] - x[5])
    Y = 0.5 * x[3] + 0.5 * x[5] + l * (x[4] - x[2])
    R = sqrt((X - x[0]) ** 2 + (Y - x[1]) ** 2)
    X = g(X)
    Y = g(Y)
    R = g(R)
    print("{0:.3f} {1:.3f} {2:.3f}".format(X, Y, R))
'''
def f(x):
    x1, y1, x2, y2, x3, y3 = x
    X1 = x1 - x3
    Y1 = y1 - y3
    X2 = x2 - x3
    Y2 = y2 - y3
    k  = (X2 ** 2 + Y2 ** 2 -X1 * X2 - Y1 * Y2) / (2 * (X2 * Y1 - X1 * Y2))
    X  = X1 / 2 + k * Y1 + x3
    Y  = Y1 / 2 - k * X1 + y3
    R = sqrt((X - x1) ** 2 + (Y - y1) ** 2)
    X = g(X)
    Y = g(Y)
    R = g(R)
    print("{0:.3f} {1:.3f} {2:.3f}".format(X, Y, R))

n = int(input())
a = []
for _ in range(n):
    a.append(list((map(float, input().split()))))
for i in a:
    f(i)

