def clock_angle(hour: int, minute: int) -> float:
    hour_hand_deg = 30 * (hour + minute/60)
    minute_hand_deg = minute * 6
    absolute_diff = abs(hour_hand_deg - minute_hand_deg)
    
    if absolute_diff < 180:
        return absolute_diff
    else:
        return 360 - max(hour_hand_deg, minute_hand_deg) + min(hour_hand_deg, minute_hand_deg)
