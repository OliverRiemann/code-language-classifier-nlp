import sys


def gcd(a, b):
    return gcd(b, a % b) if a % b else b


def lcm(a, b):
    return a * b / gcd(a, b)

for line in sys.stdin:
    data = map(int, line.split())
    a, b, c, d, e, f = data
    if a == 0:
        y = c * 1.0 / b
        x = (f - e * y) * 1.0 / d
        print "%.3f %.3f" % (round(x, 4), round(y, 4))
        continue
    if b == 0:
        x = c * 1.0 / a
        y = (f - d * x) * 1.0 / e
        print "%.3f %.3f" % (round(x, 4), round(y, 4))
        continue
    if d == 0:
        y = f * 1.0 / e
        x = (c - b * y) * 1.0 / a
        print "%.3f %.3f" % (round(x, 4), round(y, 4))
        continue
    if e == 0:
        x = f * 1.0 / d
        y = (c - a * x) * 1.0 / b
        print "%.3f %.3f" % (round(x, 4), round(y, 4))
        continue

    ix = lcm(a, d) / a
    jx = lcm(a, d) / d
    iy = lcm(b, e) / b
    jy = lcm(b, e) / e
    x = (c*1.0*iy - f*jy) / (a*iy - d*jy)
    y = (c*1.0*ix - f*jx) / (b*ix - e*jx)
    print "%.3f %.3f" % (round(x, 4), round(y, 4))