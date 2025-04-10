#sheet...紙全体、sheet[x][y]は(x, y)のインクの濃さ
sheet = [[0 for _ in range(10)] for _ in range(10)]

#小、中、大のインクの範囲
small_range = ((0, 0), (1, 0), (0, 1), (-1, 0), (0, -1))
middle_range = ((0, 0), (1, 0), (1, 1), (0, 1), (-1, 1), (-1, 0), (-1, -1), (0, -1), (1, -1))
large_range = ((0, 0), (1, 0), (2, 0), (1, 1), (0, 1), (0, 2), (-1, 1), (-1, 0), (-2, 0), (-1, -1), (0, -1), (0, -2), (1, -1))

#範囲内か判定してインクを足す
def drop(x, y, drop_range):
  for dx, dy in drop_range:
    newx, newy = x + dx, y + dy
    if 0 <= newx <= 9 and 0 <= newy <= 9:
      sheet[newx][newy] += 1

while True:
  try:
    x, y, s = map(int, input().split(","))

    if s == 1:
      drop(x, y, small_range)
    elif s == 2:
      drop(x, y, middle_range)
    else:
      drop(x, y, large_range)

  except EOFError:
    break

#0の個数
zero_cnt = 0

#インクの最大値
max_ink = 0

for x in range(10):
  for y in range(10):
    ink = sheet[x][y]

    if ink == 0:
      zero_cnt += 1

    if max_ink < ink:
      max_ink = ink

print(zero_cnt)
print(max_ink)
