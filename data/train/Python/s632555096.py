import sys, re
from collections import deque, defaultdict, Counter
from math import ceil, sqrt, hypot, factorial, pi, sin, cos, radians
from itertools import permutations, combinations, product
from operator import itemgetter, mul
from copy import deepcopy
from string import ascii_lowercase, ascii_uppercase, digits
from fractions import gcd
from bisect import bisect_left
from heapq import heappush, heappop

def input(): return sys.stdin.readline().strip()
def INT(): return int(input())
def MAP(): return map(int, input().split())
def LIST(): return list(map(int, input().split()))
sys.setrecursionlimit(10 ** 9)
INF = float('inf')
mod = 10 ** 9 + 7

def primes_for(n):
   is_prime = [True] * (n + 1)
   is_prime[0] = False
   is_prime[1] = False
   for i in range(2, n + 1):
       for j in range(i * 2, n + 1, i):
           is_prime[j] = False
   return [i for i in range(n + 1) if is_prime[i]]

prime_list = primes_for(10**6)
is_prime = [0]*10**6
for n in prime_list:
  is_prime[n] = 1

cnt = [0] * 10**6
for i in range(2, 10**6):
  if is_prime[i]:
    cnt[i] = cnt[i-1] + 1
  else:
    cnt[i] = cnt[i-1]

while 1:
  try:
    n = INT()
    print(cnt[n])
  except:
    sys.exit()

