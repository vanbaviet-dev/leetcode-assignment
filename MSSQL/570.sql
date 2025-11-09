SELECT 
e2.name as name
FROM 
Employee e1 INNER JOIN Employee e2
ON e1.managerId = e2.id
GROUP BY e2.id,e2.name
having count(1)>4