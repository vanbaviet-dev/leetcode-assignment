/* Write your T-SQL query statement below */
SELECT
    customer_id
FROM
    Customer
GROUP BY
    customer_id
HAVING
    count(distinct product_key) = (
        SELECT
            COUNT(1)
        FROM
            Product
    )