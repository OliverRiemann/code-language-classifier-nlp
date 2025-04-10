class Paper:
    def __init__(self, x, y):
        
        self.A = [[0 for i in range(x)] for j in range(y)]
        self.size = (x, y)
    def drop(self, x, y, s):
        if s == 1:
            if y+1 <= self.size[1]-1:
                self.A[y+1][x] += 1            
            for i in range(max(0, x-1) , 1 + min(self.size[0]-1, x+1)):
                self.A[y][i] += 1
            if y-1 >= 0:
                self.A[y-1][x] += 1

        if s == 2:
            if y+1 <= self.size[1]-1:
                for i in range(max(0, x-1) , 1 + min(self.size[0]-1, x+1)):
                    self.A[y+1][i] += 1
            for i in range(max(0, x-1) , 1 + min(self.size[0]-1, x+1)):
                self.A[y][i] += 1
            if y-1 >= 0:
                for i in range(max(0, x-1) , 1 + min(self.size[0]-1, x+1)):
                    self.A[y-1][i] += 1

        if s == 3:
            if y+2 <= self.size[1]-1:
                self.A[y+2][x] += 1
            if y+1 <= self.size[1]-1:
                for i in range(max(0, x-1) , 1 + min(self.size[0]-1, x+1)):
                    self.A[y+1][i] += 1
            for i in range(max(0, x-2) , 1 + min(self.size[0]-1, x+2)):
                self.A[y][i] += 1
            if y-1 >= 0:
                for i in range(max(0, x-1) , 1 + min(self.size[0]-1, x+1)):
                    self.A[y-1][i] += 1
            if y-2 >= 0:
                self.A[y-2][x] += 1

if __name__ == "__main__":
    import sys 
    p = Paper(10, 10)
    L = sys.stdin.readlines()
    for l in L:
        x, y, s = map(int, l.split(','))
        p.drop(x, y, s)
#        for i in range(10):
#            print(p.A[i])
#        print()
    temp = []
    for y in p.A:
        temp.extend(y)

    A1 = temp.count(0)
    A2 = max(temp)

    print(A1)
    print(A2)
        
            
    
    