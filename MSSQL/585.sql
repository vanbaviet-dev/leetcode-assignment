/* Write your T-SQL query statement below */
with
    cte1 as (
        select
            pid,
            count(1) over (
                partition by
                    tiv_2015
                order by
                    tiv_2015
            ) as cnt_2015
        from
            Insurance
    ),
    cte2 as (
        select
            pid,
            tiv_2016,
            count(1) over (
                partition by
                    lat,
                    lon
                order by
                    lat,
                    lon
            ) as cnt_lat_lon
        from
            Insurance
    )
SELECT
    Round(sum(tiv_2016), 2) as tiv_2016
FROM
    cte1 c1
    inner join cte2 c2 on c1.pid = c2.pid
    and cnt_lat_lon = 1
    and cnt_2015 > 1