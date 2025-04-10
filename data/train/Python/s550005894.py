import heapq
from collections import deque
from enum import Enum
import sys
import math
from _heapq import heappush, heappop
import copy

BIG_NUM = 2000000000
HUGE_NUM = 99999999999999999
MOD = 1000000007
EPS = 0.000000001
sys.setrecursionlimit(100000)


num_query = int(input())

for _ in range(num_query):
    A = list(map(int,input()))
    B = list(map(int,input()))

    if len(A) > 80 or len(B) > 80:
        print("overflow")
        continue

    if len(B) > len(A): #len(B) <= len(A)にする
        A,B = B,A
    A.reverse()
    B.reverse()

    ANS = deque()
    add = 0

    for digit in range(len(A)):
        if digit >= len(B):
            tmp = add+A[digit]
            add = tmp//10
            ANS.append(tmp%10)
        else:
            tmp = add+B[digit]+A[digit]
            add = tmp//10
            ANS.append(tmp%10)

    if len(A) == 80 and add == 1:
        print("overflow")
    else:
        if add == 1:
            ANS.append(1)

        while len(ANS) > 0:
            print("%d"%(ANS.pop()),end="")
        print()

