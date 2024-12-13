-- Using a UNION to combine the tables

SELECT 
    job_title_short,
    company_id,
    job_location
FROM january_jobs

UNION  -- combines the result set, removes duplicates

SELECT 
    job_title_short,
    company_id,
    job_location
FROM february_jobs

UNION

SELECT 
    job_title_short,
    company_id,
    job_location
FROM march_jobs;

-- Using UNION ALL, keeps duplicate values

SELECT 
    job_title_short,
    company_id,
    job_location
FROM january_jobs

UNION ALL -- combines the result set, KEEPS duplicates

SELECT 
    job_title_short,
    company_id,
    job_location
FROM february_jobs

UNION ALL

SELECT 
    job_title_short,
    company_id,
    job_location
FROM march_jobs;


/*

PRACTICE PROBLEM
-	Get the corresponding skill and skill type for each job posting in q1
-	Include those without any skills too
-	Why? Look at the skills and the type for each job in the first quarter that has a salary > $70,000

*/

-- Retrieve skills and skill types for jobs in Q1 with salary > 70,000
-- UNION ALL ensures all entries, including duplicates if any

SELECT 
    jp.job_id, 
    jp.job_title, 
    s.skills, 
    s.type
FROM 
    job_postings_fact jp
LEFT JOIN 
    skills_job_dim sj ON jp.job_id = sj.job_id
LEFT JOIN 
    skills_dim s ON sj.skill_id = s.skill_id
WHERE 
    jp.salary_year_avg > 70000
    AND EXTRACT(QUARTER FROM jp.job_posted_date) = 1

UNION ALL

-- Include jobs without any associated skills explicitly
SELECT 
    jp.job_id, 
    jp.job_title, 
    NULL AS skills, 
    NULL AS type
FROM 
    job_postings_fact jp
WHERE 
    jp.salary_year_avg > 70000
    AND EXTRACT(QUARTER FROM jp.job_posted_date) = 1
    AND jp.job_id NOT IN (
        SELECT DISTINCT job_id FROM skills_job_dim
    );

-- Explanation:
-- - The first query retrieves jobs with skills and their types.
-- - The second query adds jobs without any skills using `NOT IN`.
-- - UNION ALL ensures no filtering of duplicates.


--- PRACTICE PROBLEM #2
/*
Find job postings from the first quarter that have a salary greater than $70K
- Combine job postings tables from the first quarter of 2023 (Jan-Mar)
- Get job postings with an average yearly salary > $70,000
*/

SELECT 
    quarter1_job_postings.job_title_short,
    quarter1_job_postings.job_location,
    quarter1_job_postings.job_via,
    quarter1_job_postings.job_posted_date::DATE,
    quarter1_job_postings.salary_year_avg
FROM (
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs
) AS quarter1_job_postings
 WHERE
    quarter1_job_postings.salary_year_avg > 70000 AND
    quarter1_job_postings.job_title_short = 'Data Analyst'
ORDER BY
    quarter1_job_postings.salary_year_avg DESC;