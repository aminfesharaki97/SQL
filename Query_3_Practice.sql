WITH customer_lifetime_value AS (
  SELECT
    c_custkey,
    c_name,
    c_address,
    c_nationkey,
    c_phone,
    c_acctbal,
    c_mktsegment,
    c_comment,
    SUM(o_totalprice) AS ltv
  FROM customer
  JOIN orders
    ON o_custkey = c_custkey
  GROUP BY 1, 2, 3, 4, 5, 6, 7, 8
)

SELECT
  r_name,
  MAX(ltv) AS best_customer_value
FROM region
JOIN nation
  ON n_regionkey = r_regionkey
JOIN customer_lifetime_value clv
  ON clv.c_nationkey = n_nationkey
GROUP BY 1
;
