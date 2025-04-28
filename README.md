# Introduction
Dive into the data job market! Focusing on data analyst roles. this project showcases the top paying jobs, in-demand skills, and where demand meets high salary in data analytics.

SQ; queries used in the project : [project_sql folder](/project_sql/)
# Background
Given the competitive nature of todays job market, this project was designed to pinpoint top-paid and in-demand skills, allowing pursuing data analysts to gain insight on the field.

Data used in this project can be found on (https://lukebarousse.com/sql). The data is compiled of job titles, salaries, locations, and essntial skills.

#### The questions I wanted to answer through my SQL queries include:

1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn? 

# Tools I Used
For my adventure into the data analyst job market, I used a variety of tools:

-**SQL**: The backbone of my analysis, allowing me to query tge database and discover critical insights.
-**PostgreSQL**: The chosen database management system, ideal for handling the job posting data.
-**Visual Studio Code**: My go-to for database management and executing SQL queries.
- **Git & GitHub**: Essential for versian control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market. Here's how I approached each question:

### 1. Top Paying Data Analyst Jobs
In order to identify the highest-paying roles, I filtered out data analyst postions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

```sql
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
```

Here's the breakdown of the data found in the query above
-**Wide Salary Range:** The salaries of the top 10 companies ranged from $184,000 to $650,000, indicating significant salary potential in the field.
-**Diverse Employers-** The data showcased a varity of companies offering high salaries signifying the fields diversity across the industry.
-**Job Title Variety-** A majority of the roles showcased in the query include positions of leadership showcasing the value of leadership in the field.
![Top Paying Roles](project_sql\assets\Top_payed_roles.png)
*Bar graph visualizing the salries for the top 10 salaries for data analysts; ChatGPT generated this graph from my SQL query results*

### 2. Top Paying Data Analyst Skills
In order to find the skills associated with these high salary jobs, I joined the job postings with the skills data, providing insights into what employers value for high compenastion roles.

```sql
WITH top_paying_jobs AS (

    SELECT
        job_id,
        job_title,
        salary_year_avg,
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
)

SELECT 
    top_paying_jobs.*,
    skills
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC
```
    Here's the breakdown of the data found in the query above
- **Skill Frequency-** SQL Python, and R make up the most frequent skills required for data analytics.
- **Salary By Skill-** The average salaries are consistently high across technical skills.
-**Cloud Warehouse-** The data showcases a strong presense om modern data stacks such as Snowflake, AWS, and Azure.
![Top Payed Skills](project_sql\assets\skill_frequency.png)
*Bar graph visualizing skill frequency; Created through python coding in Google Colab*

### 3. Top In Demand Skills for Data Analyst Jobs
This query was used to find the most in vital skills to thrive in the field, focusing to areas with high demand

```sql
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
```

Here's the breakdown of the data found in the query above
-**SQL Supremacy-** SQL is by far the most in demand skill in the field making it vital for those pursuing data analytics.
-**Data Visualization-** Tableau and Power BI both being in the top 5 showcases the need of data visualization in the field.

| Skill    | Demand Count |
|:---------|:------------:|
| SQL      | 7291         |
| Excel    | 4611         |
| Python   | 4330         |
| Tableau  | 3745         |
| Power BI | 2609         |
*Table of demand for the top 5 skills in data analyst job postings*

### 4. Skills Based on Salary
Exploring the average salaries associated with different skills revealed which skills are the highest paying.

```sql
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
```

Here's the breakdown of the data found in the query above
-**The Power Of Pyspark-** Pyspark is associated with the top salary showcasing its value within the field
-**Core Skills-** Core data skills like Pandas, Jupyter, and Numpy still rank high showcasing the importance of Python stack knowledge.

# Skills and Average Salary

| Skill          | Average Salary (USD) |
|----------------|----------------------|
| PySpark        | 208,172              |
| Bitbucket      | 189,155              |
| Couchbase      | 160,515              |
| Watson         | 160,515              |
| DataRobot      | 155,486              |
| GitLab         | 154,500              |
| Swift          | 153,750              |
| Jupyter        | 152,777              |
| Pandas         | 151,821              |
| Elasticsearch  | 145,000              |
| GoLang         | 145,000              |
| NumPy          | 143,513              |
| Databricks     | 141,907              |
| Linux          | 136,508              |
| Kubernetes     | 132,500              |
| Atlassian      | 131,162              |
| Twilio         | 127,000              |
| Airflow        | 126,103              |
| Scikit-learn   | 125,781              |
| Jenkins        | 125,436              |
| Notion         | 125,000              |
| Scala          | 124,903              |
| PostgreSQL     | 123,879              |
| GCP            | 122,500              |
| MicroStrategy  | 121,619              |
*Table associating skill with salary*

### 5. Most Optimal Skills to Learn
Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and high salary.

```sql
WITH skills_demand AS (

    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_work_from_home = TRUE AND
        salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skill_id
), average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
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
        skills_job_dim.skill_id
)
    SELECT
        skills_demand.skill_id,
        skills_demand.skills,
        demand_count,
        avg_salary
    FROM
        skills_demand
    INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
    WHERE demand_count > 10
    ORDER BY
        avg_salary DESC,
        demand_count DESC
    LIMIT 25
```
Here's the breakdown of the data found in the query above
-**Must Know Skills-**SQL, Python, and Tableau remain in high demand as must know skills.
-**Low Demand High Salary-**Skills like GO, Snowflake, and BigQuery have large salaries but low demand,
these skills are more technical/engineering oriented skills.

# Skills, Demand, and Average Salary

| Skill ID | Skill         | Demand Count | Average Salary (USD) |
|----------|---------------|--------------|----------------------|
| 8        | Go            | 27           | 115,320              |
| 234      | Confluence    | 11           | 114,210              |
| 97       | Hadoop        | 22           | 113,193              |
| 80       | Snowflake     | 37           | 112,948              |
| 74       | Azure         | 34           | 111,225              |
| 77       | BigQuery      | 13           | 109,654              |
| 76       | AWS           | 32           | 108,317              |
| 4        | Java          | 17           | 106,906              |
| 194      | SSIS          | 12           | 106,683              |
| 233      | Jira          | 20           | 104,918              |
| 79       | Oracle        | 37           | 104,534              |
| 185      | Looker        | 49           | 103,795              |
| 2        | NoSQL         | 13           | 101,414              |
| 1        | Python        | 236          | 101,397              |
| 5        | R             | 148          | 100,499              |
| 78       | Redshift      | 16           | 99,936               |
| 187      | Qlik          | 13           | 99,631               |
| 182      | Tableau       | 230          | 99,288               |
| 197      | SSRS
*Table of high demand and high salary skills*
# What I Learned

This project has been helpful not only for insight into the filed of data analytics but improvement in my own SQL skills:

-**Complex Query Crafting:** Worked on more Advanced SQL commands such as merging tables and using WITH clauses.
-**Data Aggregation:** Became more familiar with Group By and aggregation functions like COUNT() and AVG.
-**Analytics:** I analyzed real life questions, tunring them into actionable, insightful SQL queries.
# Conclusions

### Closing Thoughts

This project was used to enhance my SQL skills while also providing valuable insight into the data analyst job market. The finding found in this project will prove to be useful for those wishing to enter the field such as myself. These findings can help aspiring analysts to better position themselves in the emerging world of data analytics.