/* Write your T-SQL query statement below */
WITH
    Cte as (
        SELECT
            requester_id
        FROM
            RequestAccepted
        UNION ALL
        SELECT
            accepter_id
        FROM
            RequestAccepted
    )
SELECT
    TOP (1) requester_id as id,
    count(1) OVER (
        PARTITION BY
            requester_id
        order by
            requester_id
    ) as num
FROM
    cte
ORDER BY
    num DESC