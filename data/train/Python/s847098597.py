def check(x, y):
    return 0 <= x <= 9 and 0 <= y <= 9


def small(x, y, area):
    if check(x+1, y):
        area[x+1][y] += 1
    if check(x, y+1):
        area[x][y+1] += 1
    if check(x-1, y):
        area[x-1][y] += 1
    if check(x, y-1):
        area[x][y-1] += 1
    area[x][y] += 1
    return area


def mediam(x, y, area):
    area = small(x, y, area)
    if check(x+1, y+1):
        area[x+1][y+1] += 1
    if check(x+1, y-1):
        area[x+1][y-1] += 1
    if check(x-1, y+1):
        area[x-1][y+1] += 1
    if check(x-1, y-1):
        area[x-1][y-1] += 1
    return area


def large(x, y, area):
    area = mediam(x, y, area)
    if check(x+2, y):
        area[x+2][y] += 1
    if check(x, y+2):
        area[x][y+2] += 1
    if check(x-2, y):
        area[x-2][y] += 1
    if check(x, y-2):
        area[x][y-2] += 1
    return area

area = [[0 for i in range(10)] for j in range(10)]

while True:
    try:
        x, y, s = map(int, input().split(','))
    except:
        break

    if s == 1:
        area = small(x, y, area)
    if s == 2:
        area = mediam(x, y, area)
    if s == 3:
        area = large(x, y, area)

max = 0
cnt = 0

for i in range(10):
    for j in range(10):
        if area[i][j] == 0:
            cnt += 1
        if area[i][j] > max:
            max = area[i][j]
print(cnt)
print(max)