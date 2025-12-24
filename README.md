# Telco Customer Churn Analysis (SQL)

## 📌 Project Overview
This project analyzes customer churn in a subscription-based telecom business using **SQL**.  
The objective is to identify **who is churning, the key drivers of churn, and the revenue impact on the business**, using a structured SQL data pipeline and business-driven analysis.

The project demonstrates **data cleaning, relational modeling, window functions, and analytical reasoning** without using Python or BI tools.

---

## 📊 Dataset
- **Dataset:** Telco Customer Churn
- **Records:** 7,043 customers
- **Source:** Public telecom churn dataset (Kaggle / IBM sample)

The dataset includes customer demographics, services subscribed, billing details, contract types, tenure, and churn status.

---

## 🏗️ Data Pipeline & Modeling

### 1️⃣ Staging Layer
- Raw CSV data loaded into a staging table (`telco_staging`)
- All columns stored as `VARCHAR` initially
- Used to inspect and validate raw data before transformation

### 2️⃣ Final Normalized Tables
The dataset was logically split into four relational tables:

- `customers` – customer demographics  
- `services` – telecom services subscribed  
- `billing` – contract type and billing information  
- `churn_status` – tenure and churn flag  

All tables are linked using `customer_id` as **primary and foreign keys**, simulating a real-world analytics schema.

---

## 🧹 Data Cleaning (SQL)
Data cleaning was performed **during insertion from staging to final tables**.

Key cleaning steps:
- Identified hidden blank values in `TotalCharges` using `TRIM()`
- Converted blanks to `NULL` before casting to numeric values
- Used `CAST()` to enforce correct numeric data types
- Preserved business meaning by keeping `NULL` for customers with zero tenure (never billed)

---

## 🔍 Key Analyses

### ✔ Overall Churn
- **Churn rate:** 26.54%
- Indicates a significant retention issue for a subscription business

### ✔ Churn by Contract Type
- Month-to-month churn: **42.7%**
- One-year churn: **11.3%**
- Two-year churn: **2.8%**

➡ Churn is concentrated among flexible, non-committed customers.

### ✔ Revenue Impact of Churn
- Churned customers have **higher average monthly charges**
- Indicates loss of **high-value customers**, not just low-usage users

### ✔ Tenure-Based Churn
- **0–6 months:** 52.9% churn
- Churn decreases steadily with tenure
- Confirms that **early lifecycle churn** is the primary driver

---

## 📈 Business Insights
- Churn is driven primarily by early-stage customers
- High-paying, month-to-month users churn the most
- Long-term contracts reduce churn due to:
  - commitment
  - sunk cost effect
  - habit formation
  - ongoing engagement

---

## 💡 Recommendations
- Improve onboarding and value discovery in the first 90 days
- Incentivize early commitment using value-based offers (e.g., free months)
- Reduce early cancellation through pause or downgrade options
- Increase engagement using personalized recommendations

---

## 🛠️ Skills Demonstrated
- SQL data modeling and normalization
- Staging → transformation → analysis pipeline
- Data cleaning using `CASE`, `TRIM`, and `CAST`
- Joins, window functions (OVER, PARTITION BY), and conditional logic
- Translating SQL output into business insights

---

## 📁 Repository Structure
```text
telco-churn-analysis-sql/
│
├── README.md
├── sql/
│   ├── 01_staging_table.sql
│   ├── 02_final_tables.sql
│   ├── 03_data_cleaning_insert.sql
│   └── 04_churn_analysis.sql
```

---

## ✅ Conclusion
This project demonstrates how SQL can be used beyond basic querying to build an end-to-end analytics workflow, from raw data ingestion and cleaning to business-driven churn analysis.
By identifying early-stage churn, high-risk contract types, and revenue impact, the analysis highlights actionable insights that can directly support retention and growth strategies in a subscription-based business.
