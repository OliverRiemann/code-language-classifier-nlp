# coding: utf-8
# Your code here!

MAX = 1000000
#エラトステネスの篩を用いて素数リストを予め作成する
s = [1] * MAX
## まずは全ての数が素数か不明ということにしておく
## s[2]以降をfor文で1に変換するより、s[0]s[1]を0とする方が繰り返しを使わずに済む
s[0] = 0
s[1] = 0

start = 2
while True:
    ## はじめにpmbを0で初期化しておかないと、pmb==0という条件に入ることはない
    pmb = 0
    for i in range(start, MAX):
        if s[i] == 1: #素数か否か不明な数の中で最小値を探す
            pmb = i
            break #見つかったらループを抜ける
    #print("リストsの中身", s)
   
    if pmb == 0:
        break #素数が見つからなかった
   
    #篩にかける
    for i in range(pmb ** 2, MAX, pmb):
        s[i] = 0  #素数でない要素を０にする

    start += 1

    #素数一覧をを表示
   #  for i in range(2, MAX):
   #     if s[i] == 1:
   #        print(i)

while True:
    try:
        n = int(input())
        
        c = 0
        for i in range(2, n + 1):
            if s[i] == 1:
                c += 1
        print(c)

    except EOFError:
        break
    ## tryできたときに行いたい処理はtryのインデント内に書く
      #  c = 0
      #  for i in range(2, n + 1):
      #       if s[i] == 1:
      #           c += 1
      #  print(c)

