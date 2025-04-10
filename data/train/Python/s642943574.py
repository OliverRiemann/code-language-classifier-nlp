# -*- coding: utf-8 -*-
from math import sqrt
# import numpy as np


n = int(input())

for i in range(n):
    tmp = input().split(' ')
    
    a, b, c = [(float(tmp[i]), float(tmp[i+1])) for i in range(0, len(tmp), 2)]
    
    #A = np.array(((a[0], a[1], 1),
    #              (b[0], b[1], 1),
    #              (c[0], c[1], 1)))
    A_tmp1 = 1/(a[0]*b[1] + a[1]*c[0] + b[0]*c[1] - b[1]*c[0] - a[1]*b[0] - a[0]*c[1])
    A_tmp2 = [[b[1]-c[1], -(a[1]-c[1]), a[1]-b[1]],
              [-(b[0]-c[0]),  (a[0]-c[0]), -(a[0]-b[0])],
              [b[0]*c[1] - b[1]*c[0], -(a[0]*c[1] - a[1]*c[0]), a[0]*b[1] - a[1]*b[0]]]
    A = [list(map(lambda x: A_tmp1*x, A_tmp2[i])) for i in range(3)]
    
    #B = np.array((((-(a[0]**2 + a[1]**2))),
    #              ((-(b[0]**2 + b[1]**2))),
    #              ((-(c[0]**2 + c[1]**2)))))
    B = [[-(a[0]**2 + a[1]**2)],
         [-(b[0]**2 + b[1]**2)],
         [-(c[0]**2 + c[1]**2)]]
    
    
    tmp = [sum([A[i][j]*B[j][0] for j in range(3)]) for i in range(3)]
    # tmp = np.dot(np.linalg.inv(A), B)
    
    x = -tmp[0]/2
    y = -tmp[1]/2
    r = sqrt((tmp[0]**2 + tmp[1]**2 - 4*tmp[2])/4)
    
    print('{:.3f} {:.3f} {:.3f}'.format(x, y, r))
