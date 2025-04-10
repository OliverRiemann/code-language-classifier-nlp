arr = [0]*100
while True:
    try:
        x,y,s = map(int, input().split(","))
        if s==3:
            if x <= 7:
                arr[10*y+x+2] += 1
            if x >= 2:
                arr[10*y+x-2] += 1
            if y <= 7:
                arr[10*y+x+20] += 1
            if y >= 2:
                arr[10*y+x-20] += 1
        if s>=2:
            if x != 9 and y != 9:
                arr[10*y+x+11] += 1
            if x != 9 and y != 0:
                arr[10*y+x-9] += 1
            if x != 0 and y != 0:
                arr[10*y+x-11] += 1
            if x != 0 and y != 9:
                arr[10*y+x+9] += 1
        if True:
            if x != 9:
                arr[10*y+x+1] += 1
            if x != 0:
                arr[10*y+x-1] += 1
            if y != 9:
                arr[10*y+x+10] += 1
            if y != 0:
                arr[10*y+x-10] += 1
        if True:
            if True:
                arr[10*y+x] += 1

    except EOFError:
        break

print(arr.count(0))
print(max(arr))