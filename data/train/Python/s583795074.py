pap = [[0 for x in range(10)] for y in range(10)]

def brot(x,y,s):
    if s==1:
        for dx in range(-1,+1+1):
            for dy in range(-1,+1+1):
                px = x + dx    
                py = y + dy
                if abs(dx)+abs(dy)<2 and px in range(0,10) and py in range(0,10):
                    pap[py][px] += 1
    elif s==2:
        for dx in range(-1,+1+1):
            for dy in range(-1,+1+1):
                px = x + dx    
                py = y + dy
                if px in range(0,10) and py in range(0,10):
                    pap[py][px] += 1
    elif s==3:
        for dx in range(-2,+2+1):
            for dy in range(-2,+2+1):
                px = x + dx    
                py = y + dy
                if abs(dx)+abs(dy)<3 and px in range(0,10) and py in range(0,10):
                    pap[py][px] += 1
    else:
        raise(ValueError) 

def ans():
    bmax = 0
    wcount = 0
    for y in range(0,+9+1):
        for x in range(0,+9+1):
            b = pap[y][x]
            if b > bmax:
                bmax = b
            elif b == 0:
                wcount += 1
    return(wcount,bmax)

while True:
    try:
        x,y,s = list(map(int, input().split(',')))
        brot(x,y,s)
    except EOFError:
       break

print("%d\n%d" % ans())