SELECT 
    job_title_short as title,
    job_location as location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST'  as date,
    EXTRACT (MONTH FROM job_posted_date) AS date_month

FROM job_postings_fact
LIMIT 10;

SELECT 
    count (job_id) as job,
    EXTRACT (MONTH FROM job_posted_date) AS date_month
FROM job_postings_fact
WHERE
    job_title_short='Data Analyst'
GROUP BY 
    date_month
ORDER BY job desc;

SELECT 
    job_schedule_type,
    AVG(salary_hour_avg) as per_Hour,
    AVG(salary_year_avg) as per_Year 
FROM job_postings_fact
WHERE job_posted_date > '2023/06/01'
GROUP BY 
    job_schedule_type;
--January
CREATE TABLE january_jobs AS   
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;
--February
CREATE TABLE february_jobs AS   
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;
--March
CREATE TABLE march_jobs AS   
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT job_posted_date
FROM march_jobs;