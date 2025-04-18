/*
Query 5
    Question: What are the most optimal skills to learn for a Data Analyst position in Canada?
    - Optimal is defined as being in high demand and associated with high average salaries.
    
    GOAL: Understand which skills will offer candidates a large opportunity pool (high demand) and be financially rearding (high salaries).
*/

WITH high_demand_skills AS
(
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND search_location = 'Canada'
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skill_id
), average_salary AS
(
    SELECT
        skills_job_dim.skill_id,
        ROUND (AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND search_location = 'Canada'
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills_job_dim.skill_id
)

SELECT
    high_demand_skills.skill_id,
    high_demand_skills.skills,
    demand_count,
    avg_salary
FROM
    high_demand_skills
INNER JOIN average_salary ON high_demand_skills.skill_id = average_salary.skill_id
ORDER BY
    demand_count DESC,
    avg_salary DESC

/*
Key Insights:
    - The sample size for Canadian Data Analyst jobs with an advertised Salary is low. 
        In the folder context_queries, you can see there only 31/2382 Data Analyst positions in Canada list salary amounts.
    - SQL, Python, and Tableau remain as core essential skills.
*/