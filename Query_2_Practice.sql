SELECT COUNT(CASE WHEN L_SHIPDATE between '1992-07-05' and '1992-07-07' THEN 1 END)
FROM lineitem
;
