# -*- coding: utf-8 -*-

import sys


def prod2d(vec1, vec2):
    return vec1[0]*vec2[1] - vec1[1]*vec2[0]

lineNumber = 0
#for line in [ "0.0 0.0 2.0 0.0 2.0 2.0 1.5 0.5", "0.0 0.0 1.0 4.0 5.0 3.0 -1.0 3.0"]:
for line in sys.stdin.readlines():
    lineNumber += 1

    # get data
    List = map(float, line.strip().split())

    # set data
    nodes = [ [List[0], List[1]], [List[2], List[3]], [List[4], List[5]] ]
    point = [List[6], List[7]]

    
    ABvec = [ nodes[1][0] - nodes[0][0], nodes[1][1] - nodes[0][1] ]
    BCvec = [ nodes[2][0] - nodes[1][0], nodes[2][1] - nodes[1][1] ]
    CAvec = [ nodes[0][0] - nodes[2][0], nodes[0][1] - nodes[2][1] ]
    APvec = [ point[0] - nodes[0][0], point[1] - nodes[0][1] ]
    BPvec = [ point[0] - nodes[1][0], point[1] - nodes[1][1] ]
    CPvec = [ point[0] - nodes[2][0], point[1] - nodes[2][1] ]

    a = prod2d(CAvec, APvec)
    b = prod2d(ABvec, BPvec)
    c = prod2d(BCvec, CPvec)

    if   a > 0 and b > 0 and c > 0: print "YES"
    elif a < 0 and b < 0 and c < 0: print "YES"
    else                          : print "NO"