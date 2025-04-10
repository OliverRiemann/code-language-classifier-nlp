def paint(masu,data):
    masu[data[1]][data[0]]+=1                   #インクを垂らした場所
    #print(masu)
    if data[2]==1:                              #インク小の時
        if data[0]!=0:
            masu[data[1]][data[0]-1]+=1
        if data[0]!=9:
            masu[data[1]][data[0]+1]+=1
        if data[1]!=0:
            masu[data[1]-1][data[0]]+=1
        if data[1]!=9:
            masu[data[1]+1][data[0]]+=1
        #print("小の時",masu)
    elif data[2]==2:                            #インク中の時
        if data[0]!=0:
            masu[data[1]][data[0]-1]+=1
        if data[0]!=9:
            masu[data[1]][data[0]+1]+=1
        if data[1]!=0:
            masu[data[1]-1][data[0]]+=1
        if data[1]!=9:
            masu[data[1]+1][data[0]]+=1
        if data[1]!=9 and data[0]!=9:
            masu[data[1]+1][data[0]+1]+=1
        if data[1]!=9 and data[0]!=0:
            masu[data[1]+1][data[0]-1]+=1
        if data[1]!=0 and data[0]!=9:
            masu[data[1]-1][data[0]+1]+=1
        if data[1]!=0 and data[0]!=0:
            masu[data[1]-1][data[0]-1]+=1
        #print("中の時",masu)
    elif data[2]==3:                            #インク大の時
        if data[0]!=0:
            masu[data[1]][data[0]-1]+=1
        if data[0]!=9:
            masu[data[1]][data[0]+1]+=1
        if data[1]!=0:
            masu[data[1]-1][data[0]]+=1
        if data[1]!=9:
            masu[data[1]+1][data[0]]+=1
        if data[1]!=9 and data[0]!=9:
            masu[data[1]+1][data[0]+1]+=1
        if data[1]!=9 and data[0]!=0:
            masu[data[1]+1][data[0]-1]+=1
        if data[1]!=0 and data[0]!=9:
            masu[data[1]-1][data[0]+1]+=1
        if data[1]!=0 and data[0]!=0:
            masu[data[1]-1][data[0]-1]+=1
        if data[1]>=2:
            masu[data[1]-2][data[0]]+=1
        if data[1]<=7:
            masu[data[1]+2][data[0]]+=1
        if data[0]>=2:
            masu[data[1]][data[0]-2]+=1
        if data[0]<=7:
            masu[data[1]][data[0]+2]+=1
        #print("大の時",masu)
    return masu

masu=[
        [0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0]
    ]



def keisan(masu):
    max=0
    num1=0
    for na in range(10):
        for ma in range(10):
            if masu[na][ma]==0:
                num1+=1
            if masu[na][ma]>max:
                max=masu[na][ma]
    print(num1)
    print(max)

while True:
    try:
        x,y,s=list(map(int, input().split(',')))
        data=[x,y,s]   
        masu2=paint(masu,data)
    except:
        break

    
    #print("masu",masu2)
#print("masu2",masu2)
keisan(masu2)


