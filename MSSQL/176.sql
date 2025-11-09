with
    cte as (
        SELECT
            salary,
            dense_rank() over (
                order by
                    salary desc
            ) as rank
        FROM
            Employee
    )
select
    MAX(salary) as SecondHighestSalary
from
    cte
where
    rank = 2