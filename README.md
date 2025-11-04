# Telco Customer Churn Analysis (SQL + Power BI + Python)

## 📊 Overview
This project explores and predicts customer churn using the **Telco Customer Churn** dataset from Kaggle.  
It demonstrates an **end-to-end analytics pipeline** — from SQL data exploration to Power BI visualization and Python machine-learning classification.

---

## 🧠 Project Objectives
- Understand customer behavior and churn patterns.
- Identify top churn indicators through SQL and visualization.
- Build a **Logistic Regression** model to predict the likelihood of churn.
- Provide insights to help telecom companies improve customer retention.

---

## ⚙️ Tools & Skills Used
| Category | Tools / Skills |
|-----------|----------------|
| Database | **MySQL** – data cleaning, joins, aggregations, churn-related KPIs |
| Visualization | **Power BI** – KPI cards, churn by Internet type, contract type, and demographics |
| Machine Learning | **Python** (Pandas, Scikit-Learn) – preprocessing, feature engineering, Logistic Regression |
| Others | Feature Encoding (OneHotEncoder), Scaling (MinMaxScaler), Classification Metrics (Accuracy, AUC, ROC Curve) |

---

## 🧩 SQL Exploration
Performed descriptive analysis and created churn indicators such as:
- Total customers by gender, contract type, and internet service  
- Average tenure and monthly charges  
- Churn rate by payment method  
- Top churn drivers (e.g., Fiber Optic users, month-to-month contracts)

---

## 📈 Power BI Dashboard
Exported SQL results and visualized key metrics in Power BI:
- **KPIs:** Average Tenure, Overall Churn Rate  
- **Charts:** Churn by Internet Type, Churn by Contract Type, and Monthly Charges Distribution  
- **Design Focus:** Color-coded conditional formatting to emphasize churn hotspots  

---

## 🤖 Machine Learning Model
Used **Logistic Regression** to predict churn probability.

### Key Steps
1. Data preprocessing & encoding (OneHotEncoder + ColumnTransformer)  
2. Train-test split (80 / 20)  
3. Scaling with MinMaxScaler  
4. Model training and evaluation

### Results
| Metric | Score |
|---------|-------|
| **Accuracy** | 0.81 |
| **AUC Score** | 0.83 |
| **ROC Curve** | Smooth upward trend, strong separability between churn vs non-churn |

---

## 🧠 Key Insights
- Customers on **month-to-month contracts** churn the most.  
- **Fiber optic users** show the highest churn rate (~41 %).  
- Longer tenure strongly reduces churn likelihood.  
- High monthly charges combined with short tenure indicate high churn risk.

---


