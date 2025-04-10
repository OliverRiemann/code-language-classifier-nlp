mass = [[0 for p in xrange(14)] for q in xrange(14)]
while True:
	try:
		x,y,size = map(int,raw_input().split(','))
		x += 2 ; y += 2
		if   size == 1:
			mass[x-2][y-2]+=0;mass[x-1][y-2]+=0;mass[x][y-2]+=0;mass[x+1][y-2]+=0;mass[x+2][y-2]+=0
			mass[x-2][y-1]+=0;mass[x-1][y-1]+=0;mass[x][y-1]+=1;mass[x+1][y-1]+=0;mass[x+2][y-1]+=0
			mass[x-2][y]  +=0;mass[x-1][y]  +=1;mass[x][y]  +=1;mass[x+1][y]  +=1;mass[x+2][y]  +=0
			mass[x-2][y+1]+=0;mass[x-1][y+1]+=0;mass[x][y+1]+=1;mass[x+1][y+1]+=0;mass[x+2][y+1]+=0
			mass[x-2][y+2]+=0;mass[x-1][y+2]+=0;mass[x][y+2]+=0;mass[x+1][y+2]+=0;mass[x+2][y+2]+=0
		elif size == 2:
			mass[x-2][y-2]+=0;mass[x-1][y-2]+=0;mass[x][y-2]+=0;mass[x+1][y-2]+=0;mass[x+2][y-2]+=0
			mass[x-2][y-1]+=0;mass[x-1][y-1]+=1;mass[x][y-1]+=1;mass[x+1][y-1]+=1;mass[x+2][y-1]+=0
			mass[x-2][y]  +=0;mass[x-1][y]  +=1;mass[x][y]  +=1;mass[x+1][y]  +=1;mass[x+2][y]  +=0
			mass[x-2][y+1]+=0;mass[x-1][y+1]+=1;mass[x][y+1]+=1;mass[x+1][y+1]+=1;mass[x+2][y+1]+=0
			mass[x-2][y+2]+=0;mass[x-1][y+2]+=0;mass[x][y+2]+=0;mass[x+1][y+2]+=0;mass[x+2][y+2]+=0
		elif size == 3:
			mass[x-2][y-2]+=0;mass[x-1][y-2]+=0;mass[x][y-2]+=1;mass[x+1][y-2]+=0;mass[x+2][y-2]+=0
			mass[x-2][y-1]+=0;mass[x-1][y-1]+=1;mass[x][y-1]+=1;mass[x+1][y-1]+=1;mass[x+2][y-1]+=0
			mass[x-2][y]  +=1;mass[x-1][y]  +=1;mass[x][y]  +=1;mass[x+1][y]  +=1;mass[x+2][y]  +=1
			mass[x-2][y+1]+=0;mass[x-1][y+1]+=1;mass[x][y+1]+=1;mass[x+1][y+1]+=1;mass[x+2][y+1]+=0
			mass[x-2][y+2]+=0;mass[x-1][y+2]+=0;mass[x][y+2]+=1;mass[x+1][y+2]+=0;mass[x+2][y+2]+=0
	except: break
white = 0
max = 0
for p in xrange(2,12):
	for q in xrange(2,12):
		if mass[p][q] == 0: white += 1
		if mass[p][q] > max: max = mass[p][q]
print white
print max