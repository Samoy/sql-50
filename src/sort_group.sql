-- 每位教师所教授的科目种类的数量
SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;

-- 查询近30天活跃用户数
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE DATEDIFF(DATE('2019-07-27'), activity_date) < 30
  AND activity_date <= DATE('2019-07-27')
GROUP BY day;

-- 销售分析Ⅲ
SELECT DISTINCT p.product_id, p.product_name
FROM Product p
WHERE p.product_id IN (SELECT s.product_id
                       FROM Sales s
                       WHERE s.sale_date BETWEEN '2019-01-01' AND '2019-03-31')
  AND p.product_id NOT IN (SELECT s.product_id
                           FROM Sales s
                           WHERE s.sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31');

-- 超过5名学生的课
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(DISTINCT student) >= 5;

-- 求关注者的数量
SELECT user_id, COUNT(*) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;

-- 只出现一次的最大数字
SELECT MAX(t.n) AS num
FROM (SELECT num AS n
      FROM MyNumbers
      GROUP BY num
      HAVING COUNT(num) = 1) AS t;

-- 买下所有产品的客户
SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) IN
       (SELECT COUNT(distinct product_key) FROM Product)



