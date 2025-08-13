


/*
-- Creating initial price list before 16th august
WITH IP AS (SELECT 
    product_id, 
    (new_price - 10) AS initial_price,
    change_date
FROM Products
WHERE (change_date::Date) <= '2019-08-15'
GROUP BY product_id,new_price,change_date
ORDER BY change_date),

NP AS (
SELECT product_id, new_price 
FROM Products
WHERE (change_date:: DATE) > '2019-08-15'
GROUP BY product_id, new_price
ORDER BY product_id)

SELECT NP.product_id, NP.new_price
FROM NP 
JOIN IP ON NP.product_id = IP.product_id
WHERE NP.new_price > IP.initial_price
GROUP BY NP.product_id, NP.new_price
ORDER BY NP.product_id
*/