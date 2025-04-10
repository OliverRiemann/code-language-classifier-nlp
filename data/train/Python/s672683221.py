# -*- coding:utf-8 -*-

def check(x,i,y,j):
    flagx=True if (x+i>=0 and x+i<=9) else False
    flagy=True if (y+j>=0 and y+j<=9) else False

    return (flagx and flagy)

def main():
    LIST=[]
    for i in range(10):
        LIST.append([0,0,0,0,0,0,0,0,0,0])
        count=0
        M=0
    while True:
        try:
            x,y,size=map(int,input().split(","))
            if size==1:
                for i in range(-1,2):
                    for j in range(-1,2):
                        if check(x,i,y,j) and abs(i)+abs(j)<=1:
                            LIST[y+j][x+i]+=1

            elif size==2:
                for i in range(-1,2):
                    for j in range(-1,2):
                        if check(x,i,y,j) and abs(i)+abs(j)<=2:
                            LIST[y+j][x+i]+=1

            elif size==3:
                for i in range(-2,3):
                    for j in range(-2,3):
                        if check(x,i,y,j) and abs(i)+abs(j)<=2:
                            LIST[y+j][x+i]+=1
            
        except:
            break

    for item in LIST:
        tmp=max(x for x in item)
        M=max(tmp,M)

    for item in LIST:
        count+=item.count(0)

    print(count)
    print(M)
    
        
if __name__ == '__main__':
    main()