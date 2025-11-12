/* Write your T-SQL query statement below */
SELECT
    x,
    y,
    z,
    CASE
        WHEN (
            (x - y) < z
            and (x + y) > z
        )
        and (
            (x - z) < y
            and (x + z) > y
        )
        and (
            (z - y) < x
            and (z + y) > x
        ) Then 'Yes'
        ELSE 'No'
    END AS triangle
FROM
    Triangle