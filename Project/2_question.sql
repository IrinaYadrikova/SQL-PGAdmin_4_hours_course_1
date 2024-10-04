/*
Question 2: What skills are required for the top-paying data analyst jobs?
- Use the 10 top highest-paying Data Analyst jobs from the first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand specific skills,
    helping job seekers understand which skills to develop that align with top salaries
*/

--Use query fron the question 1 and add CTE 

WITH top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM job_postings_fact jp
    LEFT JOIN company_dim cd ON cd.company_id=jp.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location ='Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    jp.job_id,
    jp.job_title,
    jp.salary_year_avg,
    company_name,
    skills
FROM top_paying_jobs jp
INNER JOIN skills_job_dim ON jp.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

/*
Here are some insights from the skills data in your job postings for data analyst roles in 2023:

-SQL is the most frequently listed skill, appearing 8 times.
-Python is also highly sought after, with 7 occurrences.
-Tableau follows closely, appearing 6 times, indicating a strong demand for data visualization skills.
-R, a programming language for statistics, appears 4 times.
-Snowflake, Pandas, and Excel each appear 3 times, highlighting their importance in data analysis and management.
-Other notable mentions include Azure, Bitbucket, and Go, each appearing twice.
*/
