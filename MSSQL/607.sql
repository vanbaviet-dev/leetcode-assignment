-- /* Write your T-SQL query statement below */
-- WITH cte as (
--     SELECT sales_id FROM Orders WHERE com_id in (SELECT TOP(1) com_id FROM Company WHERE name='RED' )
-- )
SELECT
    name
FROM
    SalesPerson
WHERE
    sales_id not in (
        SELECT
            sales_id
        FROM
            Orders
        WHERE
            com_id in (
                SELECT
                    TOP (1) com_id
                FROM
                    Company
                WHERE
                    name = 'RED'
            )
    )