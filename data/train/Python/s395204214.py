###
### atcorder test program
###

import sys

### math class
class math:
    ### pi
    pi = 3.14159265358979323846264338

    ### GCD
    def gcd(self, a, b):
        if b == 0:
            return a
        return self.gcd(b, a%b)

    ### LCM
    def lcm(self, a, b):
        return (a*b)//self.gcd(a,b)

math = math()

### output class
class output:
    ### list
    def list(self, l):
        l = list(l)
        print(" ", end="")
        for i, num in enumerate(l):
            print(num, end="")
            if i != len(l)-1:
                print(" ", end="")
        print()

output = output()

### input sample
#i = input()
#A, B, C = [x for x in input().split()]
#inlist = [int(w) for w in input().split()]
#R = float(input())
#A = [int(x) for x in input().split()]
#for line in sys.stdin.readlines():
#    x, y = [int(temp) for temp in line.split()]

### output sample
#print("{0} {1} {2:.5f}".format(A//B, A%B, A/B))
#print("{0:.6f} {1:.6f}".format(R*R*math.pi,R*2*math.pi))
#print(" {}".format(i), end="")

m = 100000

for i in range(int(input())):
    m *= 1.05
    if m%1000 != 0:
        m = (m//1000+1) * 1000
    else:
        m = (m//1000) * 1000

print(int(m))

