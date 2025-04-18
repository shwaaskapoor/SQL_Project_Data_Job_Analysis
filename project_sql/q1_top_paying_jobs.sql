/*
Query 1

Question: What were the top-paying Data Analyst Jobs in 2023?
- Identify the top 15 highest-paying Data Analyst jobs available in Canada.
- Focus on job postings with specified salaries (remove nulls).

Goal: Highlight top-paying jobs for Data Analysts and offer insights into employment as a Data Analyst.

*/

SELECT
    job_id,
    job_title,
    company_dim.name AS company_name,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    job_work_from_home
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