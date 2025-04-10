# coding=utf-8


def direction_vector(p1: list, p2: list)->list:
    return [p2[0]-p1[0], p2[1]-p1[1]]


def cross_product(v1: list, v2: list)->float:
    return v1[0]*v2[1] - v1[1]*v2[0]


if __name__ == '__main__':
    while True:
        try:
            points_receive = list(map(float, input().split()))
        except EOFError:
            break

        points_list = [[points_receive[2*i], points_receive[2 * i + 1]] for i in range(4)]
        p1_to_p2 = direction_vector(points_list[0], points_list[1])
        p2_to_p3 = direction_vector(points_list[1], points_list[2])
        p3_to_p1 = direction_vector(points_list[2], points_list[0])
        p1_to_pp = direction_vector(points_list[0], points_list[3])
        p2_to_pp = direction_vector(points_list[1], points_list[3])
        p3_to_pp = direction_vector(points_list[2], points_list[3])
        cp1 = cross_product(p1_to_p2, p1_to_pp)
        cp2 = cross_product(p2_to_p3, p2_to_pp)
        cp3 = cross_product(p3_to_p1, p3_to_pp)

        if cp1 > 0 and cp2 > 0 and cp3 > 0:
            print('YES')
        elif cp1 < 0 and cp2 < 0 and cp3 < 0:
            print('YES')
        else:
            print('NO')