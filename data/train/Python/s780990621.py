#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys

def solve():
    while True:
        n = input()
        if n > 0:
            tmp_lst = []
            for i in xrange(n):
                tmp_lst.append(input())
            lst = compress(tmp_lst)
            accumurate_lst = calc_accumurate_lst(lst)
            max_value = - (10 ** 100)
            size = len(lst)
            for to in xrange(size):
                for frm in xrange(to + 1):
                    value = accumurate_lst[to] if frm == 0 else accumurate_lst[to] - accumurate_lst[frm - 1]
                    if max_value < value:
                        max_value = value
            print max_value
        else:
            sys.exit()

def calc_accumurate_lst(lst):
    accum = [0 for i in lst]
    accum[0] = lst[0]
    for i in xrange(1, len(lst)):
        accum[i] = accum[i - 1] + lst[i]
    return accum
        
#同じ符号の数列は圧縮できる
def compress(tmp_lst):
    lim = len(tmp_lst)
    #リスト圧縮
    lst = []
    index = 0
    while index < lim:
        tmp = tmp_lst[index]
        index += 1
        while tmp > 0 and index < lim and tmp * tmp_lst[index] > 0:
            tmp += tmp_lst[index]
            index += 1
        lst.append(tmp)
    return lst

if __name__ == "__main__":
    solve()