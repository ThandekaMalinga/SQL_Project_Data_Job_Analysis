/*
Question: What are the most in-demand skills for data analysts?
Breaking down the question/query:
- Join job postings to inner join table similar to query?
-Identify the top 5 in-demand skills for a data analyst
- Focus on all job postings
- Why? Retrieves the top skills with the highest demand in job market,
providing insights into the most valuable skills for job seekers
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'South Africa' 
GROUP BY 
    skills
ORDER BY
    demand_count DESC
LIMIT 10


/*

INSIGHTS
- The most in-demand skill in SA is sql, quickly followed by excel
- Python, power, and sas are also in the top 5 in-demand skills, with python being number 1
- Top skills to develop as a data analyst in SA would be sql, excel and python.

*/
