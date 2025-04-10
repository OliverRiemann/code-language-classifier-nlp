class Solution(object):
    def combinationSum(self, target):
        candidates = []
        for i in range(10):
            candidates.append(i)
        stack = [(0, 0, [])]
        result = []
        while stack:
            total, start, res = stack.pop()
            if total == target and len(res) == 4:
                result.append(res)
            elif len(res) > 4:
            	continue
            if total == 0 and len(res) == 4:
            	continue
            for i in range(start, len(candidates)):
                t = total + candidates[i]
                if t > target:
                    break
                stack.append((t, i, res + [candidates[i]]))
        return result
    def duplicated(self, nums, i, j):
        for t in range(i, j):
            if nums[t] == nums[j]:
                return False
        return True
    def recursion(self, nums, i, n, result):
        if i == n - 1:
            temp = []
            for k in range(0, n):
                temp.append(nums[k])
            result.append(temp)
        else:
            for k in range(i, n):
                if self.duplicated(nums, i ,k):
                    temp = nums[k] #swap
                    nums[k] = nums[i]
                    nums[i] = temp
                    self.recursion(nums, i + 1, n, result)
                    temp = nums[k] #swap
                    nums[k] = nums[i]
                    nums[i] = temp
    def permuteUnique(self, nums):
        result = []
        self.recursion(nums, 0, len(nums), result)
        return result
# s = Solution()
# combination = s.combinationSum(35)
# m = 0
# for i in range(len(combination)):
#     m += len(s.permuteUnique(combination[i]))
# print m

while True:
    try:
        n = int(raw_input())
        s = Solution()
        combination = s.combinationSum(n)
        m = 0
        for i in range(len(combination)):
            m += len(s.permuteUnique(combination[i]))
        print m
    except (EOFError):
        break
# b = map(int, s2.split())