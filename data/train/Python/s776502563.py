# Vol0004.
import sys

def main():
    data = []
    lines = sys.stdin.readlines()

    for line in lines:
        data.append(line.split())  # スペース区切りで放り込む
    # ax + by = c, dx + ey = fの解は、
    # x = (ce - bf) / (ae - bd), y = (af - cd) / (ae - bd).
    # これをround(float, 3)すれば答えが出る。
    N = len(data)
    for i in range(N):
        for k in range(6):
            data[i][k] = int(data[i][k])
        det = data[i][0] * data[i][4] - data[i][1] * data[i][3]
        gx = data[i][2] * data[i][4] - data[i][1] * data[i][5]
        gy = data[i][0] * data[i][5] - data[i][2] * data[i][3]
        if det < 0:
            det = -det;
            if gx != 0: gx = -gx
            if gy != 0: gy = -gy
        print("{0:.3f}".format(gx / det) + " " + "{0:.3f}".format(gy / det))

if __name__ == "__main__":
    main()

# 補足、0.1とか0.22でも3桁目まで表示しないとWrongになる。
# 表示するにはprint("{0:.nf}".format(数))ってやる(nのところは桁数)。
# さらに、0を負の数で割ると表示が-0.000になってしまうのでそこの処理も重要。
