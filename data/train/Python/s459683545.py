Masu = []
def access(x,y):
    if x < 0 or y < 0 or x > 9 or y > 9:
        return
    Masu[y][x] += 1

for i in range(10):
    Masu.append([0,0,0,0,0,0,0,0,0,0])
kosu = 0
komax = 0
while True:
    try:
        
        x,y,s = map(int,input().split(","))
        if s == 1:
            for j in range(3):
                access(y +1 - j,x)
            access(y,x - 1)
            access(y,x + 1)

        elif s == 2:
            for k in range(3):
                for l in range(3):
                    access(y + 1 - k,x + 1 -l)
        elif s == 3:
            for k in range(3):
                for l in range(3):
                    access(y + 1 - k,x + 1 -l)
            access(y - 2,x)
            access(y + 2,x)
            access(y,x + 2)
            access(y,x - 2)
               
    except (EOFError,ValueError):
        for i in range(10):
            kosu += Masu[i].count(0)
        for j in range(10):
            if komax < max(Masu[j]):
                komax = max(Masu[j])
        print(kosu)
        print(komax)
        break