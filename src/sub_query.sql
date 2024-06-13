-- 上级经理已离职的公司员工
SELECT employee_id
FROM Employees
WHERE manager_id NOT IN (SELECT employee_id FROM Employees)
  AND salary < 30000
ORDER BY employee_id;

SELECT e1.employee_id
FROM Employees e1
         LEFT JOIN Employees e2 ON e1.manager_id = e2.employee_id
WHERE e1.salary < 30000
  AND e1.manager_id IS NOT NULL
  AND e2.employee_id IS NULL
ORDER BY 1;

-- 换座位
SELECT *
FROM (SELECT IF(id != (SELECT MAX(id) FROM Seat), id + 1, id) AS id,
             student
      FROM Seat
      WHERE id % 2 = 1
      UNION
      SELECT id - 1, student
      FROM Seat
      WHERE id % 2 = 0) t
ORDER BY id;

-- 电影评分
(
# 点评电影最多，且字典序最小
    SELECT u.name as results
    FROM MovieRating mr
             LEFT JOIN Users u ON mr.user_id = u.user_id
    GROUP BY u.name
    ORDER BY COUNT(*) DESC, u.name
    LIMIT 1)
UNION ALL
(
# 最高评分，且字典序最小
    SELECT m.title
    FROM Movies m
             LEFT JOIN MovieRating mr ON m.movie_id = mr.movie_id
    WHERE mr.created_at BETWEEN DATE('2020-02-01') AND DATE('2020-02-29')
    GROUP BY m.title
    ORDER BY AVG(mr.rating) DESC, m.title
    LIMIT 1);

-- 餐馆营业额变化增长
SELECT DISTINCT visited_on,
                sum_amount               AS amount,
                ROUND(sum_amount / 7, 2) AS average_amount
FROM (SELECT visited_on, SUM(amount) OVER ( ORDER BY visited_on RANGE interval 6 day preceding ) AS sum_amount
      FROM Customer) t
WHERE DATEDIFF(visited_on, (SELECT MIN(visited_on) FROM Customer)) >= 6;

-- 谁有最多的好友
SELECT id, COUNT(*) as num
FROM (SELECT requester_id as id
      FROM RequestAccepted
      UNION ALL
      SELECT accepter_id as id
      FROM RequestAccepted) t
GROUP BY 1
ORDER BY num DESC
LIMIT 1;

-- 2016年的投资
SELECT ROUND(SUM(tiv_2016), 2) as tiv_2016
FROM Insurance i1
WHERE i1.tiv_2015 IN
      (SELECT i2.tiv_2015
       FROM Insurance i2
       WHERE i1.pid != i2.pid)
  AND ((i1.lat, i1.lon)
    NOT IN (SELECT i3.lat, i3.lon FROM Insurance i3 WHERE i3.pid != i1.pid));

-- 部门工资前三高的员工
WITH CTE AS (SELECT d.name                                                               AS Department,
                    e.name                                                               AS Employee,
                    e.salary                                                             AS Salary,
                    DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY salary DESC) as r
             FROM Employee e
                      JOIN Department d ON d.id = e.departmentId)
SELECT Department, Employee, Salary
FROM CTE
WHERE r <= 3
ORDER BY Department, r;
