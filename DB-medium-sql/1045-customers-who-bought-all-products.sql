SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT (DISTINCT product_key ) = (SELECT COUNT(*)FROM Product )




--ORDER BY customer_id

/*
-- DIDN'T SATISFY ALL TEST CASES
WITH AP AS 
(SELECT DISTINCT product_key 
FROM Product)

SELECT C.customer_id
FROM Customer C
JOIN AP  ON C.product_key = AP.product_key
GROUP BY C.customer_id
HAVING COUNT(AP.product_key) >1
ORDER BY C.customer_id
*/


