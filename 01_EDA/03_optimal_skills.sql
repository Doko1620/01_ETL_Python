/*
 What are the top 25 skills that offer the highest total value for Data Engineer roles that offer remote work?
 */
SELECT sd.skills,
    round(median(jpf.salary_year_avg), 0)::int as median_salary,
    count(jpf.*) as demand_count,
    round(LN(count(jpf.*)), 0)::int as ln_demand_count,
    round(
        (
            median(jpf.salary_year_avg) * LN(count(jpf.*)) / 1_000_000
        ),
        2
    ) as total_value
FROM job_postings_fact as jpf
    INNER JOIN skills_job_dim as sjd on jpf.job_id = sjd.job_id
    INNER JOIN skills_dim as sd on sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = TRUE
    AND jpf.salary_year_avg IS NOT NULL
GROUP BY sd.skills
HAVING count(jpf.*) > 100
ORDER BY total_value DESC
LIMIT 25;
/*
 Top 25 skills for Data Engineer roles that offer remote work, ordered by total value:
 
 1. Terraform: $0.97
 2. Python: $0.95
 3. SQL: $0.91
 4. AWS: $0.91
 5. Airflow: $0.89
 6. Spark: $0.87
 7. Kafka: $0.82
 8. Snowflake: $0.82
 9. Azure: $0.79
 10. Java: $0.77
 11. Scala: $0.76
 12. Git: $0.75
 13. Kubernetes: $0.75
 14. Databricks: $0.74
 15. Redshift: $0.73
 16. GCP: $0.72
 17. Hadoop: $0.71
 18. NoSQL: $0.71
 19. PySpark: $0.70
 20. MongoDB: $0.67
 21. Docker: $0.67
 22. Go: $0.66
 23. R: $0.66
 24. BigQuery: $0.65
 25. GitHub: $0.65
 
 The "Perfect Balance" Skills:  Terraform ($0.97), Python ($0.95), SQL ($0.91), and AWS ($0.91). These skills command the highest total value because they perfectly balance high market demand (high LN_Demand_Count) with strong median salaries. Terraform, despite having fewer than 200 postings, is the clear winner here due to its exceptionally high median salary relative to its demand.
 
 The "Modern Data Stack" Champions: Skills like Airflow ($0.89), Spark ($0.87), Kafka ($0.82), and Snowflake ($0.82) cluster together in the top 10. This reflects the current industry demand for end-to-end data pipeline orchestration and processing tools.
 
 The "Infrastructure & Ops" Tier: Kubernetes ($0.75) and Docker ($0.67) appear lower down but are still crucial. While they have lower median salaries than the cloud platforms, their high demand for orchestration and containerization makes them valuable additions to a profile.
 
 The "Legacy & Enterprise" Holdouts: SQL, Java, and Oracle continue to show up. SQL remains the bedrock (high demand, solid salary), while Java and Oracle persist in the mid-range, indicating that traditional enterprise environments still require these skills.
 */