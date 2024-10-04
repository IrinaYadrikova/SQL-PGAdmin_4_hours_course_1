WITH remoute_job_skills AS 
(
    SELECT
        skill_id,
        COUNT (*) AS Skill_count
    FROM 
        skills_job_dim
    INNER JOIN job_postings_fact ON job_postings_fact.job_id=skills_job_dim.job_id
    WHERE    job_work_from_home = 'TRUE'
    Group BY
        skill_id
) 
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    Skill_count
FROM remoute_job_skills 
INNER JOIN skills_dim ON skills_dim.skill_id=remoute_job_skills.skill_id
ORDER BY Skill_count DESC
LIMIT 5;

SELECT 
    quarter_1_jobs.job_title_short,
    quarter_1_jobs.job_location,
    quarter_1_jobs.job_via,
    quarter_1_jobs.job_posted_date::DATE,
    concat (quarter_1_jobs.salary_year_avg, '£')
FROM (
    select *
    FROM january_jobs
    UNION ALL
    select *
    FROM february_jobs
    UNION ALL
    select *
    FROM march_jobs
) AS quarter_1_jobs
WHERE
    quarter_1_jobs.salary_year_avg>70000
    AND
    quarter_1_jobs.job_title_short = 'Data Analyst'
ORDER BY 
    quarter_1_jobs.salary_year_avg  DESC
    ;