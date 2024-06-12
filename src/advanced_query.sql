-- 每位经理的下属员工数量
SELECT e1.employee_id, ANY_VALUE(e1.name) AS name, COUNT(*) AS reports_count, ROUND(AVG(e2.age)) AS average_age
FROM Employees e1
         JOIN Employees e2
              ON e2.reports_to = e1.employee_id
GROUP BY e1.employee_id
ORDER BY e1.employee_id;

-- 员工的直属部门
WITH t AS (SELECT employee_id,
                  department_id,
                  primary_flag,
                  COUNT(*) OVER (PARTITION BY employee_id) AS count_over
           FROM Employee)
SELECT employee_id, department_id
FROM t
WHERE count_over = 1
   or primary_flag = 'Y';

-- 判断三角形
SELECT x, y, z, IF(GREATEST(x, y, z) * 2 < x + y + z, 'Yes', 'No') AS triangle
FROM Triangle;

-- 连续出现的数字
SELECT DISTINCT l1.Num AS ConsecutiveNums
FROM Logs l1,
     Logs l2,
     Logs l3
WHERE l1.Id = l2.Id - 1
  AND l2.Id = l3.Id - 1
  AND l1.Num = l2.Num
  AND l2.Num = l3.Num;

-- 指定日期的产品价格
SELECT p1.product_id, IFNULL(p2.new_price, 10) AS price
FROM (SELECT DISTINCT product_id
      FROM Products) AS p1 -- 所有的产品
         LEFT JOIN (SELECT product_id, new_price
                    FROM Products
                    WHERE (product_id, change_date) in
                          (SELECT product_id, MAX(change_date)
                           FROM Products
                           WHERE change_date <= '2019-08-16'
                           GROUP BY product_id)) AS p2 -- 在 2019-08-16 之前有过修改的产品和最新的价格
                   ON p1.product_id = p2.product_id;
-- 最后一个能进入巴士的人
SELECT a.person_name
FROM (SELECT person_name, @pre := @pre + weight AS weight
      FROM Queue,
           (SELECT @pre := 0) tmp
      ORDER BY turn) a
WHERE a.weight <= 1000
ORDER BY a.weight DESC
LIMIT 1;

-- 按分类统计薪水
SELECT 'Low Salary'                  AS category,
       SUM(IF(income < 20000, 1, 0)) AS accounts_count
FROM Accounts

UNION
SELECT 'Average Salary' category,
       SUM(IF(income >= 20000 AND income <= 50000, 1, 0))
           AS           accounts_count
FROM Accounts

UNION
SELECT 'High Salary'                    category,
       SUM(IF(income > 50000, 1, 0)) AS accounts_count
FROM Accounts

