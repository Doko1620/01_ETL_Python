/*
 What are the top 25 skills that offer the highest median salary for Data Engineer roles that offer remote work?
 */
SELECT sd.skills,
    round(median(jpf.salary_year_avg), 0)::int as median_salary,
    count(jpf.*) as demand_count
FROM job_postings_fact as jpf
    INNER JOIN skills_job_dim as sjd on jpf.job_id = sjd.job_id
    INNER JOIN skills_dim as sd on sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = TRUE
GROUP BY sd.skills
HAVING count(jpf.*) > 100
ORDER BY median_salary DESC
LIMIT 25;
/*
 Top 25 skills for Data Engineer roles that offer remote work, ordered by median salary:
 Rust: $210,000
 Terraform: $184,000
 Go: $184,000
 Spring: $175,500
 Neo4j: $170,000
 GDPR: $169,616
 Zoom: $168,438
 GraphQL: $167,500
 MongoDB: $162,250
 FastAPI: $157,500
 Bitbucket: $155,000
 Django: $155,000
 Crystal: $154,224
 C: $151,500
 Atlassian: $151,500
 TypeScript: $151,000
 Kubernetes: $150,500
 Airflow: $150,000
 Ruby: $150,000
 Node: $150,000
 CSS: $150,000
 Redis: $149,000
 VMware: $148,798
 Ansible: $148,798
 Jupyter: $147,500
 
 The Niche Premium: Rust commands the absolute highest median salary ($210,000) but has a relatively low demand count (232). This indicates a premium paid for highly specialized, emerging, or difficult-to-hire roles.
 
 The "Sweet Spot": Terraform is arguably the most valuable skill to have on this list. It is tied for the second-highest median salary ($184,000) while also demonstrating massive market demand (3,248 postings).
 
 High Pay, Steady Demand: Golang also strikes a strong balance, tying Terraform in salary while maintaining a healthy demand count (912).
 
 General Core Skills: As we move down the top 10 (FastAPI, MongoDB, GraphQL), salaries stabilize between $155k–$167k with moderate demand.
 
 */