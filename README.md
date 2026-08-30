# Customer-Behaviour-Analysis
Building a complete workflow using Python, SQL and Power BI to transform a raw CSV to quality data and dashboards

🧩 Project Overview
Goal:  
Understand customer shopping behavior and identify the drivers of revenue, satisfaction, and discount usage.

Dataset:  
customer_shopping_behavior.csv (CSV → cleaned in Python → loaded into SQL Server → visualized in Power BI)

Tech Stack:
Python (Pandas, PyODBC, SQLAlchemy)
SQL Server (SSMS)
Power BI Desktop

🐍 1. Python Data Preparation 

✔ Data Loading & Initial Exploration

Inspected the dataset using:

“print(df.info()) # prints a concise technical summary of the DataFrame — basically a structural overview of our dataset.
“print(df.isnull().sum()) # to check check if we have null or empty values

✔ Cleaning Steps
Filled 37 missing review ratings using category‑wise median.

Standardized column names (lowercase + underscores).

Removed redundant column promo_code_used after confirming it duplicated discount_applied.

Converted purchase frequency words to numeric days.

Created age_group using quartiles (Young Adult, Adult, Middle-aged, Senior).

![image alt](https://github.com/fedefig/Customer-Behaviour-Analysis/blob/main/Python%20screens.png?raw=true)

✔ SQL Server Load
Connected Python → SQL Server using and then loaded the cleaned DataFrame in SSMS

✔ Key Insights From SQL Queries
1. Revenue by Gender
Shows which gender contributes most to total revenue.
Insight:  
One gender segment contributes significantly more revenue — useful for targeted marketing.

2. High‑Value Discount Users
Identifies customers who use discounts and spend above average.
Insight:  
Discounts are not only used by low‑spending customers — high spenders also rely on them, suggesting discounts may be strategically beneficial rather than margin‑destroying.

3. Top 5 Products by Review Rating
Ranks products by customer satisfaction.
Insight:  
Top‑rated products can be prioritized for promotions, inventory, and cross‑selling.

4. Shipping Type Comparison
Compares average purchase amounts across shipping methods.
Insight:  
Express shipping correlates with higher purchase amounts — indicating urgency buyers spend more.

5. Subscriber vs Non‑Subscriber Revenue
Insight:  
Subscribers generate higher average and total revenue — strong case for subscription program investment.

6. Discount Rate by Product
Insight:  
Some products rely heavily on discounts — useful for pricing strategy.

7. Customer Segmentation
Segments customers into New, Returning, Loyal.
Insight:  
Loyal customers form the largest revenue base — retention strategies matter.

8. Top 3 Products per Category
Insight:  
Category‑level best sellers help optimize inventory and merchandising

9. Revenue by Age Group
Insight:  
Certain age groups dominate revenue — supports demographic targeting.

![image alt](https://github.com/fedefig/Customer-Behaviour-Analysis/blob/main/SQL%20screens.png?raw=true)


⭐ Power BI Dashboard: generated a report connecting to SQL database, transforming SQL outputs into interactive visuals

![image alt](https://github.com/fedefig/Customer-Behaviour-Analysis/blob/main/BI%20screen.png?raw=true)

⭐ KPIs
1. Number of Customers — 3,9K
This KPI shows the total number of unique customers in the dataset.
It provides an immediate sense of dataset scale and helps contextualize all other metrics.
A higher customer count indicates broader behavioral patterns and more reliable insights.

2. Average Purchase Amount — $59,76
This KPI represents the mean value of all customer purchases:
Helps evaluate customer spending behavior, supports pricing strategy decisions and acts as a benchmark for identifying high‑value customers (e.g., those spending above average)

3. Average Review Rating — 3,75
This KPI measures overall customer satisfaction with purchased products.
It is useful for: quality control, product performance evaluation, identifying categories with lower satisfaction

📌 Why These KPIs Matter
Together, these three KPIs form the top‑level health indicators of the business:

Customer Volume → how many people the business reaches

Customer Value → how much they spend

Customer Satisfaction → how they feel about their purchases

🧠 Final Business Insights Summary
⭐ High‑value customers frequently use discounts
Discounting does not only attract low‑spending customers — it also retains high‑value ones.

⭐ Subscribers are the most profitable segment
They spend more per purchase and generate more total revenue.

⭐ Express shipping correlates with higher spending
Urgency buyers are willing to pay more.

⭐ Loyal customers dominate the customer base
Retention strategies (loyalty programs, personalized offers) are essential.

⭐ Product performance varies strongly by category
Top‑rated products should be prioritized for inventory and marketing.

⭐ Age groups show clear revenue differences
Targeted campaigns can increase conversion.
