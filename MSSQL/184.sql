/* Write your T-SQL query statement below */
with
    cte as (
        SELECT
            d.name as Department,
            maxSalary,
            m.departmentId
        FROM
            (
                SELECT
                    MAX(salary) as maxSalary,
                    departmentId
                FROM
                    Employee
                group by
                    departmentId
            ) m
            inner join Department d on m.departmentId = d.id
    )
select distinct
    c.Department as Department,
    e.name as Employee,
    e.salary as Salary
from
    Employee e
    inner join cte c on e.salary = c.maxSalary
    and e.departmentId = c.departmentId