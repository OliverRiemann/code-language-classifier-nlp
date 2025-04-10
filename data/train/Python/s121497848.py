answermap=[0]*51
answermap[0] = 1
answermap[1] = 4
answermap[2] = 10
answermap[3] = 20
answermap[4] = 35
answermap[5] = 56
answermap[6] = 84
answermap[7] = 120
answermap[8] = 165
answermap[9] = 220
answermap[10] = 282
answermap[11] = 348
answermap[12] = 415
answermap[13] = 480
answermap[14] = 540
answermap[15] = 592
answermap[16] = 633
answermap[17] = 660
answermap[18] = 670
answermap[19] = 660
answermap[20] = 633
answermap[21] = 592
answermap[22] = 540
answermap[23] = 480
answermap[24] = 415
answermap[25] = 348
answermap[26] = 282
answermap[27] = 220
answermap[28] = 165
answermap[29] = 120
answermap[30] = 84
answermap[31] = 56
answermap[32] = 35
answermap[33] = 20
answermap[34] = 10
answermap[35] = 4
answermap[36] = 1
answermap[37] = 0
answermap[38] = 0
answermap[39] = 0
answermap[40] = 0
answermap[41] = 0
answermap[42] = 0
answermap[43] = 0
answermap[44] = 0
answermap[45] = 0
answermap[46] = 0
answermap[47] = 0
answermap[48] = 0
answermap[49] = 0
answermap[50] = 0

inputs = []

while True:
  try:
    inputs.append(int(input()))
  except EOFError:
    break

for i in inputs:
  print(answermap[i])