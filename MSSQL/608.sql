SELECT distinct
    t2.id as id,
    CASE
        WHEN t2.p_id is null THEN 'Root'
        WHEN t2.p_id is not null
        and t1.p_id is not null then 'Inner'
        WHEN t1.p_id is null then 'Leaf'
    END as type
FROM
    Tree t1
    FULL OUTER JOIN Tree t2 ON t1.p_id = t2.id
WHERE
    t2.id is not null