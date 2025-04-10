a = [[0 for i2 in range(10)] for i1 in range(10)]

def small_ink(x,y):
    a[x][y] += 1
    a[x-1][y] += 1
    try:
        a[x+1][y] += 1
    except:
        pass
    a[x][y-1] += 1
    try:
        a[x][y+1] += 1
    except:
        pass
    if x-1 < 0:
        a[x-1][y] -= 1
    if y-1 < 0:
        a[x][y-1] -= 1
    return 0

def mid_ink(x,y):
    for i in [-1,0,1]:
        for j in [-1,0,1]:
            if 9 >= x+i >= 0 and 9>= y+j >= 0:
                a[x+i][y+j] += 1
    return 0

def big_ink(x,y):
    mid_ink(x,y)
    a[x-2][y] += 1
    try:
        a[x+2][y] += 1
    except:
        pass
    a[x][y-2] += 1
    try:
        a[x][y+2] += 1
    except:
        pass
    if x-2 < 0:
        a[x-2][y] -= 1
    if y-2 < 0:
        a[x][y-2] -= 1
    return 0

def ink(x,y,s):
    if s == 1:
        small_ink(x,y)
    if s == 2:
        mid_ink(x,y)
    if s == 3:
        big_ink(x,y)
    return 0

while True:
    try:
        x,y,s = map(int,input().split(','))
        ink(x,y,s)
    except EOFError:
        break
nu = 0
for i in range(10):
    for j in range(10):
        if a[i][j] == 0:
            nu += 1
print(nu)
max_val = 0
for i in range(10):
    for j in range(10):
        if a[i][j] > max_val:
            max_val = a[i][j]
print(max_val)