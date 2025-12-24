CREATE TABLE customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    gender VARCHAR(10),
    senior_citizen INT,
    partner VARCHAR(5),
    dependents VARCHAR(5)
);

CREATE TABLE services (
    customer_id VARCHAR(20) PRIMARY KEY,
    phone_service VARCHAR(5),
    multiple_lines VARCHAR(20),
    internet_service VARCHAR(20),
    online_security VARCHAR(20),
    online_backup VARCHAR(20),
    device_protection VARCHAR(20),
    tech_support VARCHAR(20),
    streaming_tv VARCHAR(20),
    streaming_movies VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE billing (
    customer_id VARCHAR(20) PRIMARY KEY,
    contract VARCHAR(20),
    paperless_billing VARCHAR(5),
    payment_method VARCHAR(50),
    monthly_charges DECIMAL(8,2),
    total_charges DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE churn_status (
    customer_id VARCHAR(20) PRIMARY KEY,
    tenure INT,
    churn VARCHAR(5),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);