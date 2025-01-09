# Introduction
Diving into the data job market! Focusing on data analyst roles, this project explores top-paying jobs 💰, in_demand skills 🔥, and where high demand meets high salary in data analytics.

SQl Queries? Check them out here: [project_sql folder](/SQL_Project_Data_Job_Analysis/project_sql/)


# Background
Driven by a quest to navigate the data analysr job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining others work to find optimal jobs. 

Data hails from [SQL Course](https://lukebarousse.com/sql)
It's packed with insights on job titles, salaries, locations, and essential skills.

### The questions answered through my SQL Queries were:

1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. WHat skills are most in-demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I used
For my deep dive into the data analyst job market, I harnessed the power of several key tools:

- **SQL** The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL**: The chosen database management system, ideal for handling the job posting data.
- **Visual Studio Code**: My go-to for database management and executing SQL queries
- **Git & GitHub**: Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis
Each Query for this project is aimed at investigating specific aspects of the data analyst job market. Here's how I approached each one of the questions:

### Top Paying Data Analyst Jobs
To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

```sql
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND -- Anywhere is Remote work
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```
### Quick Insights on Top-Paying Jobs

- Leadership Commands Top Salaries:

    Roles like Director of Analytics and Associate Director- Data Insights offer the highest pay due to strategic responsibilities.

- Specialized Analysts Earn Big:

    Principal Data Analysts and niche roles (e.g., AV performance, ERM) command premium salaries for expertise.

* Data Analysts Are Competitive:

    Standard roles (e.g., Mantys Data Analyst) can out-earn leadership positions with niche skillsets or industries.

* Remote/Hybrid Work Pays Well:

    Flexibility boosts salaries, with many high-paying jobs offering remote or hybrid options.

* Demand Spanning Industries:

    Top-paying jobs span tech, healthcare, marketing, and autonomous systems, showing broad demand for analytics expertise.

![Top Paying Roles](SQL_Project_Data_Job_Analysis\assets\Top Paying Roles.png)
*Bar graph visualizing the salary for the top 10 salaries for data analysts; ChatGPT generated this graph from my SQL query results*


# What I learned
Throughout this adventure, I've turbocharged my SQL toolkit with some serious firepower:

- **Complex query crafting:** Mastered the art of advanced SQL, merging tables like a pro and wielding WITH clauses for ninja-level temp table maneuvers.
- **Data Aggregation:** Got cozy with GROUP BY and turned aggregate functions like COUNT() and AVG() into my data-summarizing sidekicks.
- **Analytical Mastery:** Leveled up my real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries.

# Conclusions
This project enhanced my SQL skills and provided valuable insights into the data analyst job market. The findings from the analysis serve as a guide to prioritizing skill development and job search efforts. Aspiring data analysts can better position themselves in a competitive job market by focusing on high-demand, high-salary skills. This exploration highlights the importance of continuos learning and adaptation to emerging trends in the field of data analytics.