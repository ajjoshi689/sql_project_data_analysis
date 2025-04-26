/* 
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
  skills,
ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM 
  job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
job_title_short = 'Data Analyst' AND
salary_year_avg IS NOT NULL
AND
job_work_from_home = TRUE
GROUP BY
  skills
ORDER BY
 avg_salary DESC
LIMIT 25;


/* Here is a quick summary of the results for top paying skills for the position of data analyst.
- Top skills like Pyspark, Bitbucket, Couchbase, and Watson suggest that companies tend to value big data processing, cloud tools, and machine learning platforms.
- PySpark at 1 is likely due to the need to process large data sets.
- Core data skills like Pandas, Jupyter, and Numpy still rank high showcasing the importance of Python stack knowledge.
- DevOps/CI/CD tools like BitBucket,Gitlab and Jenkins are relevant to Data analysts and could be an indicator of close collaboration with data engineers. 


[
  {
    "skills": "pyspark",
    "avg_salary": "208172.250000000000"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189154.500000000000"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515.000000000000"
  },
  {
    "skills": "watson",
    "avg_salary": "160515.000000000000"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155485.500000000000"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500.000000000000"
  },
  {
    "skills": "swift",
    "avg_salary": "153750.000000000000"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152776.500000000000"
  },
  {
    "skills": "pandas",
    "avg_salary": "151821.333333333333"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000.000000000000"
  },
  {
    "skills": "golang",
    "avg_salary": "145000.000000000000"
  },
  {
    "skills": "numpy",
    "avg_salary": "143512.500000000000"
  },
  {
    "skills": "databricks",
    "avg_salary": "141906.600000000000"
  },
  {
    "skills": "linux",
    "avg_salary": "136507.500000000000"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "132500.000000000000"
  },
  {
    "skills": "atlassian",
    "avg_salary": "131161.800000000000"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000.000000000000"
  },
  {
    "skills": "airflow",
    "avg_salary": "126103.000000000000"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125781.250000000000"
  },
  {
    "skills": "jenkins",
    "avg_salary": "125436.333333333333"
  },
  {
    "skills": "notion",
    "avg_salary": "125000.000000000000"
  },
  {
    "skills": "scala",
    "avg_salary": "124903.000000000000"
  },
  {
    "skills": "postgresql",
    "avg_salary": "123878.750000000000"
  },
  {
    "skills": "gcp",
    "avg_salary": "122500.000000000000"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "121619.250000000000"
  }
]
*/