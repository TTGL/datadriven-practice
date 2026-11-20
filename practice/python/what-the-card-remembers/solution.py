def merge_holds(holds: list) -> dict:
  holds_registry: dict = {}
  # Iterating over all the input holds once to place then into respective buckets
  holds_sorted = sorted(holds, key=lambda x: (x["card"], x["start"]))
  for hold in holds_sorted:

    if hold["card"] in holds_registry:
      # Every time we must...
      curr_start, curr_end = hold["start"], hold["end"]
      prev_start, prev_end = tuple(holds_registry[hold["card"]][-1])
      if curr_start >= prev_start and curr_start <= prev_end:
        holds_registry[hold["card"]][-1] = [prev_start, max(curr_end, prev_end)]
      else:
        holds_registry[hold["card"]].append([curr_start, curr_end])
    else:
      # Add new entry if hold["card"] value was encountered the first time
      holds_registry[hold["card"]] = [[hold["start"], hold["end"]]] 
  
  return holds_registry
