# ????????????????????°??????
import sys
from decimal import Decimal

def is_parallel(x1, y1, x2, y2, x3, y3, x4, y4):
    d1x = x2 - x1
    d1y = y2 - y1
    d2x = x4 - x3
    d2y = y4 - y3

    return d1x * d2y == d1y * d2x

    # if d1x != 0.0 and d2x != 0.0:
    #     #a1 = d1y / d1x
    #     #a2 = d2y / d2x
    #     #return a1 == a2
    #     return d1x * d2y == d1y * d2x

    # if d1x == 0.0 and d2x == 0.0:
    #     return True

    # return False

def main():
    n = int(sys.stdin.readline().strip())

    for _ in range(n):
        data = sys.stdin.readline().strip().split(' ')
        # x1 = float(data[0])
        # y1 = float(data[1])
        # x2 = float(data[2])
        # y2 = float(data[3])
        # x3 = float(data[4])
        # y3 = float(data[5])
        # x4 = float(data[6])
        # y4 = float(data[7])
        x1 = Decimal(data[0])
        y1 = Decimal(data[1])
        x2 = Decimal(data[2])
        y2 = Decimal(data[3])
        x3 = Decimal(data[4])
        y3 = Decimal(data[5])
        x4 = Decimal(data[6])
        y4 = Decimal(data[7])

        if is_parallel(x1, y1, x2, y2, x3, y3, x4, y4):
            print('YES')
        else:
            print('NO')
            
if __name__ == '__main__':
    main()