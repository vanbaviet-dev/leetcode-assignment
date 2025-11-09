/* Write your T-SQL query statement below */
with
    cte as (
        SELECT
            t.client_id,
            t.driver_id,
            status,
            request_at,
            id,
            city_id
        FROM
            Trips t
            INNER JOIN (
                SELECT
                    users_id as client_id,
                    banned,
                    role
                FROM
                    Users
            ) u on t.client_id = u.client_id
            INNER JOIN (
                SELECT
                    users_id as driver_id,
                    banned,
                    role
                FROM
                    Users
            ) d on t.driver_id = d.driver_id
        WHERE
            u.banned = 'No'
            and d.banned = 'No'
            and t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
    ),
    cte_completed as (
        SELECT distinct
            COUNT(1) OVER (
                PARTITION by
                    request_at
                order by
                    request_at asc
            ) as cnt_completed,
            request_at
        FROM
            cte
        WHERE
            cte.status = 'completed'
    ),
    cte_cancel as (
        SELECT distinct
            COUNT(1) OVER (
                PARTITION by
                    request_at
                order by
                    request_at asc
            ) as cnt_cancel,
            request_at
        FROM
            cte
        WHERE
            cte.status != 'completed'
    )
SELECT
    CASE
        WHEN can.request_at is not null then can.request_at
        ELSE comp.request_at
    END as Day,
    CASE
        WHEN cnt_cancel is null
        and cnt_completed is not null then 0
        WHEN cnt_cancel is not null
        and cnt_completed is null then 1
        ELSE CAST(
            CAST(cnt_cancel as DECIMAL(10, 2)) / (cnt_cancel + cnt_completed) as DECIMAL(10, 2)
        )
    END as 'Cancellation Rate'
FROM
    cte_completed comp
    full outer join cte_cancel can on comp.request_at = can.request_at