/*
What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
-Focuses on roles with specified salaries, regardless of location
_ Why? It reveals how different skills impact salary levels for Data Analysts and helps identify the most financially rewarding skills to acquire or improve
*/


SELECT 
    skills,
    round(AVG (salary_year_avg)) AS avg_salary
FROM job_postings_fact jp
INNER JOIN skills_job_dim ON jp.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE
    job_title_short='Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE 
GROUP BY
    skills
ORDER BY
    avg_salary DESC
Limit 50

/*

Here are three top-paying skills with their areas of use:

PySpark ($208,172) – Big Data & Distributed Computing (used in industries like finance and healthcare for large-scale data processing).
Bitbucket ($189,155) – Version Control & DevOps (critical for software development and managing CI/CD pipelines).
Watson ($160,515) – AI & Machine Learning (leveraged in healthcare and finance for AI-driven solutions).
These skills represent high-demand areas in big data, software development, and AI.

The most in-demand skills can typically be determined by their frequency of occurrence in job postings. Based on the dataset you provided earlier and general trends from top-paying data analyst roles, the most in-demand skills are:

SQL – Frequently mentioned in job postings and essential for querying and managing databases.
Python – Highly valued for data manipulation, analysis, and machine learning.
Tableau – A popular tool for data visualization.
R – A programming language specifically for statistics and data analysis.
Pandas – A Python library essential for data manipulation and analysis.
Snowflake – A cloud data platform frequently sought for data management.
Azure – A popular cloud service by Microsoft, often required for data analytics roles.
Excel – Despite being a long-standing tool, Excel remains in high demand for basic data handling.
Databricks – A unified data analytics platform that has grown in demand for managing large-scale data analytics.
Golang – Gaining popularity in data engineering roles for backend and system-level programming.
*/