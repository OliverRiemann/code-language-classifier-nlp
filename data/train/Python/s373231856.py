# usr/bin/python
# coding: utf-8
################################################################################
# Is it a Right Triangle?
# Write a program which judges wheather given length of three side form a right triangle.
# Print "YES" if the given sides (integers) form a right triangle, "NO" if not so.
#
# Input
# Input consists of several data sets. In the first line, the number of data set,
# N is given. Then, N lines follow, each line corresponds to a data set.
# A data set consists of three integers separated by a single space.
#
# Constraints
# 1 ??? length of the side ??? 1,000
# N ??? 1,000
# Output
# For each data set, print "YES" or "NO".
#
# Sample Input
# 3
# 4 3 5
# 4 3 6
# 8 8 8
# Output for the Sample Input
# YES
# NO
# NO
#
################################################################################

if __name__ == "__main__":
    num = int(input())
    inputline = [""]*num
    for i in range(0,num):
        inputline[i] = input()
    for line in inputline:
        a = int(line.split(" ")[0])
        b = int(line.split(" ")[1])
        c = int(line.split(" ")[2])
        if (a*a+b*b == c*c or b*b+c*c == a*a or c*c+a*a == b*b):
            print("YES")
        else:
            print("NO")