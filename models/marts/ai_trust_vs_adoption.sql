SELECT
    ai_adoption,
    ai_trust,
    COUNT(*) AS total
FROM {{ ref('stg_survey') }}
GROUP BY ai_adoption, ai_trust