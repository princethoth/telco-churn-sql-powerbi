SELECT *
FROM `customer churn`;

CREATE TABLE customer_churn
LIKE `customer churn`;

INSERT customer_churn
SELECT *
FROM `customer churn`;

SELECT *
FROM customer_churn;

-- Remove_Duplicates
SELECT customerID, gender,
COUNT(*) AS duplicate_count
FROM customer_churn
GROUP BY customerID, gender
HAVING COUNT(*) >1;

-- Check for NUll values
SELECT COUNT(DISTINCT customerID), COUNT(*) 
FROM customer_churn;

SELECT
    SUM(customerID IS NULL) AS customerID_nulls,
    SUM(gender IS NULL) AS gender_nulls,
    SUM(SeniorCitizen IS NULL) AS seniorcitizen_nulls,
    SUM(Partner IS NULL) AS partner_nulls,
    SUM(Dependents IS NULL) AS dependents_nulls,
    SUM(tenure IS NULL) AS tenure_nulls,
    SUM(PhoneService IS NULL) AS phoneservice_nulls,
    SUM(MultipleLines IS NULL) AS multiplelines_nulls,
    SUM(InternetService IS NULL) AS internetservice_nulls,
    SUM(OnlineSecurity IS NULL) AS onlinesecurity_nulls,
    SUM(OnlineBackup IS NULL) AS onlinebackup_nulls,
    SUM(DeviceProtection IS NULL) AS deviceprotection_nulls,
    SUM(TechSupport IS NULL) AS techsupport_nulls,
    SUM(StreamingTV IS NULL) AS streamingtv_nulls,
    SUM(StreamingMovies IS NULL) AS streamingmovies_nulls,
    SUM(Contract IS NULL) AS contract_nulls,
    SUM(PaperlessBilling IS NULL) AS paperlessbilling_nulls,
    SUM(PaymentMethod IS NULL) AS paymentmethod_nulls,
    SUM(MonthlyCharges IS NULL) AS monthlycharges_nulls,
    SUM(TotalCharges IS NULL) AS totalcharges_nulls,
    SUM(Churn IS NULL) AS churn_nulls
FROM customer_churn;

SELECT *
FROM customer_churn;

-- Overall Churn Rate
SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 
        2
    ) AS churn_rate_percentage
FROM customer_churn;

-- Churn rate by gender
SELECT 
    gender,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100,
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY gender
ORDER BY churn_rate_percentage DESC;

-- Churn rate by Senior citizen 
SELECT 
    SeniorCitizen,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100,
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY SeniorCitizen
ORDER BY churn_rate_percentage DESC;

-- By Contract Type
SELECT 
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100,
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY Contract
ORDER BY churn_rate_percentage DESC;

-- By Internet Service Type
SELECT 
    InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100,
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY InternetService
ORDER BY churn_rate_percentage DESC;

-- By Payment Method 
SELECT 
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100,
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY PaymentMethod
ORDER BY churn_rate_percentage DESC;

-- Tenure 
SELECT 
    Churn,
    COUNT(*) AS total_customers,
    ROUND(AVG(tenure), 2) AS avg_tenure_months,
    MIN(tenure) AS min_tenure,
    MAX(tenure) AS max_tenure
FROM customer_churn
GROUP BY Churn;

-- Monthly Charges
SELECT 
    Churn,
    COUNT(*) AS total_customers,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthlycharges,
    MIN(MonthlyCharges) AS min_charges,
    MAX(MonthlyCharges) AS max_charges
FROM customer_churn
GROUP BY Churn;

-- Contract and Internet Service
 SELECT 
    Contract, InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100,
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY Contract, InternetService
ORDER BY churn_rate_percentage DESC;

-- Top Indicators
SELECT 
    'Contract Type' AS category,
    Contract AS subcategory,
    ROUND(AVG(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS churn_rate_percentage
FROM customer_churn
GROUP BY Contract

UNION ALL

SELECT 
    'Internet Service' AS category,
    InternetService AS subcategory,
    ROUND(AVG(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS churn_rate_percentage
FROM customer_churn
GROUP BY InternetService

UNION ALL

SELECT 
    'Payment Method' AS category,
    PaymentMethod AS subcategory,
    ROUND(AVG(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS churn_rate_percentage
FROM customer_churn
GROUP BY PaymentMethod

UNION ALL

SELECT 
    'Senior Citizen' AS category,
    CAST(SeniorCitizen AS CHAR) AS subcategory,
    ROUND(AVG(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS churn_rate_percentage
FROM customer_churn
GROUP BY SeniorCitizen

ORDER BY churn_rate_percentage DESC;


SELECT AVG(tenure) AS avg_tenure 
FROM customer_churn;











