#coding: UTF-8

# 指定した数以下の素数の個数を返却する
# 素数判定はエラストテネスのふるい

# 要素1000000のリスト（素数かどうかのリスト）を準備
max_number = 1000000
prime_flag_list = [True] * max_number

# 0、1は素数でない
prime_flag_list[0] = False
prime_flag_list[1] = False

# 2の倍数（2を除く）は素数でない
prime_flag_list[4::2] = [False] * len(prime_flag_list[4::2])

# 3以上の数について、素数ならその倍数を振るい落とす
for i in range(3, int(max_number**0.5) + 1, 2):
    prime_flag_list[i*i::i] = [False] * len(prime_flag_list[i*i::i])

# フラグの立ったままの箇所は素数なので、そこだけ取り出す
prime_list = [i for i in range(2, max_number) if prime_flag_list[i]]

while True:
    try:
        input = int(raw_input())
    except EOFError:
        break
    for i in range(0, len(prime_list)):
        if prime_list[i] > input:
            print i
            break
    if i >= len(prime_list) - 1:
        print len(prime_list)