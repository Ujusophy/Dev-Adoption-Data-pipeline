SELECT
    country,
    COUNT(*) AS total_developers,
    COUNT(CASE WHEN ai_adoption LIKE 'Yes%' THEN 1 END) AS ai_adopters,
    ROUND(
    COUNT(CASE WHEN ai_adoption LIKE 'Yes%' THEN 1 END) * 100.0 / COUNT(*), 
    1
) AS adoption_rate
FROM {{ ref('stg_survey') }}
GROUP BY country
HAVING COUNT(*) >= 50