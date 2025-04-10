class vector(object):
    def __init__(self,a,b):
        self.x=b.x-a.x
        self.y=b.y-a.y
    @staticmethod
    def cross_product(a,b):
        return a.x*b.y-a.y*b.x
class vertex(object):
    def __init__(self,a):
        self.x=a[0]
        self.y=a[1]
class circle(object):
    def __init__(self,p,r):
        self.px=p.x
        self.py=p.y
        self.r=r
class triangle(object):
    def __init__(self,a,b,c):
        self.a=a
        self.b=b
        self.c=c
        import math
        self.ab=math.sqrt((self.a.x-self.b.x)**2+(self.a.y-self.b.y)**2)
        self.bc=math.sqrt((self.b.x-self.c.x)**2+(self.b.y-self.c.y)**2)
        self.ca=math.sqrt((self.c.x-self.a.x)**2+(self.c.y-self.a.y)**2)
        c=self.ab
        a=self.bc
        b=self.ca
        self.cosA=(b**2+c**2-a**2)/(2*b*c)
        self.cosB=(a**2+c**2-b**2)/(2*a*c)
        self.cosC=(b**2+a**2-c**2)/(2*b*a)
        self.sinA=math.sqrt(1-self.cosA**2)
        self.sinB=math.sqrt(1-self.cosB**2)
        self.sinC=math.sqrt(1-self.cosC**2)
        self.sin2A=2*self.sinA*self.cosA
        self.sin2B=2*self.sinB*self.cosB
        self.sin2C=2*self.sinC*self.cosC
    def area(self):
        import math
        s=(self.ab+self.bc+self.ca)/2
        S=math.sqrt(s*(s-self.ab)*(s-self.bc)*(s-self.ca))
        return S
    def circumscribed(self):
        R=self.ab/(2*self.sinC)
        px=(self.sin2A*self.a.x+self.sin2B*self.b.x+self.sin2C*self.c.x)/(self.sin2A+self.sin2B+self.sin2C)
        py=(self.sin2A*self.a.y+self.sin2B*self.b.y+self.sin2C*self.c.y)/(self.sin2A+self.sin2B+self.sin2C)
        px=round(px,3)
        py=round(py,3)
        R=round(R,3)
        p=vertex((px,py))
        return circle(p,R)
    def isin(self,p):
        AB=vector(self.a,self.b)
        BC=vector(self.b,self.c)
        CA=vector(self.c,self.a)
        AP=vector(self.a,p)
        BP=vector(self.b,p)
        CP=vector(self.c,p)
        if (vector.cross_product(AB,AP)>0 and vector.cross_product(BC,BP)>0 and vector.cross_product(CA,CP)>0)or(vector.cross_product(AB,AP)<0 and vector.cross_product(BC,BP)<0 and vector.cross_product(CA,CP)<0):
            return 'YES'
        else:return 'NO'
A=[]
B=[]
C=[]
p=[]
import sys
for line in sys.stdin:
    a,b,c,d,e,f,g,h=list(map(float,line.split()))
    A.append(vertex((a,b)))
    B.append(vertex((c,d)))
    C.append(vertex((e,f)))
    p.append(vertex((g,h)))
for i in range(len(A)):
    Triangle=triangle(A[i],B[i],C[i])
    print(Triangle.isin(p[i]))