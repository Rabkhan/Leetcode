SELECT Department, Employee, Salary
FROM
(
    Select Department.name As Department,
    Employee.NAME AS Employee, 
    Employee.Salary AS Salary,
    RANK() OVER (PARTITION BY Employee.departmentId ORDER BY Employee.salary DESC) as rn 
    FROM Employee 
    LEFT JOIN Department  ON Department.id = Employee.departmentId
 )as sub

Where rn = 1
;