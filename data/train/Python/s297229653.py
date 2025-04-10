p = [[0 for a in range(10)] for b in range(10)]
def smallink(x,y):
    return [(x+i,y+j) for i in range(-1,2,1) for j in range(-1,2,1)\
            if abs(i)+abs(j)<=1 and x+i>=0 and x+i<=9 and y+j>=0\
            and y+j<=9]
def ink(x,y):
    return [(x+i,y+j) for i in range(-1,2,1) for j in range(-1,2,1)\
            if x+i>=0 and y+j>=0 and x+i<=9 and y+j<=9]
def bigink(x,y):
    return [(x+i,y+j) for i in range(-2,3,1) for j in range(-2,3,1)\
            if abs(i)+abs(j)<=2 and x+i>=0 and y+j>=0 and x+i<=9\
            and y+j<=9]

while True:
    try:
        x,y,size=map(int,raw_input().split(","))
        if size==1:
            L=smallink(x,y)
        elif size==2:
            L=ink(x,y)
        else:
            L=bigink(x,y)
        while len(L)!=0:
            point=L.pop(0)
            p[point[0]][point[1]]+=1
    except:
        break

count=0
max=0
for i in range(10):
    for j in range(10):
        if(p[i][j]>max):
            max=p[i][j]
        if(p[i][j]==0):
            count+=1
print count
print max