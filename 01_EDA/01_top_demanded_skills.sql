/*
 What are the top 10 skills in demand for Data Engineer roles that offer remote work?
 */
SELECT sd.skills,
    count(jpf.*) as demand_count
FROM job_postings_fact as jpf
    INNER JOIN skills_job_dim as sjd on jpf.job_id = sjd.job_id
    INNER JOIN skills_dim as sd on sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = TRUE
GROUP BY sd.skills
ORDER BY demand_count DESC
LIMIT 10;
/*
 Top 10 skills in demand for Data Engineer roles that offer remote work:
 SQL: 29,221 postings
 Python: 28,776 postings
 AWS: 17,823 postings
 Azure: 14,143 postings
 Spark: 12,799 postings
 Airflow: 9,996 postings
 Snowflake: 8,639 postings
 Databricks: 8,183 postings
 Java: 7,267 postings
 GCP: 6,446 postings
 */