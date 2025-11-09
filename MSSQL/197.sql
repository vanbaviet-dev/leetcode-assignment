/* Write your T-SQL query statement below */
WITH
    cte as (
        SELECT
            id,
            temperature,
            recordDate,
            LAG (temperature) over (
                order by
                    recordDate asc
            ) as prev,
            LAG (recordDate) over (
                order by
                    recordDate asc
            ) as prevDate
        from
            Weather
    )
select
    id
from
    cte
where
    temperature > prev
    and prevDate = DATEADD (day, -1, recordDate)