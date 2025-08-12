
/* 
--------------------------------

---- ITEMS BOUGHT IN 2019
WITH OB AS 
(SELECT buyer_id, SUM(item_id) as total_item_bought, order_date
FROM Orders
WHERE EXTRACT (YEAR FROM order_date::Date)= 2019
GROUP BY buyer_id, order_date
Order BY buyer_id),

-- MAPPING BUYER_ID WITH USER_ID BUT SELLER_ID IS THE USER_ID TO GET JOINING DATE --USER MAPPING
UM AS 
(
SELECT U.user_id, O.seller_id AS SD, U.join_date AS JD
FROM Users U

)

SELECT 
    OB.buyer_id AS buyer_id,
    UM.JD AS join_date,
    OB.total_item_bought AS orders_in_2019
FROM 
    OB
JOIN UM ON UM.SD = OB.buyer_id
GROUP BY OB.buyer_id, UM.JD, OB.total_item_bought
ORDER BY OB.buyer_id
*/