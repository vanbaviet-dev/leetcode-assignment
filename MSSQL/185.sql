/* Write your T-SQL query statement below */
WITH
    cte as (
        SELECT
            name,
            salary,
            dense_rank() over (
                partition by
                    departmentId
                order by
                    salary desc
            ) as dp_rank,
            departmentId
        from
            Employee
    )
select
    d.name as Department,
    c.name as Employee,
    c.salary as Salary
from
    cte c
    inner join Department d on c.departmentId = d.id
    and c.dp_rank < 4