import math

def calc_digit(data1, data2):
    if(data1 == 0):
        data_size2 = int(len(str(data2)))
        data_size1 = 1
    elif(data2 == 0):
        data_size1 = int(len(str(data2)))
        data_size2 = 1
    else:
        data_size1 = int(len(str(data1)))
        data_size2 = int(len(str(data2)))
    return(data_size1, data_size2)

def two_number_sum(data1, data2):
    result = data1 + data2
    if int(len(str(result))) > 80:
        print("overflow")
    else:
        print(result)

def main():
    a = []
    N = int(input())
    for i in range(N*2):
        a.append(input())
    for i in range(0, N*2):
        if i % 2 == 0:
            continue
        else:
            data1 = int(a[i-1])
            data2 = int(a[i])
            if(data1 == None):
                data1 = 0
            elif(data2 == None):
                data2 = 0
            x, y = calc_digit(data1, data2)
            if(x > 80 or y > 80):
                print("overflow")
                continue
            two_number_sum(data1, data2)

if __name__ == '__main__':
    main()

