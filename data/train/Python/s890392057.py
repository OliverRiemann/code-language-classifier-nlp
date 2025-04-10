import sys
from decimal import Decimal

def main():
    for input_line in sys.stdin:
        x1 = int(input_line.split(' ')[0])
        y1 = int(input_line.split(' ')[1])
        p = int(input_line.split(' ')[2])
        x2 = int(input_line.split(' ')[3])
        y2 = int(input_line.split(' ')[4])
        q = int(input_line.split(' ')[5])
        multiplicand1, multiplicand2 = calculate1(x1, x2)
        after_y1, after_y2, after_p, after_q = calculate2(y1, y2, p, q, multiplicand1, multiplicand2)
        calculate3(after_y1, after_y2, after_p, after_q, x1, y1, p)
    
def calculate1(x1, x2):
    if (x1 >= 0 and x2 >= 0) or (x1 < 0 and x2 < 0):
        multiplicand1 = -x2
        multiplicand2 = x1
        return multiplicand1, multiplicand2
    else:
        multiplicand1 = abs(x2)
        multiplicand2 = abs(x1)
        return multiplicand1, multiplicand2
    
def calculate2(y1, y2, p, q, multiplicand1, multiplicand2):
    after_y1 = Decimal(y1 * multiplicand1)
    after_y2 = Decimal(y2 * multiplicand2)
    after_p = Decimal(p * multiplicand1)
    after_q = Decimal(q * multiplicand2)
    return after_y1, after_y2, after_p, after_q

def calculate3(after_y1, after_y2, after_p, after_q, x1, y1, p):
    y = Decimal(after_p + after_q) / Decimal(after_y1 + after_y2)
    y = round(y, 3)
    x = Decimal(p - y1 * y) / Decimal(x1)
    x = round(x, 3)
    print('%.3f %.3f' % (x, y))
    
if __name__ == '__main__':
    main()