/*
Query 3
    Question: What are the most in-demand skills for Data Analysts in Canada?
    - Join job postings to inner join table, similar to Query 2.
    - Identify the top 5 in-demand skills for a Data Analyst.
    - Focus on all job postings in Canada, regardless of salary.
    Goal: Identify the most desired skills for Data Analysts in the Canadian job market.
*/

SELECT
    skills,
    type,
    count(skills_job_dim.job_id) AS demand_count
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    search_location = 'Canada'
GROUP BY
    skills,
    type
ORDER BY
    demand_count DESC
LIMIT 10

/*
Key Insights:
    - Data Analysts should have knowledge of atleast one progreamming tool in order to be competitive.
    - MS Excel is more in-demand than Data Visualisation tools such as Power BI or Tableau.
    - SQL is by far the most in-demand skill that a Data Analyst can have.
*/