paper = [[0 for i in range(10)] for j in range(10)]
while True :
    try :
        x, y, s = map(int, input().split(","))
        
        paper[x][y] += 1
        if x > 0 :
            paper[x-1][y] += 1
        if y > 0 :
            paper[x][y-1] += 1
        if x < 9 :
            paper[x+1][y] += 1
        if y < 9 :
            paper[x][y+1] += 1

        if s > 1 :
            if x > 0 :
                if y > 0 :
                    paper[x-1][y-1] += 1
                if y < 9 :
                    paper[x-1][y+1] += 1
            if x < 9 :
                if y > 0 :
                    paper[x+1][y-1] += 1
                if y < 9 :
                    paper[x+1][y+1] += 1
        if s > 2 :
            if x > 1 :
                paper[x-2][y] += 1
            if y > 1 :
                paper[x][y-2] += 1
            if x < 8 :
                paper[x+2][y] += 1
            if y < 8 :
                paper[x][y+2] += 1
                
    except EOFError :
        break


S = 0
M = 0
for i in range(10) :
    for j in range(10) :
        if paper[i][j] == 0 :
            S += 1
        if paper[i][j] > M :
            M = paper[i][j]
        
print(S)
print(M)
