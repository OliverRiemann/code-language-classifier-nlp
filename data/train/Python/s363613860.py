if __name__ == '__main__':

	DI = [[0 for _ in range(10)] for _ in range(10)]

	while True:
		try:
			x,y,s = map(int,input().split(","))
			if s == 0:
				break
			if s == 1:
				#自身
				DI[x][y] += 1
				#up
				if y >= 1 :
					DI[x][y-1] += 1
				#down
				if y <= 8:
					DI[x][y+1] += 1
				#left
				if x >= 1:
					DI[x-1][y] += 1
				#right
				if x <= 8:
					DI[x+1][y] += 1

			elif s == 2:
				#自身
				DI[x][y] += 1
				#up
				if y >= 1 :
					DI[x][y-1] += 1
				#up left
				if x >= 1 and y >= 1:
					DI[x-1][y-1] += 1
				#up right
				if x <= 8 and y >= 1 :
					DI[x+1][y-1] += 1
				#down
				if y <= 8:
					DI[x][y+1] += 1
				#down left
				if x >= 1 and y <= 8:
					DI[x-1][y+1] += 1
				#down right
				if x <= 8 and y <= 8 :
					DI[x+1][y+1] += 1
				#left
				if x >= 1:
					DI[x-1][y] += 1
				#right
				if x <= 8:
					DI[x+1][y] += 1

			else:
				#自身
				DI[x][y] += 1
				#up
				if y >= 1 :
					DI[x][y-1] += 1
				#up left
				if x >= 1 and y >= 1:
					DI[x-1][y-1] += 1
				#up right
				if x <= 8 and y >= 1 :
					DI[x+1][y-1] += 1
				#up +1
				if y >= 2 :
					DI[x][y-2] += 1
				#down
				if y <= 8:
					DI[x][y+1] += 1
				#down left
				if x >= 1 and y <= 8:
					DI[x-1][y+1] += 1
				#down right
				if x <= 8 and y <= 8 :
					DI[x+1][y+1] += 1
				#down + 1
				if y <= 7:
					DI[x][y+2] += 1
				#left
				if x >= 1:
					DI[x-1][y] += 1
				#left + 1
				if x >= 2:
					DI[x-2][y] += 1
				#right
				if x <= 8:
					DI[x+1][y] += 1
				#right + 1
				if x <= 7:
					DI[x+2][y] += 1



		except EOFError:
			break

#	for j in DI:
#		print(j)

	cnt = 0
	maxcnt = 0
	for k in DI:
		cnt += k.count(0)
		if maxcnt < max(k):
			maxcnt = max(k)
	print(cnt)
	print(maxcnt)


