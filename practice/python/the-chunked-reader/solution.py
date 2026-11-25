def chunked_read(lines: list, chunk_size: int):
    output = []
    
    """
    How many full slices we can extract
    """
    full_batches = len(lines) // chunk_size
    
    if not full_batches:
        if lines:
            output.append(lines)
        return output

    for slice_end_idx in range(chunk_size - 1, (full_batches * chunk_size) + 1, chunk_size):
        slice_start_idx = (slice_end_idx - chunk_size) + 1
        output.append(lines[slice_start_idx:slice_end_idx + 1])
        
    if slice_end_idx < len(lines) - 1:
        output.append(lines[slice_end_idx + 1:])
      
    return output
