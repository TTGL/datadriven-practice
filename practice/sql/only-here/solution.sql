SELECT
  mf.feat_name,
  LOWER(mf.dtype) AS dtype,
  AVG(mf.avg_val),
  AVG(mf.null_pct)
FROM ml_features mf
WHERE mf.source = 'transactions'
  AND NOT EXISTS (
    SELECT
      1
    FROM ml_features mf_s
    WHERE source IN ('page_views', 'ad_impressions')
      AND mf_s.feat_name = mf.feat_name
      AND LOWER(mf_s.dtype) = LOWER(mf.dtype)
  )
GROUP BY feat_name, LOWER(mf.dtype)
