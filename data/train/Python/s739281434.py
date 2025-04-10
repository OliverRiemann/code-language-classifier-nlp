p = [[0 for j in range(10)] for i in range(10)]

s1i = [-1, 0, 0, 1]
s1j = [0, -1, 1, 0]
s2i = [-1, -1, -1, 0, 0, 1, 1, 1]
s2j = [-1, 0, 1, -1, 1, -1, 0, 1]
s3i = [-2, -1, -1, -1, 0, 0, 0, 0, 1, 1, 1, 2]
s3j = [0, -1, 0, 1, -2, -1, 1, 2, -1, 0, 1, 0]

while True:
  try:
    x, y, s = map(int, input().split(","))
  except:
    break

  p[y][x] += 1
  if s == 1:
    for k in range(len(s1i)):
      xx = x + s1j[k]
      yy = y + s1i[k]
      if 0 <= xx and xx < 10 and 0 <= yy and yy < 10:
        p[yy][xx] += 1
  elif s == 2:
    for k in range(len(s2i)):
      xx = x + s2j[k]
      yy = y + s2i[k]
      if 0 <= xx and xx < 10 and 0 <= yy and yy < 10:
        p[yy][xx] += 1
  else:
    for k in range(len(s3i)):
      xx = x + s3j[k]
      yy = y + s3i[k]
      if 0 <= xx and xx < 10 and 0 <= yy and yy < 10:
        p[yy][xx] += 1
    
cnt = 0
m = 0
for i in range(10):
  #print(p[i])
  for j in range(10):
    if p[i][j] == 0:
      cnt += 1
    else:
      pass
    m = max(p[i][j], m)

#print()
print(cnt)
print(m)
