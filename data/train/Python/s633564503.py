

import sys


def norm2d(vec):
    return (vec[0]**2 + vec[1]**2)**0.5

def normalize(vec):
    l = norm2d(vec)
    vec[0] /= l
    vec[1] /= l
    return vec

lineNumber = 0

#for line in ["2", "0.0 0.0 -9.0 -9.0 1.0 0.0 2.0 1.0", "3.0 2.0 9.0 6.0 13.0 5.0 7.0 9.0"]:
for line in sys.stdin.readlines():
    lineNumber += 1

    if lineNumber == 1: continue

    # get data
    List = map(float, line.strip().split(" "))

    # set data
    a = [List[0], List[1]]
    b = [List[2], List[3]]
    c = [List[4], List[5]]
    d = [List[6], List[7]]

    vec1 = [a[0]-b[0], a[1]-b[1]]
    vec2 = [c[0]-d[0], c[1]-d[1]]

    #print vec1, vec2

    if vec1[0] < 0:
        vec1[0] *= -1
        vec1[1] *= -1
    if vec2[0] < 0:
        vec2[0] *= -1
        vec2[1] *= -1

    #print vec1, vec2

    vec1 = normalize(vec1)
    vec2 = normalize(vec2)

    #print vec1, vec2


    if     abs( vec1[0] - vec2[0] ) < 10**(-10) \
       and abs( vec1[1] - vec2[1] ) < 10**(-10):
        print "YES"
    else:
        print "NO"