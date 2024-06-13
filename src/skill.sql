-- 修复表中的名字
SELECT user_id, CONCAT(UPPER(SUBSTR(name, 1, 1)), LOWER(SUBSTR(name, 2))) as name
FROM Users
ORDER BY user_id;

-- 某种疾病的患者
SELECT patient_id, patient_name, conditions
FROM Patients
WHERE conditions LIKE 'DIAB1%'
   OR conditions LIKE '% DIAB1%';

-- 删除重复的电子邮箱
DELETE p1
FROM Person p1,
     Person p2
WHERE p1.Email = p2.Email
  AND p1.Id > p2.Id;

-- 第二高的薪水
WITH CTE AS (SELECT salary,
                    DENSE_RANK() OVER (ORDER BY salary DESC) as r
             FROM Employee)
SELECT IF(MAX(CTE.salary) >= 0, ANY_VALUE(CTE.salary), NULL) as SecondHighestSalary
FROM CTE
WHERE CTE.r = 2;

-- 按日期分组销售商品
SELECT sell_date,
       COUNT(DISTINCT product)                                    as num_sold,
       ANY_VALUE(GROUP_CONCAT(DISTINCT product ORDER BY product)) as products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;

-- 列出指定时间段内所有的下单产品
SELECT p.product_name, SUM(o.unit) as unit
FROM Orders o
         JOIN Products p ON o.product_id = p.product_id
WHERE DATE(o.order_date) BETWEEN DATE('2020-02-01') AND DATE('2020-02-29')
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;

-- 查找拥有有效邮箱的用户
SELECT *
FROM Users
WHERE mail REGEXP '^[a-zA-Z][\.\_\\-\\w]*@leetcode\\.com$'