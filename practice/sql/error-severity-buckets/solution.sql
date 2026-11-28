SELECT
    et.err_type,
    CASE
        WHEN et.count = 0
            THEN 'NONE'
        WHEN et.count BETWEEN 1 AND 5
            THEN 'LOW'
        WHEN et.count BETWEEN 6 AND 20
            THEN 'MODERATE'
        WHEN et.count BETWEEN 21 AND 50
            THEN 'HIGH'
        WHEN et.count > 50
            THEN 'CRITICAL'
    END AS severity_label
FROM err_tracks et
WHERE et.count IS NOT NULL
