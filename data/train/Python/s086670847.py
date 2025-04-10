# coding: utf-8

while True:
	try:
		x1, y1, x2, y2, x3, y3, xp, yp = map(float, raw_input().split())
#		print(x1)
#		print(x2)
#		print(x3)
#		print(y1)
#		print(y2)
#		print(y3)

		xg = 1./3 * (x1 + x2 + x3)
		yg = 1./3 * (y1 + y2 + y3)
#		print("xg = {:}, yg = {:}".format(xg, yg))
		
		def line(xi, yi, xj, yj, x, y):
			return (yi-yj)*x/(xi-xj) + (xi*yj-xj*yi)/(xi-xj)
		
		if x1 != x2:
			def line12(x, y):
				if y < line(x1, y1, x2, y2, x, y):
#					print("2")
					return 2
				elif y > line(x1, y1, x2, y2, x, y):
#					print("3")
					return 3
				else:
#					print("0")
					return 0
		else:
			def line12(x, y):
				if x1 < x:
#					print("2")
					return 2
				elif x1 > x:
#					print("3")
					return 3
				else:
#					print("0")
					return 0

		if x2 != x3:
			def line23(x, y):
				if y < line(x2, y2, x3, y3, x, y):
#					print("5")
					return 5
				elif y > line(x2, y2, x3, y3, x, y):
#					print("7")
					return 7
				else:
#					print("0")
					return 0
		else:
			def line23(x, y):
				if x2 < x:
#					print("5")
					return 5
				elif x2 > x:
#					print("7")
					return 7
				else:
#					print("0")
					return 0

		if x1 != x3:
			def line13(x, y):
				if y < line(x1, y1, x3, y3, x, y):
#					print("11")
					return 11
				elif y > line(x1, y1, x3, y3, x, y):
#					print("13")
					return 13
				else:
#					print("0")
					return 0
		else:
			def line13(x, y):
				if x1 < x:
#					print("11")
					return 11
				elif x1 > x:
#					print("13")
					return 13
				else:
#					print("0")
					return 0

		if line12(xp, yp)*line23(xp, yp)*line13(xp, yp) == line12(xg, yg)*line23(xg, yg)*line13(xg, yg):
			print("YES")
		else:
			print("NO")

	except EOFError:
		break
