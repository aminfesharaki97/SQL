SELECT Base_Asset, Operation, SUM(Realized_Amount_For_Base_Asset_In_USD_Value), SUM(Realized_Amount_For_Base_Asset)
FROM TaxBinance
GROUP BY Base_Asset, Operation
ORDER BY Base_Asset;
