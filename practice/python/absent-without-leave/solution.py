def find_missing_ranges(nums: list, lower: int, upper: int) -> list:
    output = []
    
    if not nums:
        return [[lower, upper]]
    temp = [x for x in nums if x >= lower and x <= upper]
    temp = [lower - 1] + temp + [upper + 1]
    
    for index in range(1,len(temp)):
        if temp[index-1] == temp[index] or temp[index-1] + 1 == temp[index]:
            continue
        else:
            output.append([temp[index-1] + 1, temp[index] - 1])
    return output
