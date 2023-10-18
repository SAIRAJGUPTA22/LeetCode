WITH CumulativeSums AS (
  SELECT
    person_name,
    SUM(Weight) OVER (ORDER BY turn ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_weight
  FROM queue
)
SELECT
  person_name
FROM CumulativeSums WHERE cumulative_weight <= 1000 
ORDER BY cumulative_weight DESC LIMIT 1
