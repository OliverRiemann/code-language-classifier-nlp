# coding=utf-8
import math


if __name__ == '__main__':
    n = int(input())
    for i in range(n):
        x1, y1, x2, y2, x3, y3 = map(float, input().split())
        points_list = [[x1, y1], [x2, y2], [x3, y3]]
        points_list.sort()

        if points_list[0][0] == points_list[1][0]:
            py = (points_list[0][1] + points_list[1][1])/2
            if points_list[2][1] == points_list[0][1]:
                px = (points_list[0][0] + points_list[2][0])/2
            else:
                a2_s = (points_list[2][1] - points_list[0][1])/(points_list[2][0] - points_list[0][0])
                a2 = -1/a2_s
                m13x = (points_list[0][0] + points_list[2][0])/2
                m13y = (points_list[0][1] + points_list[2][1])/2
                b2 = m13y - a2*m13x
                px = (py - b2)/a2
        elif points_list[1][0] == points_list[2][0]:
            py = (points_list[1][1] + points_list[2][1])/2
            if points_list[2][1] == points_list[0][1]:
                px = (points_list[0][0]+points_list[2][0])/2
            else:
                a2_s = (points_list[2][1] - points_list[0][1])/(points_list[2][0] - points_list[0][0])
                a2 = -1/a2_s
                m13x = (points_list[0][0] + points_list[2][0])/2
                m13y = (points_list[0][1] + points_list[2][1])/2
                b2 = m13y - a2*m13x
                px = (py - b2)/a2
        elif points_list[0][1] == points_list[1][1]:
            px = (points_list[0][0] + points_list[1][0])/2
            a2_s = (points_list[2][1] - points_list[0][1]) / (points_list[2][0] - points_list[0][0])
            a2 = -1 / a2_s
            m13x = (points_list[0][0] + points_list[2][0]) / 2
            m13y = (points_list[0][1] + points_list[2][1]) / 2
            b2 = m13y - a2 * m13x
            py = a2*px + b2
        elif points_list[0][1] == points_list[2][1]:
            px = (points_list[0][0] + points_list[2][0])/2
            a1_s = (points_list[1][1] - points_list[0][1]) / (points_list[1][0] - points_list[0][0])
            a1 = -1 / a1_s
            m12x = (points_list[0][0] + points_list[1][0]) / 2
            m12y = (points_list[0][1] + points_list[1][1]) / 2
            b1 = m12y - a1 * m12x
            py = a1 * px + b1
        else:
            a1_s = (points_list[1][1] - points_list[0][1])/(points_list[1][0] - points_list[0][0])
            a1 = -1/a1_s
            a2_s = (points_list[2][1] - points_list[0][1])/(points_list[2][0] - points_list[0][0])
            a2 = -1/a2_s
            m12x = (points_list[0][0] + points_list[1][0]) / 2
            m12y = (points_list[0][1] + points_list[1][1]) / 2
            m13x = (points_list[0][0] + points_list[2][0]) / 2
            m13y = (points_list[0][1] + points_list[2][1]) / 2
            b1 = m12y - a1 * m12x
            b2 = m13y - a2 * m13x
            px = (b2 - b1)/(a1 - a2)
            py = a1*px + b1
        r = math.sqrt(math.pow((px-points_list[0][0]), 2) + math.pow((py-points_list[0][1]), 2))
        print('{0:.3f} {1:.3f} {2:.3f}'.format(px, py, r))