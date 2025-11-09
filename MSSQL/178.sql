/* Write your T-SQL query statement below */
SELECT
    score,
    dense_rank() over (
        order by
            score desc
    ) as rank
from
    Scores