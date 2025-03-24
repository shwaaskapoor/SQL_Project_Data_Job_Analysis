/*
Query 2
    Question: What skills were required for the top-paying Data Analyst jobs in Canada in 2023?
    - Use the top 15 highest paying jobs from Query 1.
    - Identify and add specific skills required for these roles.
    Goal: Understand what skills job seekers should develop to be competitive candidates for high-paying jobs.
*/

WITH top_paying_jobs AS
(
    SELECT
        job_id,
        job_title,
        company_dim.name AS company_name,
        salary_year_avg
    FROM
        job_postings_fact
    LEFT JOIN
        company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        search_location = 'Canada' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 15
)

Select
    top_paying_jobs.*,
    skills
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
salary_year_avg DESC

/*
Key Insights:

  The Most In-Demand Skills are:
  - SQL (9 mentions) is the most required skill.
  - Python (8 mentions) is also highly sought after.
  - Tableau (5 mentions) is the most in-demand visualization tool.

  General Analytics Tools:
  - Excel (3 mentions) and Google Sheets (2 mentions) still appear in job listings, showing that spreadsheet skills are relevant.
  - SAS (2 mentions) is required in a few roles.

  Skill Variety:
  - There are 25 unique skills in total, suggesting a diverse range of technical expertise is required across different roles.

Results:

[
  {
    "job_id": 475626,
    "job_title": "Principal Data Analyst",
    "company_name": "Realtime Recruitment",
    "salary_year_avg": "160000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 475626,
    "job_title": "Principal Data Analyst",
    "company_name": "Realtime Recruitment",
    "salary_year_avg": "160000.0",
    "skills": "power bi"
  },
  {
    "job_id": 475626,
    "job_title": "Principal Data Analyst",
    "company_name": "Realtime Recruitment",
    "salary_year_avg": "160000.0",
    "skills": "looker"
  },
  {
    "job_id": 587198,
    "job_title": "Data Architect",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "120000.0",
    "skills": "sql"
  },
  {
    "job_id": 587198,
    "job_title": "Data Architect",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "120000.0",
    "skills": "azure"
  },
  {
    "job_id": 587198,
    "job_title": "Data Architect",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "120000.0",
    "skills": "aws"
  },
  {
    "job_id": 587198,
    "job_title": "Data Architect",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "120000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 587198,
    "job_title": "Data Architect",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "120000.0",
    "skills": "redshift"
  },
  {
    "job_id": 587198,
    "job_title": "Data Architect",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "120000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 587198,
    "job_title": "Data Architect",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "120000.0",
    "skills": "gcp"
  },
  {
    "job_id": 587198,
    "job_title": "Data Architect",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "120000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1180796,
    "job_title": "Data Analyst, Growth",
    "company_name": "Stripe",
    "salary_year_avg": "111175.0",
    "skills": "sql"
  },
  {
    "job_id": 1180796,
    "job_title": "Data Analyst, Growth",
    "company_name": "Stripe",
    "salary_year_avg": "111175.0",
    "skills": "python"
  },
  {
    "job_id": 1180796,
    "job_title": "Data Analyst, Growth",
    "company_name": "Stripe",
    "salary_year_avg": "111175.0",
    "skills": "spark"
  },
  {
    "job_id": 1180796,
    "job_title": "Data Analyst, Growth",
    "company_name": "Stripe",
    "salary_year_avg": "111175.0",
    "skills": "hadoop"
  },
  {
    "job_id": 205303,
    "job_title": "Data Analyst, Risk User Experience",
    "company_name": "Stripe",
    "salary_year_avg": "111175.0",
    "skills": "sql"
  },
  {
    "job_id": 205303,
    "job_title": "Data Analyst, Risk User Experience",
    "company_name": "Stripe",
    "salary_year_avg": "111175.0",
    "skills": "python"
  },
  {
    "job_id": 205303,
    "job_title": "Data Analyst, Risk User Experience",
    "company_name": "Stripe",
    "salary_year_avg": "111175.0",
    "skills": "spark"
  },
  {
    "job_id": 205303,
    "job_title": "Data Analyst, Risk User Experience",
    "company_name": "Stripe",
    "salary_year_avg": "111175.0",
    "skills": "hadoop"
  },
  {
    "job_id": 409209,
    "job_title": "Data Analyst (VBA, Tableau)",
    "company_name": "Sun Life",
    "salary_year_avg": "109000.0",
    "skills": "sql"
  },
  {
    "job_id": 409209,
    "job_title": "Data Analyst (VBA, Tableau)",
    "company_name": "Sun Life",
    "salary_year_avg": "109000.0",
    "skills": "python"
  },
  {
    "job_id": 409209,
    "job_title": "Data Analyst (VBA, Tableau)",
    "company_name": "Sun Life",
    "salary_year_avg": "109000.0",
    "skills": "vba"
  },
  {
    "job_id": 409209,
    "job_title": "Data Analyst (VBA, Tableau)",
    "company_name": "Sun Life",
    "salary_year_avg": "109000.0",
    "skills": "excel"
  },
  {
    "job_id": 409209,
    "job_title": "Data Analyst (VBA, Tableau)",
    "company_name": "Sun Life",
    "salary_year_avg": "109000.0",
    "skills": "tableau"
  },
  {
    "job_id": 629221,
    "job_title": "Analytics Engineering Lead",
    "company_name": "Swiss Re",
    "salary_year_avg": "108415.5",
    "skills": "python"
  },
  {
    "job_id": 629221,
    "job_title": "Analytics Engineering Lead",
    "company_name": "Swiss Re",
    "salary_year_avg": "108415.5",
    "skills": "typescript"
  },
  {
    "job_id": 629221,
    "job_title": "Analytics Engineering Lead",
    "company_name": "Swiss Re",
    "salary_year_avg": "108415.5",
    "skills": "spark"
  },
  {
    "job_id": 1591043,
    "job_title": "Data Analyst, End to End Banking Operations",
    "company_name": "ATB Financial",
    "salary_year_avg": "105000.0",
    "skills": "sql"
  },
  {
    "job_id": 1591043,
    "job_title": "Data Analyst, End to End Banking Operations",
    "company_name": "ATB Financial",
    "salary_year_avg": "105000.0",
    "skills": "python"
  },
  {
    "job_id": 1591043,
    "job_title": "Data Analyst, End to End Banking Operations",
    "company_name": "ATB Financial",
    "salary_year_avg": "105000.0",
    "skills": "javascript"
  },
  {
    "job_id": 1591043,
    "job_title": "Data Analyst, End to End Banking Operations",
    "company_name": "ATB Financial",
    "salary_year_avg": "105000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 1591043,
    "job_title": "Data Analyst, End to End Banking Operations",
    "company_name": "ATB Financial",
    "salary_year_avg": "105000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1591043,
    "job_title": "Data Analyst, End to End Banking Operations",
    "company_name": "ATB Financial",
    "salary_year_avg": "105000.0",
    "skills": "sheets"
  },
  {
    "job_id": 1232872,
    "job_title": "Analytics Lab Architect",
    "company_name": "Swiss Re",
    "salary_year_avg": "101014.0",
    "skills": "azure"
  },
  {
    "job_id": 1232872,
    "job_title": "Analytics Lab Architect",
    "company_name": "Swiss Re",
    "salary_year_avg": "101014.0",
    "skills": "databricks"
  },
  {
    "job_id": 973984,
    "job_title": "Data Analyst - HoYolab and Content Creator",
    "company_name": "HoYoverse",
    "salary_year_avg": "100500.0",
    "skills": "sql"
  },
  {
    "job_id": 973984,
    "job_title": "Data Analyst - HoYolab and Content Creator",
    "company_name": "HoYoverse",
    "salary_year_avg": "100500.0",
    "skills": "excel"
  },
  {
    "job_id": 995289,
    "job_title": "Operation Data Analyst - Genshin Impact",
    "company_name": "HoYoverse",
    "salary_year_avg": "100500.0",
    "skills": "sql"
  },
  {
    "job_id": 995289,
    "job_title": "Operation Data Analyst - Genshin Impact",
    "company_name": "HoYoverse",
    "salary_year_avg": "100500.0",
    "skills": "python"
  },
  {
    "job_id": 995289,
    "job_title": "Operation Data Analyst - Genshin Impact",
    "company_name": "HoYoverse",
    "salary_year_avg": "100500.0",
    "skills": "sas"
  },
  {
    "job_id": 995289,
    "job_title": "Operation Data Analyst - Genshin Impact",
    "company_name": "HoYoverse",
    "salary_year_avg": "100500.0",
    "skills": "excel"
  },
  {
    "job_id": 995289,
    "job_title": "Operation Data Analyst - Genshin Impact",
    "company_name": "HoYoverse",
    "salary_year_avg": "100500.0",
    "skills": "sas"
  },
  {
    "job_id": 995289,
    "job_title": "Operation Data Analyst - Genshin Impact",
    "company_name": "HoYoverse",
    "salary_year_avg": "100500.0",
    "skills": "spss"
  },
  {
    "job_id": 452146,
    "job_title": "Data Analyst",
    "company_name": "ATB Financial",
    "salary_year_avg": "100500.0",
    "skills": "sql"
  },
  {
    "job_id": 452146,
    "job_title": "Data Analyst",
    "company_name": "ATB Financial",
    "salary_year_avg": "100500.0",
    "skills": "python"
  },
  {
    "job_id": 452146,
    "job_title": "Data Analyst",
    "company_name": "ATB Financial",
    "salary_year_avg": "100500.0",
    "skills": "tableau"
  },
  {
    "job_id": 452146,
    "job_title": "Data Analyst",
    "company_name": "ATB Financial",
    "salary_year_avg": "100500.0",
    "skills": "looker"
  },
  {
    "job_id": 452146,
    "job_title": "Data Analyst",
    "company_name": "ATB Financial",
    "salary_year_avg": "100500.0",
    "skills": "sheets"
  },
  {
    "job_id": 452146,
    "job_title": "Data Analyst",
    "company_name": "ATB Financial",
    "salary_year_avg": "100500.0",
    "skills": "visio"
  },
  {
    "job_id": 452146,
    "job_title": "Data Analyst",
    "company_name": "ATB Financial",
    "salary_year_avg": "100500.0",
    "skills": "jira"
  },
  {
    "job_id": 1201997,
    "job_title": "Data Strategy Product Manager",
    "company_name": "Kinaxis",
    "salary_year_avg": "99150.0",
    "skills": "sap"
  },
  {
    "job_id": 149920,
    "job_title": "Data Analyst 2",
    "company_name": "Zynga",
    "salary_year_avg": "99150.0",
    "skills": "sql"
  },
  {
    "job_id": 149920,
    "job_title": "Data Analyst 2",
    "company_name": "Zynga",
    "salary_year_avg": "99150.0",
    "skills": "python"
  },
  {
    "job_id": 149920,
    "job_title": "Data Analyst 2",
    "company_name": "Zynga",
    "salary_year_avg": "99150.0",
    "skills": "spark"
  },
  {
    "job_id": 149920,
    "job_title": "Data Analyst 2",
    "company_name": "Zynga",
    "salary_year_avg": "99150.0",
    "skills": "hadoop"
  },
  {
    "job_id": 149920,
    "job_title": "Data Analyst 2",
    "company_name": "Zynga",
    "salary_year_avg": "99150.0",
    "skills": "express"
  },
  {
    "job_id": 149920,
    "job_title": "Data Analyst 2",
    "company_name": "Zynga",
    "salary_year_avg": "99150.0",
    "skills": "tableau"
  }
]

*/