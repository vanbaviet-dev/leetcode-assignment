/* Write your T-SQL query statement below */
SELECT
    MAX(num) as num
FROM
    (
        SELECT
            top (1) num
        FROM
            MyNumbers
        GROUP BY
            num
        HAVING
            count(1) = 1
        ORDER BY
            num desc
    ) a