# ?´???°?????°?????¨?????????????????°??????

import sys
import math

prim_no = {2: True}                    # ????????°????´???°??§??????????????????????????????

def is_prime(no):
    if no == 2 or no == 1:
        return True
    
    if no % 2 == 0:
        return False

    if prim_no.get(no) is not None:
        return prim_no.get(no)

    max_check = int(math.sqrt(no))
    for i in range(3, max_check+1, 2):
        if no % i == 0:
            prim_no[no] = False
            return False

    prim_no[no] = True
    return True

def main():
    prim_vals = {}                         # ????????°?????§????´???°????????°
    num_data = []                          # ?????????????????????
    
    while True:
        num = sys.stdin.readline()
        if num is None or num.strip() == '':
            break

        num = int(num.strip())
        num_data.append(num)

    sorted_num_data = sorted(num_data)
    prim_num = {}
    
    for num in sorted_num_data:
        if prim_vals.get(num) is not None:
            cnt = prim_vals.get(num)
        else:
            if num == 1:
                cnt = 0
            else:
                cnt = 0

                if num % 2 == 0:
                    start_num = num -1
                else:
                    start_num = num
                    
                for i in range(start_num, 0, -2):
                    if prim_vals.get(i) is not None:
                        cnt += prim_vals.get(i)
                        break
                    
                    if is_prime(i):
                        cnt += 1
                        
                prim_vals[num] = cnt # ????????°?????§????´???°????????°????????????
        prim_num[num] = cnt

    for num in num_data:
        print(prim_num[num])

if __name__ == '__main__':
    main()
    #print(prim_no)