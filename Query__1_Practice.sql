SELECT 
  c.c_mktsegment,
  COUNT(o.o_orderkey) AS num_orders, 
  SUM(li.l_quantity) AS total_quantity, 
  SUM(li.l_extendedprice) AS total_price
FROM lineitem li
JOIN orders o
  ON li.l_orderkey = o.o_orderkey
JOIN customer c 
  ON o.o_custkey = c.c_custkey
WHERE li.l_commitdate BETWEEN '1992-01-01T00:00:00Z' AND '1992-12-31T00:00:00Z'
GROUP BY c.c_mktsegment;
