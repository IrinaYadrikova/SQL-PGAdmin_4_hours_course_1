/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles available remotely and in the UK.
- Focuses on job posting with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into the employment files.
*/

SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
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