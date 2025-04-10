import math

class P(object):
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def width(self, p):
        return math.sqrt((self.x - p.x)**2 + (self.y - p.y)**2)

    def __repr__(self):
        return '{0:.3f} {1:.3f}'.format(self.x, self.y)

def calc_cos(a,b,c):
    return (b**2 + c**2 - a**2) / (2*b*c)

def calc_sin(c):
    return math.sqrt(1 - c**2)

def calc_2sin(s,c):
    return 2 * s * c

def run():
    n = int(input())
    for _ in range(n):
        x1, y1, x2, y2, x3, y3 = list(map(float, input().split()))
        p1, p2, p3 = P(x1, y1), P(x2, y2), P(x3, y3)
        a, b, c = p1.width(p2), p2.width(p3), p3.width(p1)
        cosA, cosB, cosC = calc_cos(a,b,c), calc_cos(b,c,a), calc_cos(c,a,b)
        sinA, sinB, sinC = calc_sin(cosA), calc_sin(cosB), calc_sin(cosC)
        sin2A, sin2B, sin2C = calc_2sin(sinA, cosA), calc_2sin(sinB, cosB), calc_2sin(sinC, cosC)

        r = a / sinA / 2

        x = (p1.x * sin2B + p2.x * sin2C + p3.x * sin2A) / (sin2A + sin2B + sin2C)
        y = (p1.y * sin2B + p2.y * sin2C + p3.y * sin2A) / (sin2A + sin2B + sin2C)

        print('{0:.3f} {1:.3f} {2:.3f}'.format(x,y,r))

if __name__ == '__main__':
    run()


