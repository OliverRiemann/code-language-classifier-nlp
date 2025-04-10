import string
import sys


def check_exists(word_set, rotate_dict, search):
    for word in word_set:
        rotated_word = ''.join(rotate_dict[s] for s in word)
        if rotated_word == search:
            return True
    return False


for line in sys.stdin:
    alphabets = string.ascii_lowercase
    frequency = [t[1] for t in sorted([(line.count(s), ord(s)) for s in alphabets], reverse=True)]
    freq_chr_offset = (4, 0, 19, 8, 14)
    ss = list(map(lambda word: word.strip('.\n'), line.split()))
    sl3, sl4 = set(s for s in ss if len(s) == 3), set(s for s in ss if len(s) == 4)

    i, rotate_dict = 0, None
    for order in frequency:
        for offset in freq_chr_offset:
            i = 97 + offset - order
            rotate_dict = {a: b for a, b in zip(alphabets, alphabets[i:] + alphabets[:i])}
            if (check_exists(sl3, rotate_dict, 'the')
                    + check_exists(sl4, rotate_dict, 'this')
                    + check_exists(sl4, rotate_dict, 'that')) > 0:
                break
        else:
            continue
        break

    print(''.join(rotate_dict[s] if s.isalpha() else s for s in line), end='')