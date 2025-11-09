---a
with
    cte as (
        SELECT
            player_id,
            MIN(event_date) as first_login
        FROM
            Activity
        GROUP BY
            player_id
    ),
    cte2 as (
        select
            CAST(count(1) as decimal(10, 2)) as num_player
        from
            Activity a
            inner join cte c on a.player_id = c.player_id
        WHERE
            a.event_date = DATEADD (day, 1, c.first_login)
    ),
    cte3 as (
        select
            count(1) as total_player
        from
            (
                select distinct
                    player_id
                from
                    Activity
            ) t
    )
SELECT
    CAST(num_player / total_player as decimal(10, 2)) as fraction
FROM
    cte2,
    cte3