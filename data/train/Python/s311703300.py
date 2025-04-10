#!/usr/bin/env python3

"""Enumerates primes in an interval.

Verification: [0009](https://onlinejudge.u-aizu.ac.jp/status/users/hamukichi/submissions/1/0009/judge/4571021/Python3)
"""


import math
import sys


def segment_sieve(begin, end):
    """Enumerates the prime numbers in [`begin`, `end`).

    Returns (as a tuple):

    - `is_prime`: a list of bool values.
      If an integer `i` is a prime number, then `is_prime[i - begin]` is True.
      Otherwise `is_prime[i -begin]` is False.
    - `primes`: a list of prime numbers in [`begin`, `end`).
    """

    assert 1 < begin <= end
    sqrt_end = math.ceil(math.sqrt(end))
    is_prime_small = [True for i in range(sqrt_end)]
    is_prime_small[0] = False
    is_prime_small[1] = False
    is_prime = [True for i in range(end - begin)]
    for i in range(2, sqrt_end):
        if is_prime_small[i]:
            for j in range(2 * i, sqrt_end, i):
                is_prime_small[j] = False
            for k in range(max(2, (begin + i - 1) // i) * i, end, i):
                is_prime[k - begin] = False
    primes = [i for i, cond in enumerate(is_prime, begin) if cond]
    return is_prime, primes


def main():
    ns = [int(n) for n in sys.stdin.readlines()]
    max_n = max(ns)
    begin = 2
    is_prime, _ = segment_sieve(begin, max_n + 1)
    for n in ns:
        print(sum(is_prime[:n + 1 - begin]))


if __name__ == '__main__':
    main()

