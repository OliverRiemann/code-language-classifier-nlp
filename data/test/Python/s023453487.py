def perpendicular_bisector(p, q):
    x = (q[0] - p[0])
    y = (q[1] - p[1])
    return (2 * x, 2 * y, p[0]**2-q[0]**2+p[1]**2-q[1]**2)


def gauss_jordan_elimination(Array):
    # N???M??????Array
    N = len(Array)
    if N == 0:
        return (True, Array)
    else:
        M = len(Array[0])

    A = []
    for i in range(len(Array)):
        A.append(Array[i][:])

    pivot = 0
    L = min(N, M)
    while pivot < L:
        pivot_v = A[pivot][pivot]
        pivot_row = pivot
        for i in range(pivot + 1, L):
            v = max(A[i][pivot], -A[i][pivot])
            if pivot_v < v:
                pivot_row = i
                pivot_v = v
        if pivot_row > pivot:
            for i in range(M):
                A[pivot][i], A[pivot_row][i] = A[pivot_row][i], A[pivot][i]
        if pivot_v == 0:
            return ('False', A)
        inv_pivot = 1 / A[pivot][pivot]
        A[pivot][pivot] = 1
        for i in range(pivot + 1, M):
            A[pivot][i] *= inv_pivot
        for i in range(N):
            if i == pivot:
                continue
            t = -1 * A[i][pivot]
            A[i][pivot] = 0
            for j in range(pivot + 1, M):
                A[i][j] += t * A[pivot][j]
        pivot += 1
    return ('True', A)

n = int(input())
for _ in range(n):
    x1, y1, x2, y2, x3, y3 = map(float, input().split())
    a = list(perpendicular_bisector((x1, y1), (x2, y2)))
    b = list(perpendicular_bisector((x1, y1), (x3, y3)))
    c = [a, b]
    state, c = gauss_jordan_elimination(c)
    x = -c[0][2]
    y = -c[1][2]
    r = ((x - x1)**2 + (y - y1)**2)**0.5
    print('{0:.3f} {1:.3f} {2:.3f}'.format(round(x, 3), round(y, 3), round(r, 3)))