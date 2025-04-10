#coding: utf-8
def solve(a, b, c, d, e, f):
    agn = a*e - b*d
    x = (e*c - b*f)/float(agn)
    y = (-d*c + a*f)/float(agn)
    if x == 0.: x = 0.
    if y == 0.: y = 0.
    return (x, y)
   
while 1:
    try:
        n = input()
        for i in xrange(n):
            x = [0 for i in xrange(3)]
            y = [0 for i in xrange(3)]
            a,b,t = [[0 for i in xrange(2)] for i in xrange(3)]
            p,q,s = [[0 for i in xrange(2)] for i in xrange(3)]
            x[0],y[0],x[1],y[1],x[2],y[2] = map(float, raw_input().split())
            for j in xrange(2):
                a[j] = (x[j+1] + x[j])/2
                b[j] = (y[j+1] + y[j])/2
                if x[j+1] - x[j] == 0.:
                    p[j] = 0.
                    q[j] = -1.
                    s[j] = -b[j]
                elif y[j+1] - y[j] == 0.:
                    p[j] = -1.
                    q[j] = 0.
                    s[j] = -a[j]
                else:
                    t[j] = (y[j+1] - y[j]) / (x[j+1] - x[j])
                    p[j] = -1./t[j]
                    q[j] = -1.
                    s[j] = -(a[j]/t[j])-b[j]
            c = solve(p[0], q[0], s[0], p[1], q[1], s[1])
            r = ((x[0]-c[0])**2 + (y[0]-c[1])**2)**0.5
            print "%.3f %.3f %.3f" % (c[0], c[1], r)
    except EOFError:
        break