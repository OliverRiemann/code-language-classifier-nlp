def main():
    if size == 1:
        index_lis = [(0,0),(0,-1),(0,1),(-1,0),(1,0)]
    elif size == 2:
        index_lis = [(0,0),(0,-1),(0,1),(-1,-1),(-1,0),(-1,1),(1,-1),(1,0),(1,1)]
    elif size == 3:
        index_lis = [(0,0),(0,-1),(0,-2),(0,1),(0,2),(-1,-1),(-1,0),(-1,1),
                     (1,-1),(1,0),(1,1),(-2,0),(2,0)]
    drop(index_lis, x, y)
    
def drop(index_lis, x, y):
    for add_x, add_y in index_lis:
        _x = x + add_x
        _y = y + add_y
        if 0 <= _x <= 9 and 0 <= _y <= 9:
            sheet[_x][_y] = sheet[_x][_y] + 1
            
def check():
    total = 0
    max_num = 0
    for x in range(10):
        for y in range(10):
            if sheet[x][y] == 0:
                total += 1
            else:
                if sheet[x][y] > max_num:
                    max_num = sheet[x][y]
    print total
    print max_num

sheet = []
for i in range(10):
    lis = []
    for i in range(10):
        lis.append(0)
    sheet.append(lis)
    
while True:
    try:
        x, y, size = map(int, raw_input().split(','))
        main()
    except EOFError:
        check()
        break