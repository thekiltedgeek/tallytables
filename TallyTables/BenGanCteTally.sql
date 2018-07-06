-- "Ben-Gan style tally when access to sys tables isn't available

WITH lv0 AS (SELECT 0 g UNION ALL SELECT 0)
    ,lv1 AS (SELECT 0 g FROM lv0 a CROSS JOIN lv0 b) -- 4
    ,lv2 AS (SELECT 0 g FROM lv1 a CROSS JOIN lv1 b) -- 16
    ,lv3 AS (SELECT 0 g FROM lv2 a CROSS JOIN lv2 b) -- 256
    ,lv4 AS (SELECT 0 g FROM lv3 a CROSS JOIN lv3 b) -- 65,536
    ,lv5 AS (SELECT 0 g FROM lv4 a CROSS JOIN lv4 b) -- 4,294,967,296
    ,Tally (n) AS (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) FROM lv5)
SELECT TOP (5) n
FROM Tally
ORDER BY n;