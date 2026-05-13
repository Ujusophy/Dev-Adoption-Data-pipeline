SELECT
    ResponseId                  AS response_id,
    Age                         AS age,
    Country                     AS country,
    DevType                     AS developer_type,
    YearsCode                   AS years_coding,
    AISelect                    AS ai_adoption,
    AIAcc                       AS ai_trust,
    AISent                      AS ai_sentiment,
    AIThreat                    AS ai_threat,
    AIFrustration               AS ai_frustration,
    AIAgents                    AS ai_agents,
    AIHuman                     AS ai_human,
    JobSat                      AS job_satisfaction,
    Industry                    AS industry,
    RemoteWork                  AS remote_work,
    ConvertedCompYearly         AS yearly_salary
FROM {{ source('stackoverflow', 'survey_raw') }}
WHERE AISelect IS NOT NULL