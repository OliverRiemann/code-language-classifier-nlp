import sys

b = [ list(0 for i in range(14)) for j in range(14)]

def s(b,x,y):
    b[x][y]   += 1
    b[x+1][y] += 1
    b[x-1][y] += 1
    b[x][y+1] += 1
    b[x][y-1] += 1

def m(b,x,y):
    b[x-1][y-1] += 1
    b[x  ][y-1] += 1
    b[x+1][y-1] += 1
    b[x-1][y  ] += 1
    b[x  ][y  ] += 1
    b[x+1][y  ] += 1
    b[x-1][y+1] += 1
    b[x  ][y+1] += 1
    b[x+1][y+1] += 1

def l(b,x,y):
    b[x  ][y-2] += 1

    b[x-1][y-1] += 1
    b[x  ][y-1] += 1
    b[x+1][y-1] += 1

    b[x-2][y  ] += 1
    b[x-1][y  ] += 1
    b[x  ][y  ] += 1
    b[x+1][y  ] += 1
    b[x+2][y  ] += 1

    b[x-1][y+1] += 1
    b[x  ][y+1] += 1
    b[x+1][y+1] += 1

    b[x  ][y+2] += 1

for line in sys.stdin:
    d = list(map(int,line.split(",")))

    c = d[2]
    x = d[0] + 2
    y = d[1] + 2

    if c == 1:
        s(b,x,y)
    elif c == 2:
        m(b,x,y)
    elif c == 3:
        l(b,x,y)

ttl = 0
num = 0
max = 0
for x in range(2,12):
    for y in range(2,12):
        ttl += 1
        if b[x][y] == 0:
            num += 1
        if b[x][y] > max:
            max = b[x][y]
            
print(num)
print(max)