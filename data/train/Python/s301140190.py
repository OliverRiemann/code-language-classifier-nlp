def get_input():
    while True:
        try:
            yield "".join(input())
        
        except EOFError:
            break
            
def calcGCD(a,b):#?????§??¬?´???°????±?????????????????????????????????????????????¨?????????
    if a>b:
        large = a
        small = b
    elif a<b:
        large = b
        small = a
    else:
        return a
        
    
    while True:
        
        if large == small:
            return large
        
        temp_small = large - small
        
        if temp_small < small:
            large = small
            small = temp_small 
        else:
            large = temp_small
            small = small

def calcLCM(a,b,gcd):#????°???¬?????°????±??????????
    lcm = a*b/gcd
    
    return lcm
    


if __name__  == "__main__":
    array = list(get_input())
    for i in range(len(array)):
    
        temp_a,temp_b = array[i].split()
    
        a,b = int(temp_a),int(temp_b)
    
        gcd = calcGCD(a,b)
        lcm = calcLCM(a,b,gcd)
        lcm = int(lcm)
        
        print("{} {}".format(gcd,lcm))