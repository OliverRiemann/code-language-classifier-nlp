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
n=eval(input())
p1=[]
p2=[]
p3=[]
for i in range(n):
    a,b,c,d,e,f=list(map(float,input().split()))
    p1.append(vertex((a,b)))
    p2.append(vertex((c,d)))
    p3.append(vertex((e,f)))
for i in range(n):
    Triangle=triangle(p1[i],p2[i],p3[i])
    Circle=Triangle.circumscribed()
    print('%.3f %.3f %.3f'%(Circle.px,Circle.py,Circle.r))