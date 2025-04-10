A=[[int(0) for i in range(10)]for j in range(10)]
count=0
while 1:
    try:
        x,y,s = map(int, input().split(','))
        if s==1:
            for i in range(x-1,x+2):
                if i>=0 and i<=9:
                    A[i][y]=A[i][y]+1
            for i in range(y-1,y+2):
                if i>=0 and i<=9:
                    A[x][i]=A[x][i]+1
            A[x][y]=A[x][y]-1 
        elif s==2:
            for i in range(x-1,x+2):
                for j in range(y-1,y+2):
                    if i>=0 and i<=9 and j>=0 and j<=9:
                        A[i][j]=A[i][j]+1
        else:
            for i in range(x-2,x+3):
                if i>=0 and i<=9:
                    A[i][y]=A[i][y]+1
            for i in range(y-2,y+3):
                if i>=0 and i<=9:
                    A[x][i]=A[x][i]+1
            for i in range(x-1,x+2):
                if i>=0 and i<=9:
                    A[i][y]=A[i][y]-1
            for i in range(y-1,y+2):
                if i>=0 and i<=9:
                    A[x][i]=A[x][i]-1
            for i in range(x-1,x+2):
                for j in range(y-1,y+2):
                    if i>=0 and i<=9 and j>=0 and j<=9:
                        A[i][j]=A[i][j]+1
    except:
        break
num=0
for i in range(10):
    for j in range(10):
        if A[i][j]==0:
            count=count+1
        if A[i][j]!=0:
            if num<A[i][j]:
                num=A[i][j]
print(count)
print(num)