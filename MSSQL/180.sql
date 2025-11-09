WITH
    cte as (
        select
            id,
            num,
            lead (num) over (
                order by
                    id
            ) as nxt,
            lag (num) over (
                order by
                    id
            ) as prev
        from
            Logs
    )
select distinct
    num as ConsecutiveNums
from
    cte
where
    num = nxt
    and num = prev