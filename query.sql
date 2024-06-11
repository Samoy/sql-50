-- 可回收且低脂的产品
SELECT product_id
FROM Products
WHERE low_fats = 'Y'
  AND recyclable = 'Y';

-- 寻找用户推荐人
SELECT name
FROM Customer
WHERE Customer.referee_id IS NULL
   OR referee_id != 2;

-- 大的国家
SELECT name, population, area
FROM World
WHERE area >= 3000000
   OR population >= 25000000;

-- 文章浏览Ⅰ
SELECT DISTINCT Views.AUTHOR_ID as id
FROM Views
WHERE AUTHOR_ID = VIEWER_ID
GROUP BY id
ORDER BY id;

-- 无效的推文
SELECT tweet_id
from Tweets
WHERE CHAR_LENGTH(content) > 15;
