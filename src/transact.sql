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

-- 即时食物配送Ⅱ
SELECT ROUND(
               SUM(IF(d.order_date = d.customer_pref_delivery_date, 1, 0))
                   /
               (SELECT COUNT(*)
                FROM (SELECT customer_id, MIN(order_date) AS min_order_date
                      FROM Delivery
                      GROUP BY customer_id) AS first_orders) * 100,
               2
       ) AS immediate_percentage
FROM Delivery d
WHERE (d.order_date, d.customer_id) IN
      (SELECT MIN(order_date), customer_id
       FROM Delivery
       GROUP BY customer_id);

-- 游戏玩法分析
SELECT IFNULL(ROUND(COUNT(DISTINCT (Result.player_id)) / COUNT(DISTINCT (Activity.player_id)), 2), 0) AS fraction
FROM (SELECT Activity.player_id AS player_id
      FROM (SELECT player_id, DATE_ADD(MIN(event_date), INTERVAL 1 DAY) AS second_date
            FROM Activity
            GROUP BY player_id) AS Expected,
           Activity
      WHERE Activity.event_date = Expected.second_date
        AND Activity.player_id = Expected.player_id) AS Result,
     Activity;

