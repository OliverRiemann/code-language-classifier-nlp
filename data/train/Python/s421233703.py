# ２点(a, b) (c, d)を通る直線の傾きと切片を返す
def func(a, b, c, d):
    k = (d - b) / (c - a)
    h = d - k * c
    return k, h


# ２点と通る直線のf(x)を返す
def fx(a, b, c, d, x):
    k, h = func(a, b, c, d)
    return k * x + h


def main():
    import sys
    for dataset in sys.stdin:
        ans = 'NO'
        try :
            a, b, c, d, e, f, px, py = map(float, dataset.split())
        except:
            break
        T = [(a, b), (c, d), (e, f)]
        T.sort(key=lambda x: (x[0], x[1]))
        a, b, c, d, e, f = T[0][0], T[0][1], T[1][0], T[1][1], T[2][0], T[2][1]
        # 共通なxを持つ２点が存在するか判定し、する場合
        if a == c:
            if  a < px and fx(a, b, e, f, px) < py and fx(c, d, e, f, px) > py:
                ans = 'YES'
        elif c == e:
            if px < e and fx(a, b, c, d, px) < py and fx(a, b, e, f, px) > py:
                ans = 'YES'
        else:  # ３点において共通のxを持たない場合
            if fx(a, b, e, f, c) < d:  # 中間点が残り２点を通る直線より上にあるケース
                if fx(a, b, c, d, px) > py and fx(c, d, e, f, px) > py and fx(a, b, e, f, px) < py:
                    ans = 'YES'
            else:
                if fx(a, b, c, d, px) < py and fx(c, d, e, f, px) < py and fx(a, b, e, f, px) > py:
                    ans = 'YES'

        print(ans)


if __name__ == '__main__':
    main()

