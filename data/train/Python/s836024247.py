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
    while True:
        num = sys.stdin.readline()
        if num is None or num.strip() == '':
            break

        num = int(num.strip())
        if prim_vals.get(num) is not None:
            cnt = prim_vals.get(num)
        else:
            #print('num:', num)
            if num == 1:
                cnt = 0
            else:
                cnt = 0
                #for i in range(3, num + 1, 2):
                if num % 2 == 0:
                    start_num = num -1
                else:
                    start_num = num
                    
                for i in range(start_num, 0, -2):
                    #print('i:', i)
                    if prim_vals.get(i) is not None:
                        cnt += prim_vals.get(i)
                        #cnt -= 1
                        break
                    
                    if is_prime(i):
                        cnt += 1
                        
                #cnt += 1             # 2??????????¶????
                prim_vals[num] = cnt # ????????°?????§????´???°????????°????????????(2?????????)

        print(cnt)

if __name__ == '__main__':
    main()
    #print(prim_no)