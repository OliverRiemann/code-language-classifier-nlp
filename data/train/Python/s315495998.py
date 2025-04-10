p = [[0 for i in range(14)] for j in range(14)]
while True:
    try:
        x_inp, y_inp, s = map(int, input().split(","))
        x = x_inp + 2
        y = y_inp + 2
        if s == 1:
            p[y-1][x] = p[y-1][x] + 1
            p[y][x-1] = p[y][x-1] + 1
            p[y][x]   = p[y][x]   + 1
            p[y][x+1] = p[y][x+1] + 1
            p[y+1][x] = p[y+1][x] + 1
        elif s == 2:
            p[y-1][x-1] = p[y-1][x-1] + 1
            p[y-1][x]   = p[y-1][x]   + 1
            p[y-1][x+1] = p[y-1][x+1] + 1
            p[y][x-1]   = p[y][x-1]   + 1
            p[y][x]     = p[y][x]     + 1
            p[y][x+1]   = p[y][x+1]   + 1
            p[y+1][x-1] = p[y+1][x-1] + 1
            p[y+1][x]   = p[y+1][x]   + 1
            p[y+1][x+1] = p[y+1][x+1] + 1
        else:
            p[y-2][x] += 1
            p[y-1][x-1] = p[y-1][x-1] + 1
            p[y-1][x]   = p[y-1][x]   + 1
            p[y-1][x+1] = p[y-1][x+1] + 1
            p[y][x-2]   = p[y][x-2]   + 1
            p[y][x-1]   = p[y][x-1]   + 1
            p[y][x]     = p[y][x]     + 1
            p[y][x+1]   = p[y][x+1]   + 1
            p[y][x+2]   = p[y][x+2]   + 1
            p[y+1][x-1] = p[y+1][x-1] + 1
            p[y+1][x]   = p[y+1][x]   + 1
            p[y+1][x+1] = p[y+1][x+1] + 1
            p[y+2][x] += 1
    except:
        break
p_trim = [p[i][2:12] for i in range(2,12)]
p_flatten = sum(p_trim,[])
print(sum(x==0 for x in p_flatten))
print(max(p_flatten))

