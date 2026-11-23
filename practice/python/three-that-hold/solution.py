def triangle_validator(lengths: list[int]):
    counter = 0
    if len(lengths) < 3:
        return counter

    for index_1 in range(0, len(lengths) - 2):
        for index_2 in range(index_1 + 1, len(lengths)-1):
            for index_3 in range(index_2 + 1, len(lengths)):
                check_1 = lengths[index_1] - (lengths[index_2] + lengths[index_3])
                check_2 = lengths[index_2] - (lengths[index_1] + lengths[index_3])
                check_3 = lengths[index_3] - (lengths[index_2] + lengths[index_1])

                if check_1 < 0 and check_2 < 0 and check_3 < 0:
                    counter += 1

    return counter
