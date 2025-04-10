l = [['the', 'uif', 'vjg', 'wkh', 'xli', 'ymj', 'znk', 'aol', 'bpm', 'cqn', 'dro', 'esp', 'ftq', 'gur', 'hvs', 'iwt', 'jxu', 'kyv', 'lzw', 'max', 'nby', 'ocz', 'pda', 'qeb', 'rfc', 'sgd'], \
['this', 'uijt', 'vjku', 'wklv', 'xlmw', 'ymnx', 'znoy', 'aopz', 'bpqa', 'cqrb', 'drsc', 'estd', 'ftue', 'guvf', 'hvwg', 'iwxh', 'jxyi', 'kyzj', 'lzak', 'mabl', 'nbcm', 'ocdn', 'pdeo', 'qefp', 'rfgq', 'sghr'], \
['that', 'uibu', 'vjcv', 'wkdw', 'xlex', 'ymfy', 'zngz', 'aoha', 'bpib', 'cqjc', 'drkd', 'esle', 'ftmf', 'gung', 'hvoh', 'iwpi', 'jxqj', 'kyrk', 'lzsl', 'matm', 'nbun', 'ocvo', 'pdwp', 'qexq', 'rfyr', 'sgzs']]

while 1:
    try:
        s = raw_input()
        for w in l:
            for i in xrange(25):
                o = w[i]
                if s.find(w[i]) != -1:
                    r = ''
                    for c in s:
                        if c == ' ' or c == '.' : r+= c
                        else: r += chr((ord(c) - ord('a') - i) % 26 + ord('a'))
                    print r
                    break
            else:
                continue
            break
    except:
        break