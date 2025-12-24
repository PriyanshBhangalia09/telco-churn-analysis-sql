-- Overall churn rate
SELECT
    churn,
    COUNT(*) AS customers,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS churn_percentage
FROM churn_status
GROUP BY churn;

-- Churn by contract type
SELECT
    b.contract,
    cs.churn,
    COUNT(*) AS customers,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY b.contract),2) AS churn_percentage
FROM churn_status cs
JOIN billing b
    ON cs.customer_id = b.customer_id
GROUP BY b.contract, cs.churn
ORDER BY b.contract, cs.churn;

-- Revenue impact of churn
SELECT
    cs.churn,
    COUNT(*) AS customers,
    ROUND(SUM(b.monthly_charges), 2) AS total_monthly_revenue,
    ROUND(AVG(b.monthly_charges), 2) AS avg_monthly_revenue
FROM churn_status cs
JOIN billing b
    ON cs.customer_id = b.customer_id
GROUP BY cs.churn;

-- Tenure-based churn analysis
WITH tenure_bucketed AS (
    SELECT
        CASE
            WHEN tenure <= 6 THEN '0–6 months'
            WHEN tenure <= 12 THEN '7–12 months'
            WHEN tenure <= 24 THEN '13–24 months'
            ELSE '25+ months'
        END AS tenure_bucket,
        churn
    FROM churn_status
)
SELECT
    tenure_bucket,
    churn,
    COUNT(*) AS customers,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY tenure_bucket),
        2
    ) AS churn_percentage
FROM tenure_bucketed
GROUP BY tenure_bucket, churn
ORDER BY
    CASE tenure_bucket
        WHEN '0–6 months' THEN 1
        WHEN '7–12 months' THEN 2
        WHEN '13–24 months' THEN 3
        ELSE 4
    END,
    churn;
