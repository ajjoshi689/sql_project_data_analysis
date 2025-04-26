/*
Question: What are the most in-demand skills for data analysts?
- Join job posting to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market,
providing insights into the most valuble skills for job seekers.
*/

SELECT 
    skills,
COUNT(skills_job_dim.job_id) AS demand_count
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
job_title_short = 'Data Analyst' AND
job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5

/*
Here is a quick summary of the results found in this query
- SQL is by far the most in demand role making it an essential tool for Data Analysts
- Python is no longer just for data scientists showing that analysts now must clean data, build small models or analyze larger datasets
- Excel continues to be useful in the field of data analytics
- Data visulization is critical as Tableau and Power BI both make the top 5
*/