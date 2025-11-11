/* Write your T-SQL query statement below */
with
    cte as (
        select
            visit_date,
            people,
            LAG (id, 2) OVER (
                ORDER BY
                    ID
            ) as prev_2,
            LAG (id, 1) OVER (
                ORDER BY
                    ID
            ) as prev_1,
            id,
            LEAD (id, 1) OVER (
                ORDER BY
                    ID
            ) as nxt_1,
            LEAD (id, 2) OVER (
                ORDER BY
                    ID
            ) as nxt_2
        FROM
            Stadium
        WHERE
            people >= 100
    )
select
    id,
    visit_date,
    people
from
    cte
where
    (
        id - prev_2 = 2
        and id - prev_1 = 1
    )
    OR (
        id - prev_1 = 1
        and id - nxt_1 = -1
    )
    OR (
        id - nxt_1 = -1
        and id - nxt_2 = -2
    )