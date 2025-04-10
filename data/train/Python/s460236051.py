# -*- coding: utf-8 -*-

import sys

def prod_mat_vec(A, vec):
    ret = [0 for i in xrange(3)]
    for i in xrange(3):
        for j in xrange(3):
            ret[i] += A[i][j] * vec[j]
    return ret


def changerow(A, i1, i2):
    for j in xrange(3):
        buf = A[i1][j]
        A[i1][j] = A[i2][j]
        A[i2][j] = buf
    return A


def MatrixInverse3x3(A_src):
    A = [ [A_src[i][j] for j in xrange(3)] for i in xrange(3) ] # deepcopy A_src -> A
    B = [ [1, 0, 0], \
          [0, 1, 0], \
          [0, 0, 1]  ]
    
    for i in xrange(3):
        if A[i][i] == 0:
            for k in xrange(i+1, 3):
                if A[k][k] != 0:
                    A = changerow(A, i, k)
                    B = changerow(B, i, k)
        a = A[i][i]

        for j in xrange(3):
            A[i][j] /= a
            B[i][j] /= a

        for k in xrange(3):
            if i == k: continue
            a = A[k][i]
            for j in xrange(3):
                A[k][j] -= A[i][j] * a
                B[k][j] -= B[i][j] * a
    return B


def output3x3(A):
    for i in xrange(3):
        print "%7.3f %7.3f %7.3f" % (A[i][0], A[i][1], A[i][2])
    return


#for line in ["0.0 3.0 -1.0 0.0 -3.0 4.0"]: # expected [-2.000, 2.000, 2.236]
for line in sys.stdin.readlines():
    List = map(float, line.strip().split())
    if len(List) == 1: continue
    [x1, y1, x2, y2, x3, y3] = List

    A = [ [x1, y1, 1.0] ,\
          [x2, y2, 1.0] ,\
          [x3, y3, 1.0]  ]
    vec = [x1**2+y1**2, x2**2+y2**2, x3**2+y3**2]

    B = MatrixInverse3x3(A)
    lmn = prod_mat_vec(B, vec)

    ans = [0.5*lmn[0], 0.5*lmn[1], (lmn[2]+0.25*lmn[0]**2+0.25*lmn[1]**2)**0.5]
    print "%.3f %.3f %.3f" % (ans[0], ans[1], ans[2])
    
    
    