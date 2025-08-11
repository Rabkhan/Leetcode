-- Write your PostgreSQL query statement below
Select id,
    (CASE 
    WHEN p_id is null THEN 'Root'
    WHEN id in (select p_id from tree) THEN 'Inner'
    else 'Leaf'
    END) AS type
FROM Tree

-- if id is Null then its root
-- if id > pid and id>pid then its inner node
-- if id > pid then it's leaf