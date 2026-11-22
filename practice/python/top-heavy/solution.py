def inverted_triangle(n: int) -> list[str]:
    output = []
    for number in range(n,0,-1):
        output.append('*' * number)

    return output
