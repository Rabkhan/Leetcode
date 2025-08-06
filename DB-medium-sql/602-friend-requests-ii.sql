SELECT ID, COUNT(*) AS NUM
FROM (
SELECT  requester_id AS ID FROM RequestAccepted
UNION ALL
SELECT accepter_id AS ID FROM RequestAccepted) as sub
Group by id
ORDER BY NUM DESC
LIMIT 1
