while 1:
    try:
        n = int(input())
    except:break
    
    if(n == 0):break

    sum = 0
    arr = []
    isPlus = True
    maxValue = -100000
    for i in range (n):
        try:
            arr.append(int(input()))  
        except:break
           
        if arr[i] < 0:
            # 合計が0以下になってしまった場合はこれ以上計算しても意味がないのでスルーする
            if sum > 0:
                # plusが連続して続いていた場合
                if(isPlus):
                    # 最大値を更新
                    maxValue = max(maxValue,sum)
                    isPlus = False
                sum += arr[i]
                # 0未満になったら、1から計算し直す
                if sum < 0 :
                    sum = 0
        else :
            sum += arr[i]
            isPlus = True
    if sum != 0 :
        maxValue = max(maxValue,sum)
    # 入力値が全てminusなので、入力値から最大のものを探す    
    else :
        for i in arr:
            maxValue = max(maxValue,i)
    print(maxValue)
