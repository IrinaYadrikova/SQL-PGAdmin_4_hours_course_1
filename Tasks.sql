SELECT
    job_title_short,
    job_location,
        CASE
            WHEN job_location = 'Anywhere' THEN 'Remote'
            WHEN job_location = 'London, UK' THEN 'Local'
            ELSE 'Onsite'
        END AS location_category
FROM job_postings_fact;

--Count number of jobs
SELECT
   COUNT (job_id) as number_job,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'London, UK' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact
GROUP BY location_category;
-- Subquery within FROM 
SELECT
    company_id,
    name as company_name
FROM company_dim
WHERE company_id IN 
    (
    SELECT 
        company_id
    FROM 
        job_postings_fact
    WHERE 
        job_no_degree_mention = TRUE
    ORDER BY
        company_id
    );

-- CTEs
WITH Company_count AS (
    SELECT 
        company_id,
        Count (*) number_companies
    FROM 
        job_postings_fact
    GROUP BY company_id
)

SELECT NAME as company_name,
    Company_count.number_companies as numbers
from company_dim
LEFT JOIN Company_count ON Company_count.company_id=company_dim.company_id
ORDER BY numbers DESC;


