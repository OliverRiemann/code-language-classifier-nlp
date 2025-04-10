import sys

count = int(raw_input())
#print count                                                                                                                                                                                                                                   
while 0 < count:
    count -=1
    #print count                                                                                                                                                                                                                               
    a = map(int,raw_input().split())
    #print a[0],a[1],a[2]                                                                                                                                                                                                                      

    if a[1]< a[2]:
        tmp = a[1]
        a[1] = a[2]
        a[2] = tmp

    if a[0] < a[1]:
        tmp = a[0]
        a[0] = a[1]
        a[1] = tmp

    n = a[1]*a[1] + a[2]*a[2]
    if a[0]*a[0] == n:
        print "YES"
    else:
        print "NO"