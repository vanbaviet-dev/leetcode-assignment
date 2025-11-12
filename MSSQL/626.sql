SELECT 
CASE
    WHEN id%2=1 and nxt_id is not null then id+1
    WHEN id%2=0 then id-1
    ELSE id
END
as id,student
FROM (SELECT id,student,LEAD(id) OVER(ORDER BY id) as nxt_id FROM Seat) a
ORDER BY id asc