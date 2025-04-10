def stl1(x):
    if a == e:
        y = b
    else:
        y = (f-b)*(x-a)/(e-a) +b

    return(y)

def stl2(x):
    if c == e:
        y = f
    else:
        y = (d-f)*(x-e)/(c-e) +f

    return(y)

def stl3(x):
    if c == a:
        y = b
    else:
        y = (d-b)*(x-a)/(c-a) +b
        
    return(y)

while True:
    try:
        lst = list(map(float, input().split()))
        point1 = [lst[0], lst[1]]
        point2 = [lst[2], lst[3]]
        point3 = [lst[4], lst[5]]
        xp, yp = lst[6], lst[7]

        pointlst = [point1, point2, point3]
        pointlst.sort()
        a, b, e, f, c, d = pointlst[0][0], pointlst[0][1], pointlst[1][0], pointlst[1][1], pointlst[2][0], pointlst[2][1]

        if a <= xp and xp <= e:
            bdr1 = stl1(xp)
            bdr3 = stl3(xp)

            if min(bdr1, bdr3) <= yp and yp <= max(bdr1, bdr3):
                print("YES")

            else:
                print("NO")
        
        elif e < xp and xp <= c:
            bdr2 = stl2(xp)
            bdr3 = stl3(xp)

            if min(bdr2, bdr3) <= yp and yp <= max(bdr2, bdr3):
                print("YES")
            
            else:
                print("NO")

        else:
            print("NO")

    except EOFError:
        break
