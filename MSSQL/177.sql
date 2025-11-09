CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    DECLARE @r int = null
    SELECT @r = MAX(case when rank=@N then salary end) from (SELECT salary, dense_rank() over (order by salary desc) as rank from Employee) as temp 
    RETURN @r
END