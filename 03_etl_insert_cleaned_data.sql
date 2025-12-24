INSERT INTO customers (
    customer_id,
    gender,
    senior_citizen,
    partner,
    dependents
)
SELECT
    customerID,
    gender,
    SeniorCitizen,
    Partner,
    Dependents
FROM telco_staging;

INSERT INTO services (
    customer_id,
    phone_service,
    multiple_lines,
    internet_service,
    online_security,
    online_backup,
    device_protection,
    tech_support,
    streaming_tv,
    streaming_movies
)
SELECT
    customerID,
    PhoneService,
    MultipleLines,
    InternetService,
    OnlineSecurity,
    OnlineBackup,
    DeviceProtection,
    TechSupport,
    StreamingTV,
    StreamingMovies
FROM telco_staging;

INSERT INTO billing (
    customer_id,
    contract,
    paperless_billing,
    payment_method,
    monthly_charges,
    total_charges
)
SELECT
    customerID,
    Contract,
    PaperlessBilling,
    PaymentMethod,
    CAST(MonthlyCharges AS DECIMAL(8,2)),
    CASE
        WHEN TRIM(TotalCharges) = '' THEN NULL
        ELSE CAST(TotalCharges AS DECIMAL(10,2))
    END
FROM telco_staging;

INSERT INTO churn_status (
    customer_id,
    tenure,
    churn
)
SELECT
    customerID,
    tenure,
    Churn
FROM telco_staging;
