/*
QUESTION: What are the top skills based on salary
- Looking at the average salary associated with each skill for Data Analyst positions
- Focusing on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and helps identify
the most financially rewarding skills to acquire or improve.
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
    AND job_location = 'South Africa' 
GROUP BY 
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;


/*
INSIGHTS:
- Programming Languages Dominate High Salaries, i.e, Pythin and R
-- Go (Golang) stands out as a high-paying skill, likely due to its growing use in back-end development and data pipelines for high-performance systems.

- Enterprise Tools are Key. Skills like SAP and Power BI align with enterprise data management and business intelligence.

- Visualization Tools are Valuable:
Tableau and Power BI are prominent, highlighting the demand for professionals who can present data in a user-friendly and visually appealing manner for business decision-making.

- Data Engineering Skills are in Demand:
-- Hadoop, Cassandra, and NoSQL emphasize the importance of handling large datasets and unstructured data. These skills align with the increasing focus on big data infrastructure.

- SQL Remains a Staple:
-- Despite being a foundational skill, SQL continues to be a cornerstone of data analysis, with a competitive average salary.

- Specialized BI Tools are Rising:
-- Tools like Looker are gaining traction, reflecting the need for niche expertise in less mainstream but effective BI platforms.]

*/