/* Write your T-SQL query statement below */
SELECT
    e.name as Employee
FROM
    Employee e
    inner join Employee m on e.managerId = m.id
where
    e.salary > m.salary