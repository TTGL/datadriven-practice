def trap_rain_water(heights):
    water_volume = 0
    
    for indx in range(1, len(heights) - 1):
        level = min(max(heights[:indx]), max(heights[indx+1:]))
        if level > heights[indx]:
            water_volume += level - heights[indx]

    return water_volume
