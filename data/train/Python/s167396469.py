import sys
alpha = 'abcdefghijklmnopqrstuvwxyz'
def this(word):
    i=0
    t=[]
    for c in word:
        x=ord(c)-ord('this'[i])
        if x>=0:
            t.append(x)
        else:
            t.append(26+x)
    
        i+=1
    if(t[0]==t[1] and t[1]==t[2] and t[2]==t[3]):
        return t[0]
    return 30
def that(word):
    i=0
    t=[]
    for c in word:
        x=ord(c)-ord('that'[i])
        if x>=0:
            t.append(x)
        else:
            t.append(26+x)
    
        i+=1
    if(t[0]==t[1] and t[1]==t[2] and t[2]==t[3]):
        return t[0]
    return 30
def the(word):
    i=0
    t=[]
    for c in word:
        x=ord(c)-ord('the'[i])
        if x>=0:
            t.append(x)
        else:
            t.append(26+x)
    
        i+=1
    if(t[0]==t[1] and t[1]==t[2]):
        return t[0]
    return 30

for string in sys.stdin:
    for word in string.split(" "):
        if(len(word)==3):
           if the(word) < 30:
               x=the(word)
               break
        if(len(word)==4):
           if this(word) <30:
               x=this(word)
               break
           if that(word) <30:
               x=that(word)
               break

    result=""
    for c in string:
        if c in alpha:
            result+=alpha[alpha.find(c)-x]
        else:
            result+=c
    print result[:-1]