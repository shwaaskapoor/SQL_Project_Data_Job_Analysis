-- Total # of Data Analyst positions in Canada

    SELECT
        COUNT(job_id) AS jobs_with_salary
    FROM 
        job_postings_fact
    WHERE
        job_title_short = 'Data Analyst'
        AND search_location = 'Canada'
        AND salary_year_avg IS NOT NULL

