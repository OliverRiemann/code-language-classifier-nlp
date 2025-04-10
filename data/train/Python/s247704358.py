import math

def my_round(x,d=0):
    p = 10 ** d
    return float(math.floor((x * p) + math.copysign(0.5, x))) / p

class Equation():
    def __init__(self, a, b, c, d, e, f):
        self.a = a
        self.b = b
        self.c = c
        self.d = d
        self.e = e
        self.f = f

    def calc(self):
        temp = (self.a * self.e - self.b * self.d)
        temp_a = (self.c * self.e - self.b * self.f)
        temp_b = (self.a * self.f - self.c * self.d)
        try:
            x = round(temp_a / temp+0., 3)
        except ZeroDivisionError:
            x = round(temp_a / 1.0, 4)

        try:
            y = round(temp_b / temp+0., 3)
        except:
            y = round(temp_b / 1.0, 4)


        return x, y


    def print(self):
        ans = self.calc()
        print("{0:.3f} {1:.3f}".format(ans[0], ans[1]))


def main():
    data = []

    while 1:
        try:
            n = input().split()

            a = float(n[0])
            b = float(n[1])
            c = float(n[2])
            d = float(n[3])
            e = float(n[4])
            f = float(n[5])

            data.append(Equation(a, b, c, d, e, f))

        except EOFError:
            break

    for num in data:
        num.print()

if __name__ == "__main__":
    main()