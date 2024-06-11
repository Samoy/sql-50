-- 使用唯一标识码替换员工ID
SELECT EmployeeUNI.unique_id, Employees.name
from Employees
         LEFT JOIN EmployeeUNI
                   ON Employees.id = EmployeeUNI.id;

-- 产品销售分析Ⅰ
SELECT product_name, year, price
FROM Sales s,
     Product p
WHERE s.product_id = p.product_id;

-- 进店却未进行过交易的顾客
SELECT customer_id, COUNT(customer_id) AS count_no_trans
FROM Visits v
         LEFT JOIN Transactions t on v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY customer_id;

-- 上升的温度
SELECT w1.id
from Weather w1
         JOIN Weather w2 ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE w1.temperature > w2.temperature;

-- 每台机器的进程平均运行时间
SELECT machine_id,
       ROUND(AVG(IF(activity_type = 'end', timestamp, -timestamp)) * 2, 3) AS processing_time
FROM Activity
GROUP BY machine_id;

-- 员工奖金
SELECT e.name, b.bonus
FROM Employee AS e
         LEFT JOIN Bonus b ON e.empId = b.empId
WHERE b.bonus < 1000
   OR b.bonus IS NULL;

-- 学生们参加各科测试的次数
SELECT s1.student_id,
       s1.student_name,
       s2.subject_name,
       IFNULL(grouped.attended_exams, 0) AS attended_exams
FROM Students s1
         CROSS JOIN
     Subjects s2
         LEFT JOIN (SELECT student_id, subject_name, COUNT(*) AS attended_exams
                    FROM Examinations
                    GROUP BY student_id, subject_name) grouped
                   ON s1.student_id = grouped.student_id AND s2.subject_name = grouped.subject_name
ORDER BY s1.student_id, s2.subject_name;

-- 至少有5名直接下属的经理
SELECT Employee.Name AS Name
FROM (SELECT ManagerId
      FROM Employee
      GROUP BY ManagerId
      HAVING count(ManagerId) >= 5) AS Manager
         JOIN Employee
              ON Manager.ManagerId = Employee.Id

-- 确认率
SELECT s.user_id, ROUND(AVG(IF(c.action = 'confirmed', 1, 0)), 2) AS confirmation_rate
from Signups s
         LEFT JOIN Confirmations c ON c.user_id = s.user_id
GROUP BY s.user_id;





