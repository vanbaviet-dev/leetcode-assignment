/* Write your T-SQL query statement below */
SELECT
    c.name as Customers
FROM
    Customers c
    LEFT JOIN Orders o on c.id = o.customerId
WHERE
    o.customerId is null