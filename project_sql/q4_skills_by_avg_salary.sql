/*
Query 4
    Question: Which skills are associated with the highest paying average salary for Data Analysts?
    - Compile a list of skills included in Data Analyst positions.
    - Find averages of yealy salaries, ensuring NULL records are not included.
    
    Goal: Identify if there is a trend in the types of skills associated with high average salaries.
*/

SELECT
    skills,
    ROUND (AVG(salary_year_avg), 0) AS avg_salary,
    COUNT(salary_year_avg) AS salary_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND search_location = 'Canada'
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY avg_salary DESC

/*
Key Insights:
    1. Cloud Based Analytical Tools have the highest salaries, echoing the shift to cloud-based computing.
    2. Despite being essential as found in Query 3, Traditional BI tools [Tableau (19), PowerBI (21) along with Python (20) & SQL (22) do not rank high in average pay.
    3. Google Sheets and Visio surprisingly appear in the $100K+ range.
*/