/* Write your T-SQL query statement below */
SELECT
    e.name as name,
    b.bonus as bonus
FROM
    Bonus b
    right join Employee e on b.empId = e.empId
WHERE
    b.bonus < 1000
    or b.bonus is null