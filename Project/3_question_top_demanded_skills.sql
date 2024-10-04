/*

Question 3: What are the skills most in demand by data analysts?
- Join job postings to the inner join table similar to query 2
-Identify the top 5 in-demand skills for a data analyst.
-Focus on all job postings.
_why? Retrieves the top 5 skills with the highest demand in the job market,
providing insights into the most valuable skills for job seekers.

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
*/

SELECT 
    skills,
    COUNT (skills_job_dim.job_id) AS demand_count
FROM job_postings_fact jp
INNER JOIN skills_job_dim ON jp.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE
    job_title_short='Data Analyst'
GROUP BY
    skills
ORDER BY
    demand_count DESC
Limit 5

