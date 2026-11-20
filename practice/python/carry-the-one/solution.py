def borrow_positions(a, b):
    output = []
    # Enforce the same length
    while len(a) > len(b):
        b.append(0)
     
    for index in range(0, len(a)):
        diff = a[index] - b[index]
        if diff < 0:
            output.append(index)
            # Mark the borrow made with a -1 for the next index
            a[index+1] -= 1

    return output
