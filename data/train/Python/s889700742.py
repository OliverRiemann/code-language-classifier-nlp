import math,string,itertools,fractions,heapq,collections,re,array,bisect,sys,random,time,copy,functools

sys.setrecursionlimit(10**7)
inf = 10**20
eps = 1.0 / 10**13
mod = 10**9+7
dd = [(-1,0),(0,1),(1,0),(0,-1)]
ddn = [(-1,0),(-1,1),(0,1),(1,1),(1,0),(1,-1),(0,-1),(-1,-1)]

def LI(): return [int(x) for x in sys.stdin.readline().split()]
def LI_(): return [int(x)-1 for x in sys.stdin.readline().split()]
def LF(): return [float(x) for x in sys.stdin.readline().split()]
def LS(): return sys.stdin.readline().split()
def I(): return int(sys.stdin.readline())
def F(): return float(sys.stdin.readline())
def S(): return input()
def pf(s): return print(s, flush=True)

def distance(x1, y1, x2, y2):
    return math.sqrt((x1-x2)**2 + (y1-y2)**2)

def intersection(a1, a2, b1, b2):
    x1,y1 = a1
    x2,y2 = a2
    x3,y3 = b1
    x4,y4 = b2

    ksi = (y4 - y3) * (x4 - x1) - (x4 - x3) * (y4 - y1)
    eta = (x2 - x1) * (y4 - y1) - (y2 - y1) * (x4 - x1)
    delta = (x2 - x1) * (y4 - y3) - (y2 - y1) * (x4 - x3)
    if delta == 0:
        return None
    ramda = ksi / delta;
    mu = eta / delta;
    if ramda >= 0 and ramda <= 1 and mu >= 0 and mu <= 1:
        return (x1 + ramda * (x2 - x1), y1 + ramda * (y2 - y1))

    return None

def circumcenters(a,b,c):
    t1 = [(a[0]+b[0])/2, (a[1]+b[1])/2]
    s1 = [t1[1]-a[1], a[0]-t1[0]]
    t2 = [(a[0]+c[0])/2, (a[1]+c[1])/2]
    s2 = [t2[1]-a[1], a[0]-t2[0]]
    p1 = [t1[0]+s1[0]*1e7, t1[1]+s1[1]*1e7]
    p2 = [t1[0]-s1[0]*1e7, t1[1]-s1[1]*1e7]
    p3 = [t2[0]+s2[0]*1e7, t2[1]+s2[1]*1e7]
    p4 = [t2[0]-s2[0]*1e7, t2[1]-s2[1]*1e7]
    return intersection(p1,p2,p3,p4)

def main():
    n = I()
    rr = []
    for _ in range(n):
        x1,y1,x2,y2,x3,y3 = LF()
        a = [x1,y1]
        b = [x2,y2]
        c = [x3,y3]
        t = circumcenters(a,b,c)
        rr.append('{:0.3f} {:0.3f} {:0.3f}'.format(t[0], t[1], distance(t[0],t[1],x1,y1)))

    return '\n'.join(rr)


print(main())

