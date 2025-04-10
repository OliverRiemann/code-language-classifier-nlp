# 国家予算

def main():
    N = int(input())
    for _ in range(N):
        n1 = input().strip()
        n2 = input().strip()

        #print(f"n1: {n1}\nn2: {n2}")
        if len(n1) > 80 or len(n2) > 80:
            print("overflow")
            continue

        print(add(n1, n2))
    return

def add(n1, n2):
    """n1, n2: str"""
    kotae = ""
    n1 = n1[::-1] # reversed
    n2 = n2[::-1]

    if len(n1) < len(n2): # 長い方がn1
        n1, n2 = n2, n1
    shorter = min(len(n1), len(n2))
    longer = max(len(n1), len(n2))

    idx, kuriagari = 0, 0
    while idx < longer:
        if idx >= shorter:
            tmp = int(n1[idx]) + kuriagari
            #print(f"idx: {idx}, tmp: {tmp}")
            kuriagari = 1 if tmp >= 10 else 0
            kotae += str(tmp)[-1]
            idx += 1

        while idx < shorter:
            tmp = int(n1[idx]) + int(n2[idx]) + kuriagari
            #print(f"idx: {idx}, tmp: {tmp}")
            kuriagari = 1 if tmp >= 10 else 0

            kotae += str(tmp)[-1]
            idx += 1

    if kuriagari:
        kotae += "1"

    if len(kotae) > 80:
        return "overflow"
    else:
        return kotae[::-1]

if __name__ == "__main__":
    main()
