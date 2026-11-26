def dictionary_key_intersection(d1: dict, d2: dict):
    output = []
    for k, v in d1.items():
        if k in d2:
            output.append([k,v])
    
    return sorted(output, key=lambda x: x[0])
