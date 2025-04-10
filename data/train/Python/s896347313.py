E = 10**-10

def cp(a, b):
    c = [a[1]*b[2] - a[2]*b[1],
        a[2]*b[0] - a[0]*b[2],
        a[0]*b[1] - a[1]*b[0]]
    return c

while True:
    try:
        x1,y1,x2,y2,x3,y3,xp,yp = [float(i) for i in input().split()]
        ax = x3-x1
        ay = y3-y1
        bx = x1-x2
        by = y1-y2
        cx = x2-x3
        cy = y2-y3
        pax = xp-x1
        pay = yp-y1
        pbx = xp-x2
        pby = yp-y2
        pcx = xp-x3
        pcy = yp-y3
        ca = [bx,by,0]
        ab = [cx,cy,0]
        bc = [ax,ay,0]
        pa = [pax,pay,0]
        pb = [pbx,pby,0]
        pc = [pcx,pcy,0]
        cp1 = cp(ca,pa)[2]
        cp2 = cp(ab,pb)[2]
        cp3 = cp(bc,pc)[2]
        if abs(cp1 - abs(cp1)) < E:
            sig1 = 1
        elif abs(cp1 + abs(cp1)) < E:
            sig1 = -1
        if abs(cp2 - abs(cp2)) < E:
            sig2 = 1
        elif abs(cp2 + abs(cp2)) < E:
            sig2 = -1
        if abs(cp3 - abs(cp3)) < E:
            sig3 = 1
        elif abs(cp3 + abs(cp3)) < E:
            sig3 = -1
        if abs(sig1 + sig2 + sig3) == 3:
            print('YES')
        else:
            print('NO')
    except EOFError:
        break


