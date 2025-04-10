#! -*- coding: utf-8-unix -*-
import math

if __name__=='__main__':
  # lines = [x.strip() for x in sys.stdin.readlines() if x != '' and x != '\n']
  # n = int(lines[0])
  n = int(raw_input())
  for i in xrange(n):
    # x1, y1, x2, y2, x3, y3, x4, y4 = map(float, lines[i+1].split(' '))
    x1, y1, x2, y2, x3, y3, x4, y4 = map(float, raw_input().strip().split(' '))
    # if x1 == x2 or x3 == x4:
    #   if x1 == x2 and x3 == x4:
    #     print 'YES'
    #   else:
    #     print 'NO'
    #   continue
    # elif y1 == y2 or y3 == y4:
    #   if y1 == y2 and y3 == y4:
    #     print 'YES'
    #   else:
    #     print 'NO'
    #   continue
    # else:
      # if (y2 - y1) * (x4 - x3) == (y4 - y3) * (x2 - x1):
    if math.fabs((y2 - y1) * (x4 - x3) - (y4 - y3) * (x2 - x1)) < 1e-10:
      print 'YES'
    else:
      print 'NO'
      # a1 = (y2 - y1) / (x2 - x1)
      # b1 = y1 - a1 * x1
      # a2 = (y4 - y3) / (x4 - x3)
      # b2 = y3 - a2 * x3
      # if (a1 == a2):# and (b1 != b2):
      #   print 'YES'
      # else:
      #   print 'NO'
    # except:
    #   break