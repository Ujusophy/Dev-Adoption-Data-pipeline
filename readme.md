# Developer AI Adoption Pipeline

> 49,123 developers answered a survey about AI tools in 2025.  
> Some use it daily, some refuse to touch it and most are somewhere in the middle.  
> I built this pipeline to find out where exactly.

---

## What This Project Does

Takes raw survey data from the Stack Overflow 2025 Developer Survey, loads it into Snowflake, transforms it with dbt, and surfaces insights through a Power BI dashboard.

Three questions drive the analysis:

- Which developer types are adopting AI tools the fastest?
- Which countries lead in adoption?
- Does using AI more mean trusting it more?

---

## Stack

| Layer | Tool |
|---|---|
| Storage | Snowflake |
| Transformation | dbt |
| Visualization | Power BI |

---

## Project Structure

```
Dev-Adoption-Data-Pipeline/
  models/
    staging/
      stg_survey.sql               
      sources.yml                  
    marts/
      ai_adoption_by_devtype.sql   
      ai_adoption_by_country.sql   
      ai_trust_vs_adoption.sql    
      marts.yml                   
```

---

## Data Source

**Stack Overflow Annual Developer Survey 2025**

49,123 responses, 177 countries, 62 questions.

Download it here:
[kaggle.com/datasets/aliaslam25/stack-overflow-developer-survey-2025](https://www.kaggle.com/datasets/aliaslam25/stack-overflow-developer-survey-2025)

Load `survey_results_public.csv` into Snowflake as `survey_raw` before running dbt.

---

## How to Run It

**1. Clone the repo**
```bash
git clone https://github.com/Ujusophy/Dev-Adoption-Data-pipeline
cd Dev-Adoption-Data-pipeline
```

**2. Install dbt**
```bash
pip install dbt-snowflake
```

**3. Configure your Snowflake connection**

You need:
- Database: `dev_adoption`
- Schema: `stackoverflow`
- Warehouse: `dev_adoption_wh`

Update your `~/.dbt/profiles.yml` with your Snowflake credentials.

**4. Run the pipeline**
```bash
dbt run
dbt test
```

**5. View the docs**
```bash
dbt docs generate
dbt docs serve
```

---

## Key Findings

- **Senior executives** have the highest AI adoption rate across all developer types
- **Nepal** leads in adoption among countries with 50 or more responses
- Daily AI users show both higher trust and higher distrust than infrequent users. Experience with AI tools produces stronger opinions, not consensus.

---

## Notes

The raw survey has 160 columns and messy values like `"Yes, I use AI tools daily"` where you might expect a clean `"Yes"`. The staging layer handles that before anything reaches the mart models.

dbt tests are in `marts.yml` and run automatically with `dbt test`. They check for nulls and duplicates across all three mart models.

---

 [Medium](your-link)
