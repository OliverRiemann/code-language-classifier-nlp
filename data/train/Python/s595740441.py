from math import sqrt

def circle(x1, y1, x2, y2, x3, y3):
    if x1 == 0:
        dx = 1
        x1 = x1 + dx
        x2 = x2 + dx
        x3 = x3 + dx
    else:
        dx = 0
    if y2 == 0:
        dy = 1
        y1 = y1 + dy
        y2 = y2 + dy
        y3 = y3 + dy
    else:
        dy = 0
    A = [[x1, y1, 1, 1, 0, 0],[x2, y2, 1, 0, 1, 0],[x3, y3, 1, 0, 0, 1]]
#    print(A)
    for i in range(3):
        A[0] = [x/A[0][0] for x in A[0]]
        A[1] = [A[1][j] - A[1][0] * A[0][j] for j in range(6)]
        A[2] = [A[2][j] - A[2][0] * A[0][j] for j in range(6)]
#        print(A)
        for j in range(3):
            A[j] = A[j][1:] + A[j][:1]
        A = A[1:] + A[:1]
#        print(A)
    for i in range(3):
        A[i] = A[i][:3]
#    print(A)
    V = [-x1**2-y1**2, -x2**2-y2**2, -x3**2-y3**2]
    M = [(A[i][0] * V[0] + A[i][1] * V[1] + A[i][2] * V[2]) for i in range(3)]
    xcenter = -0.5 * M[0] - dx
    ycenter = -0.5 * M[1] - dy
    radius = sqrt((M[0]**2) /4 + (M[1]**2) /4 - M[2])
    return xcenter, ycenter, radius

n = int(input())
for line in range(n):
    x1, y1, x2, y2, x3, y3 = map(float, input().split())
    xc, yc, ra = circle(x1, y1, x2, y2, x3, y3)
    print('%.3f %.3f %.3f' % (xc, yc, ra))