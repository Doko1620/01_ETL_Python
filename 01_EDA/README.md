# Data Engineering Skills Market Analysis

## Project Overview

This project analyzes remote Data Engineer job postings to identify:

* The most in-demand skills
* The highest-paying skills
* The optimal skills that balance both salary and market demand

The goal is to answer a practical career question:

> **Which Data Engineering skills provide the best return on learning investment?**

Using SQL and job market data, I explored thousands of remote Data Engineer job postings and quantified the relationship between skill demand and compensation.

---

## Business Problem

Data Engineering is a rapidly evolving field with dozens of technologies competing for attention.

As a learner or professional, it can be difficult to determine:

* Which skills are most frequently requested by employers
* Which skills command the highest salaries
* Which skills provide the best combination of demand and compensation

This analysis helps prioritize learning efforts based on real job market data.

---

## Dataset

The dataset contains job posting information including:

* Job title
* Company name
* Salary information
* Remote work availability
* Required skills

### Key Tables

| Table               | Description                          |
| ------------------- | ------------------------------------ |
| `job_postings_fact` | Job posting information              |
| `skills_job_dim`    | Bridge table between jobs and skills |
| `skills_dim`        | Skill definitions                    |

---

## Tools Used

* SQL
* DuckDB
* MotherDuck
* Git
* GitHub

---

## Analysis Questions

### 1. What skills are most in demand for remote Data Engineers?

### 2. Which skills offer the highest median salary?

### 3. Which skills provide the best balance between salary and demand?

---

# Analysis

## 1. Most In-Demand Skills

The query below identifies the skills most frequently requested in remote Data Engineer positions.

### Top 10 In-Demand Skills

| Skill      | Demand Count |
| ---------- | -----------: |
| SQL        |       29,221 |
| Python     |       28,776 |
| AWS        |       17,823 |
| Azure      |       14,143 |
| Spark      |       12,799 |
| Airflow    |        9,996 |
| Snowflake  |        8,639 |
| Databricks |        8,183 |
| Java       |        7,267 |
| GCP        |        6,446 |

### Key Insights

* SQL remains the foundation of modern data engineering.
* Python is nearly as essential as SQL.
* Cloud platforms dominate hiring requirements.
* Spark and Airflow are core technologies for large-scale data processing and orchestration.
* Modern data warehouse technologies such as Snowflake and Databricks continue to gain adoption.

**SQL Code** - [01_top_demanded_skills.sql](01_top_demanded_skills.sql)

---

## 2. Highest Paying Skills

To avoid salary outliers, median salary was used instead of average salary.

### Top Paying Skills

![Top Paying Skills](/assets/top_paying_skills_DE.png)

### Key Insights

* Rust commands the highest median salary at approximately $210,000.
* Terraform and Go provide an exceptional combination of modern infrastructure expertise and premium compensation.
* Specialized technologies often command higher salaries due to talent scarcity.
* Skills such as GraphQL, MongoDB, Kubernetes, and Airflow demonstrate strong salary potential while remaining relevant across many organizations.

**SQL Code** - [02_highest_paying_skills.sql](02_top_paying_skills.sql)

---

## 3. Optimal Skills: Balancing Salary and Demand

High salaries alone do not guarantee career value if demand is limited.

To identify the most valuable skills overall, a custom metric was created:

```sql
Total Value =
Median Salary × LN(Demand Count)
```

This metric rewards skills that have both:

* Strong compensation
* Strong market demand

### Optimal Skills Ranking

![Optimal Skills](/assets/optimal_skills.png)

### Top Skills by Total Value

| Rank | Skill     |
| ---: | --------- |
|    1 | Terraform |
|    2 | Python    |
|    3 | SQL       |
|    4 | AWS       |
|    5 | Airflow   |
|    6 | Spark     |
|    7 | Kafka     |
|    8 | Snowflake |
|    9 | Azure     |
|   10 | Java      |

### Key Insights

#### The Infrastructure Advantage

Terraform ranks as the most valuable skill overall due to its combination of:

* High salary
* Strong demand
* Growing adoption in cloud-native environments

#### The Core Data Engineering Stack

Python, SQL, AWS, Airflow, and Spark form the backbone of modern data engineering teams.

These technologies consistently appear across high-paying job postings.

#### Modern Data Platform Technologies

Kafka, Snowflake, Databricks, and Redshift demonstrate the industry's shift toward:

* Real-time data processing
* Cloud-native analytics
* Scalable data platforms

**SQL Code** - [03_optimal_skills.sql](03_optimal_skills.sql)

---

# Recommendations

Based on the analysis, aspiring Data Engineers should prioritize learning in the following order:

### Foundation

* SQL
* Python
* Git

### Cloud & Storage

* AWS
* Azure
* GCP
* Snowflake

### Data Processing

* Spark
* PySpark
* Kafka

### Orchestration & Infrastructure

* Airflow
* Terraform
* Docker
* Kubernetes

This learning path aligns closely with both employer demand and compensation trends.

---

# Conclusion

This analysis demonstrates that the most valuable Data Engineering skills are not necessarily the highest-paying niche technologies.

The strongest career opportunities come from skills that balance:

* Market demand
* Salary potential
* Industry adoption

The results suggest that a modern Data Engineer should focus on mastering:

**SQL + Python + Cloud Platforms + Data Pipelines + Infrastructure Automation**

to maximize both employability and earning potential.

---

## Future Improvements

* Analyze trends by country
* Compare remote vs on-site positions
* Explore salary differences by experience level
* Build an interactive dashboard using Power BI or Streamlit
* Create a fully automated ETL pipeline into MotherDuck

---

## Author

Daniel Aizat

Aspiring Data Engineer & AI Engineer focused on building data-intensive systems, analytics solutions, and machine learning applications.
