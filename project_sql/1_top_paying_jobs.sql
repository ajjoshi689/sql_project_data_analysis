/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest paying Data Analyst roles available remotely.
- Focuses on job postings with specified salaries (removing nulls).
- Why? I want to highlight the top-paying oppurtnities for Data Analysts
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10

/* This query showcases the top 10 highest paying Data Anlyst roles available remotely.
- As expected many of these titles include seniority indicating the relationship between leadership and higher salaries
- Major companies like Meta, AT&T, and UCLA Health dominate the top-paying roles
*/