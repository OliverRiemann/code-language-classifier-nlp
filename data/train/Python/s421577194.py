import math,string,itertools,fractions,heapq,collections,re,array,bisect,sys,random,time,copy
 
sys.setrecursionlimit(10**7)
inf = 10**20
mod = 10**9 + 7
 
def LI(): return [int(x) for x in sys.stdin.readline().split()]
def LF(): return [float(x) for x in sys.stdin.readline().split()]
def LS(): return sys.stdin.readline().split()
def I(): return int(sys.stdin.readline())
def F(): return float(sys.stdin.readline())
def S(): return input()
 
 
class Matrix():
    def __init__(self, A):
        self.A = A
        self.row = len(A)
        self.col = len(A[0])
 
    def __iter__(self):
        return self.A.__iter__()
 
    def __getitem__(self, i):
        return self.A.__getitem__(i)
 
    def __add__(self, B):
        aa = self.A
        bb = B.A
        return Matrix([[aa[i][j] + bb[i][j] for j in range(self.col)] for i in range(self.row)])
 
    def __sub__(self, B):
        aa = self.A
        bb = B.A
        return Matrix([[aa[i][j] - bb[i][j] for j in range(self.col)] for i in range(self.row)])
 
    def __mul__(self, B):
        aa = self.A
        bb = B.A
        a = []
        for i in range(self.row):
            ai = aa[i]
            r = []
            for j in range(B.col):
                r.append(sum([ai[k] * bb[k][j] for k in range(self.col)]))
            a.append(r)
        return Matrix(a)
 
    def __truediv__(self, x):
        pass
 
    def lu(self):
        size = self.row
        T = copy.deepcopy(self.A)
        L = [[0]*size for _ in range(size)]
        U = [[0]*size for _ in range(size)]
        for i in range(size):
            for j in range(i,size):
                L[j][i] = T[j][i]
            for j in range(i,size):
                U[i][j] = T[i][j] / T[i][i]
            for j in range(i+1,size):
                for k in range(i+1,size):
                    T[j][k] -= L[j][i] * U[i][k]
 
        return Matrix(L),Matrix(U)
 
    def __str__(self):
        return self.A.__str__()
 
def solve_se(A, b):
    n = A.row
    L,U = A.lu()
    y = []
    for i in range(n):
        t = b[i]
        for k in range(i):
            t -= L[i][k] * y[k]
        y.append(t / L[i][i])
 
    x = [0] * n
    for i in range(n-1,-1,-1):
        t = y[i]
        for k in range(i+1,n):
            t -= U[i][k] * x[k]
        x[i] = t
    return x
 
 
def main():
    sa = [s for s in sys.stdin.read().split('\n') if s]
    r = []
    for s in sa:
        a,b,c,d,e,f = [int(c) for c in s.split()]
        A = Matrix([[a,b],[d,e]])
        B = [c,f]
        x = solve_se(A,B)
        r.append(' '.join(map(lambda t: '{:01.3f}'.format(1.0*t), x)))
 
    return '\n'.join(r)
 
print(main())
