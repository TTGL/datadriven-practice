def chunk_list(records, n):
  split = []
  
  for item in records:
    if len(split) == 0:
      split.append([item])
      continue
    
    if len(split[-1]) < n:
      split[-1].append(item)
    else:
      split.append([item])
  
  return split
