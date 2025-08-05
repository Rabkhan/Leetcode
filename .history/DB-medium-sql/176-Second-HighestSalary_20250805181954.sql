SELECT 
CASE 
WHEN COUNT (DISTINCT salary )> 1 THEN 
(
SELECT DISTINCT salary 
FROM Employee
ORDER BY salary DESC
LIMIT 1  OFFSET 1
) ELSE NULL

END AS SecondHighestSalary
FROM Employee;

-- Testing 