-- 有趣的电影
SELECT id, movie, description, rating
FROM cinema
WHERE description != 'boring'
  AND id % 2 = 1
ORDER BY rating DESC;

-- 平均售价
SELECT product_id, IFNULL(ROUND(SUM(sales) / SUM(units), 2), 0) average_price
FROM (SELECT p.product_id      product_id,
             p.price * u.units sales,
             u.units           units
      FROM Prices p
               LEFT JOIN UnitsSold u on p.product_id = u.product_id
          AND u.purchase_date BETWEEN p.start_date AND p.end_date) t
GROUP BY product_id;

-- 项目员工Ⅰ
SELECT p.project_id, ROUND(AVG(e.experience_years), 2) as average_years
FROM Project p
         LEFT JOIN Employee e on e.employee_id = p.employee_id
GROUP BY p.project_id;

-- 各赛事的用户注册率
SELECT r.contest_id,
       ROUND(COUNT(r.contest_id) / ANY_VALUE(t.total) * 100, 2) AS percentage
FROM Register r,
     (SELECT COUNT(user_id) total FROM Users) AS t
GROUP BY r.contest_id, total
ORDER BY percentage DESC, r.contest_id;

-- 查询结果的质量和占比
SELECT q.query_name,
       ROUND(AVG(q.rating / q.position), 2)                            AS quality,
       ROUND(SUM(IF(q.rating < 3, 1, 0)) / COUNT(query_name) * 100, 2) AS poor_query_percentage
FROM Queries q
WHERE query_name IS NOT NULL
GROUP BY q.query_name;

-- 每月交易Ⅰ
SELECT DATE_FORMAT(trans_date, '%Y-%m')         AS month,
       country,
       COUNT(*)                                 AS trans_count,
       (COUNT(IF(state = 'approved', 1, NULL))) AS approved_count,
       SUM(amount)                              AS trans_total_amount,
       SUM(IF(state = 'approved', amount, 0))   AS approved_total_amount
FROM Transactions
GROUP BY month, country;


