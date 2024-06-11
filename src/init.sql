-- https://leetcode.cn/problems/recyclable-and-low-fat-products/description/?envType=study-plan-v2&envId=sql-free-50
CREATE SCHEMA IF NOT EXISTS leet_code;
USE leet_code;
Create table If Not Exists Products
(
    product_id int,
    low_fats   ENUM ('Y', 'N'),
    recyclable ENUM ('Y','N')
);
Truncate table Products;
insert into Products (product_id, low_fats, recyclable)
values ('0', 'Y', 'N');
insert into Products (product_id, low_fats, recyclable)
values ('1', 'Y', 'Y');
insert into Products (product_id, low_fats, recyclable)
values ('2', 'N', 'Y');
insert into Products (product_id, low_fats, recyclable)
values ('3', 'Y', 'Y');
insert into Products (product_id, low_fats, recyclable)
values ('4', 'N', 'N');

-- https://leetcode.cn/problems/find-customer-referee/?envType=study-plan-v2&envId=sql-free-50
Create table If Not Exists Customer
(
    id         int,
    name       varchar(25),
    referee_id int
);
Truncate table Customer;
insert into Customer (id, name, referee_id)
values ('1', 'Will', NULL);
insert into Customer (id, name, referee_id)
values ('2', 'Jane', NULL);
insert into Customer (id, name, referee_id)
values ('3', 'Alex', 2);
insert into Customer (id, name, referee_id)
values ('4', 'Bill', NULL);
insert into Customer (id, name, referee_id)
values ('5', 'Zack', 1);
insert into Customer (id, name, referee_id)
values ('6', 'Mark', 2);

-- https://leetcode.cn/problems/big-countries/description/?envType=study-plan-v2&envId=sql-free-50
Create table If Not Exists World
(
    name       varchar(255),
    continent  varchar(255),
    area       int,
    population int,
    gdp        bigint
);
Truncate table World;
insert into World (name, continent, area, population, gdp)
values ('Afghanistan', 'Asia', '652230', '25500100', '20343000000');
insert into World (name, continent, area, population, gdp)
values ('Albania', 'Europe', '28748', '2831741', '12960000000');
insert into World (name, continent, area, population, gdp)
values ('Algeria', 'Africa', '2381741', '37100000', '188681000000');
insert into World (name, continent, area, population, gdp)
values ('Andorra', 'Europe', '468', '78115', '3712000000');
insert into World (name, continent, area, population, gdp)
values ('Angola', 'Africa', '1246700', '20609294', '100990000000');

-- https://leetcode.cn/problems/article-views-i/description/?envType=study-plan-v2&envId=sql-free-50
Create table If Not Exists Views
(
    article_id int,
    author_id  int,
    viewer_id  int,
    view_date  date
);
Truncate table Views;
insert into Views (article_id, author_id, viewer_id, view_date)
values ('1', '3', '5', '2019-08-01');
insert into Views (article_id, author_id, viewer_id, view_date)
values ('1', '3', '6', '2019-08-02');
insert into Views (article_id, author_id, viewer_id, view_date)
values ('2', '7', '7', '2019-08-01');
insert into Views (article_id, author_id, viewer_id, view_date)
values ('2', '7', '6', '2019-08-02');
insert into Views (article_id, author_id, viewer_id, view_date)
values ('4', '7', '1', '2019-07-22');
insert into Views (article_id, author_id, viewer_id, view_date)
values ('3', '4', '4', '2019-07-21');
insert into Views (article_id, author_id, viewer_id, view_date)
values ('3', '4', '4', '2019-07-21');
-- https://leetcode.cn/problems/article-views-i/description/?envType=study-plan-v2&envId=sql-free-50
Create table If Not Exists Tweets
(
    tweet_id int,
    content  varchar(50)
);
Truncate table Tweets;
insert into Tweets (tweet_id, content)
values ('1', 'Vote for Biden');
insert into Tweets (tweet_id, content)
values ('2', 'Let us make America great again!');
-- https://leetcode.cn/problems/replace-employee-id-with-the-unique-identifier/?envType=study-plan-v2&envId=sql-free-50
Create table If Not Exists Employees
(
    id   int,
    name varchar(20)
);
Create table If Not Exists EmployeeUNI
(
    id        int,
    unique_id int
);
Truncate table Employees;
insert into Employees (id, name)
values ('1', 'Alice');
insert into Employees (id, name)
values ('7', 'Bob');
insert into Employees (id, name)
values ('11', 'Meir');
insert into Employees (id, name)
values ('90', 'Winston');
insert into Employees (id, name)
values ('3', 'Jonathan');
Truncate table EmployeeUNI;
insert into EmployeeUNI (id, unique_id)
values ('3', '1');
insert into EmployeeUNI (id, unique_id)
values ('11', '2');
insert into EmployeeUNI (id, unique_id)
values ('90', '3');
-- https://leetcode.cn/problems/product-sales-analysis-i/?envType=study-plan-v2&envId=sql-free-50
Create table If Not Exists Sales
(
    sale_id    int,
    product_id int,
    `year`     int,
    quantity   int,
    price      int
);
Create table If Not Exists Product
(
    product_id   int,
    product_name varchar(10)
);
Truncate table Sales;
insert into Sales (sale_id, product_id, `year`, quantity, price)
values ('1', '100', '2008', '10', '5000');
insert into Sales (sale_id, product_id, `year`, quantity, price)
values ('2', '100', '2009', '12', '5000');
insert into Sales (sale_id, product_id, `year`, quantity, price)
values ('7', '200', '2011', '15', '9000');
Truncate table Product;
insert into Product (product_id, product_name)
values ('100', 'Nokia');
insert into Product (product_id, product_name)
values ('200', 'Apple');
insert into Product (product_id, product_name)
values ('300', 'Samsung');
-- https://leetcode.cn/problems/customer-who-visited-but-did-not-make-any-transactions/?envType=study-plan-v2&envId=sql-free-50
Create table If Not Exists Visits
(
    visit_id    int,
    customer_id int
);
Create table If Not Exists Transactions
(
    transaction_id int,
    visit_id       int,
    amount         int
);
Truncate table Visits;
insert into Visits (visit_id, customer_id)
values ('1', '23');
insert into Visits (visit_id, customer_id)
values ('2', '9');
insert into Visits (visit_id, customer_id)
values ('4', '30');
insert into Visits (visit_id, customer_id)
values ('5', '54');
insert into Visits (visit_id, customer_id)
values ('6', '96');
insert into Visits (visit_id, customer_id)
values ('7', '54');
insert into Visits (visit_id, customer_id)
values ('8', '54');
Truncate table Transactions;
insert into Transactions (transaction_id, visit_id, amount)
values ('2', '5', '310');
insert into Transactions (transaction_id, visit_id, amount)
values ('3', '5', '300');
insert into Transactions (transaction_id, visit_id, amount)
values ('9', '5', '200');
insert into Transactions (transaction_id, visit_id, amount)
values ('12', '1', '910');
insert into Transactions (transaction_id, visit_id, amount)
values ('13', '2', '970');
-- https://leetcode.cn/problems/rising-temperature/?envType=study-plan-v2&envId=sql-free-50
Create table If Not Exists Weather
(
    id          int,
    recordDate  date,
    temperature int
);
Truncate table Weather;
insert into Weather (id, recordDate, temperature)
values ('1', '2015-01-01', '10');
insert into Weather (id, recordDate, temperature)
values ('2', '2015-01-02', '25');
insert into Weather (id, recordDate, temperature)
values ('3', '2015-01-03', '20');
insert into Weather (id, recordDate, temperature)
values ('4', '2015-01-04', '30');
-- https://leetcode.cn/problems/average-time-of-process-per-machine/?envType=study-plan-v2&envId=sql-free-50
Create table If Not Exists Activity
(
    machine_id    int,
    process_id    int,
    activity_type ENUM ('start', 'end'),
    timestamp     float
);
Truncate table Activity;
insert into Activity (machine_id, process_id, activity_type, timestamp)
values ('0', '0', 'start', '0.712');
insert into Activity (machine_id, process_id, activity_type, timestamp)
values ('0', '0', 'end', '1.52');
insert into Activity (machine_id, process_id, activity_type, timestamp)
values ('0', '1', 'start', '3.14');
insert into Activity (machine_id, process_id, activity_type, timestamp)
values ('0', '1', 'end', '4.12');
insert into Activity (machine_id, process_id, activity_type, timestamp)
values ('1', '0', 'start', '0.55');
insert into Activity (machine_id, process_id, activity_type, timestamp)
values ('1', '0', 'end', '1.55');
insert into Activity (machine_id, process_id, activity_type, timestamp)
values ('1', '1', 'start', '0.43');
insert into Activity (machine_id, process_id, activity_type, timestamp)
values ('1', '1', 'end', '1.42');
insert into Activity (machine_id, process_id, activity_type, timestamp)
values ('2', '0', 'start', '4.1');
insert into Activity (machine_id, process_id, activity_type, timestamp)
values ('2', '0', 'end', '4.512');
insert into Activity (machine_id, process_id, activity_type, timestamp)
values ('2', '1', 'start', '2.5');
insert into Activity (machine_id, process_id, activity_type, timestamp)
values ('2', '1', 'end', '5');
-- https://leetcode.cn/problems/employee-bonus/?envType=study-plan-v2&envId=sql-free-50
Create table If Not Exists Employee
(
    empId      int,
    name       varchar(255),
    supervisor int,
    salary     int
);
Create table If Not Exists Bonus
(
    empId int,
    bonus int
);
Truncate table Employee;
insert into Employee (empId, name, supervisor, salary)
values ('3', 'Brad', NULL, '4000');
insert into Employee (empId, name, supervisor, salary)
values ('1', 'John', '3', '1000');
insert into Employee (empId, name, supervisor, salary)
values ('2', 'Dan', '3', '2000');
insert into Employee (empId, name, supervisor, salary)
values ('4', 'Thomas', '3', '4000');
Truncate table Bonus;
insert into Bonus (empId, bonus)
values ('2', '500');
insert into Bonus (empId, bonus)
values ('4', '2000');
-- https://leetcode.cn/problems/students-and-examinations/?envType=study-plan-v2&envId=sql-free-50
Create table If Not Exists Students
(
    student_id   int,
    student_name varchar(20)
);
Create table If Not Exists Subjects
(
    subject_name varchar(20)
);
Create table If Not Exists Examinations
(
    student_id   int,
    subject_name varchar(20)
);
Truncate table Students;
insert into Students (student_id, student_name)
values ('1', 'Alice');
insert into Students (student_id, student_name)
values ('2', 'Bob');
insert into Students (student_id, student_name)
values ('13', 'John');
insert into Students (student_id, student_name)
values ('6', 'Alex');
Truncate table Subjects;
insert into Subjects (subject_name)
values ('Math');
insert into Subjects (subject_name)
values ('Physics');
insert into Subjects (subject_name)
values ('Programming');
Truncate table Examinations;
insert into Examinations (student_id, subject_name)
values ('1', 'Math');
insert into Examinations (student_id, subject_name)
values ('1', 'Physics');
insert into Examinations (student_id, subject_name)
values ('1', 'Programming');
insert into Examinations (student_id, subject_name)
values ('2', 'Programming');
insert into Examinations (student_id, subject_name)
values ('1', 'Physics');
insert into Examinations (student_id, subject_name)
values ('1', 'Math');
insert into Examinations (student_id, subject_name)
values ('13', 'Math');
insert into Examinations (student_id, subject_name)
values ('13', 'Programming');
insert into Examinations (student_id, subject_name)
values ('13', 'Physics');
insert into Examinations (student_id, subject_name)
values ('2', 'Math');
insert into Examinations (student_id, subject_name)
values ('1', 'Math');
-- https://leetcode.cn/problems/managers-with-at-least-5-direct-reports/?envType=study-plan-v2&envId=sql-free-50
DROP TABLE IF EXISTS Employee;
Create table If Not Exists Employee
(
    id         int,
    name       varchar(255),
    department varchar(255),
    managerId  int
);
Truncate table Employee;
insert into Employee (id, name, department, managerId)
values ('101', 'John', 'A', NULL);
insert into Employee (id, name, department, managerId)
values ('102', 'Dan', 'A', '101');
insert into Employee (id, name, department, managerId)
values ('103', 'James', 'A', '101');
insert into Employee (id, name, department, managerId)
values ('104', 'Amy', 'A', '101');
insert into Employee (id, name, department, managerId)
values ('105', 'Anne', 'A', '101');
insert into Employee (id, name, department, managerId)
values ('106', 'Ron', 'B', '101');
-- https://leetcode.cn/problems/confirmation-rate/?envType=study-plan-v2&envId=sql-free-50
Create table If Not Exists Signups
(
    user_id    int,
    time_stamp datetime
);
Create table If Not Exists Confirmations
(
    user_id    int,
    time_stamp datetime,
    action     ENUM ('confirmed','timeout')
);
Truncate table Signups;
insert into Signups (user_id, time_stamp)
values ('3', '2020-03-21 10:16:13');
insert into Signups (user_id, time_stamp)
values ('7', '2020-01-04 13:57:59');
insert into Signups (user_id, time_stamp)
values ('2', '2020-07-29 23:09:44');
insert into Signups (user_id, time_stamp)
values ('6', '2020-12-09 10:39:37');
Truncate table Confirmations;
insert into Confirmations (user_id, time_stamp, action)
values ('3', '2021-01-06 03:30:46', 'timeout');
insert into Confirmations (user_id, time_stamp, action)
values ('3', '2021-07-14 14:00:00', 'timeout');
insert into Confirmations (user_id, time_stamp, action)
values ('7', '2021-06-12 11:57:29', 'confirmed');
insert into Confirmations (user_id, time_stamp, action)
values ('7', '2021-06-13 12:58:28', 'confirmed');
insert into Confirmations (user_id, time_stamp, action)
values ('7', '2021-06-14 13:59:27', 'confirmed');
insert into Confirmations (user_id, time_stamp, action)
values ('2', '2021-01-22 00:00:00', 'confirmed');
insert into Confirmations (user_id, time_stamp, action)
values ('2', '2021-02-28 23:59:59', 'timeout');
-- https://leetcode.cn/problems/not-boring-movies/?envType=study-plan-v2&envId=sql-free-50
Create table If Not Exists cinema
(
    id          int,
    movie       varchar(255),
    description varchar(255),
    rating      float(2, 1)
);
Truncate table cinema;
insert into cinema (id, movie, description, rating)
values ('1', 'War', 'great 3D', '8.9');
insert into cinema (id, movie, description, rating)
values ('2', 'Science', 'fiction', '8.5');
insert into cinema (id, movie, description, rating)
values ('3', 'irish', 'boring', '6.2');
insert into cinema (id, movie, description, rating)
values ('4', 'Ice song', 'Fantacy', '8.6');
insert into cinema (id, movie, description, rating)
values ('5', 'House card', 'Interesting', '9.1');
-- https://leetcode.cn/problems/average-selling-price/?envType=study-plan-v2&envId=sql-free-50
Create table If Not Exists Prices
(
    product_id int,
    start_date date,
    end_date   date,
    price      int
);
Create table If Not Exists UnitsSold
(
    product_id    int,
    purchase_date date,
    units         int
);
Truncate table Prices;
insert into Prices (product_id, start_date, end_date, price)
values ('1', '2019-02-17', '2019-02-28', '5');
insert into Prices (product_id, start_date, end_date, price)
values ('1', '2019-03-01', '2019-03-22', '20');
insert into Prices (product_id, start_date, end_date, price)
values ('2', '2019-02-01', '2019-02-20', '15');
insert into Prices (product_id, start_date, end_date, price)
values ('2', '2019-02-21', '2019-03-31', '30');
Truncate table UnitsSold;
insert into UnitsSold (product_id, purchase_date, units)
values ('1', '2019-02-25', '100');
insert into UnitsSold (product_id, purchase_date, units)
values ('1', '2019-03-01', '15');
insert into UnitsSold (product_id, purchase_date, units)
values ('2', '2019-02-10', '200');
insert into UnitsSold (product_id, purchase_date, units)
values ('2', '2019-03-22', '30');
-- https://leetcode.cn/problems/project-employees-i/?envType=study-plan-v2&envId=sql-free-50
Drop table If Exists Project;
Create table If Not Exists Project
(
    project_id  int,
    employee_id int
);
Drop table If Exists Employee;
Create table If Not Exists Employee
(
    employee_id      int,
    name             varchar(10),
    experience_years int
);
Truncate table Project;
insert into Project (project_id, employee_id)
values ('1', '1');
insert into Project (project_id, employee_id)
values ('1', '2');
insert into Project (project_id, employee_id)
values ('1', '3');
insert into Project (project_id, employee_id)
values ('2', '1');
insert into Project (project_id, employee_id)
values ('2', '4');
Truncate table Employee;
insert into Employee (employee_id, name, experience_years)
values ('1', 'Khaled', '3');
insert into Employee (employee_id, name, experience_years)
values ('2', 'Ali', '2');
insert into Employee (employee_id, name, experience_years)
values ('3', 'John', '1');
insert into Employee (employee_id, name, experience_years)
values ('4', 'Doe', '2');
-- https://leetcode.cn/problems/percentage-of-users-attended-a-contest/?envType=study-plan-v2&envId=sql-free-50
Create table If Not Exists Users
(
    user_id   int,
    user_name varchar(20)
);
Create table If Not Exists Register
(
    contest_id int,
    user_id    int
);
Truncate table Users;
insert into Users (user_id, user_name)
values ('6', 'Alice');
insert into Users (user_id, user_name)
values ('2', 'Bob');
insert into Users (user_id, user_name)
values ('7', 'Alex');
Truncate table Register;
insert into Register (contest_id, user_id)
values ('215', '6');
insert into Register (contest_id, user_id)
values ('209', '2');
insert into Register (contest_id, user_id)
values ('208', '2');
insert into Register (contest_id, user_id)
values ('210', '6');
insert into Register (contest_id, user_id)
values ('208', '6');
insert into Register (contest_id, user_id)
values ('209', '7');
insert into Register (contest_id, user_id)
values ('209', '6');
insert into Register (contest_id, user_id)
values ('215', '7');
insert into Register (contest_id, user_id)
values ('208', '7');
insert into Register (contest_id, user_id)
values ('210', '2');
insert into Register (contest_id, user_id)
values ('207', '2');
insert into Register (contest_id, user_id)
values ('210', '7');
-- https://leetcode.cn/problems/queries-quality-and-percentage/?envType=study-plan-v2&envId=sql-free-50
Create table If Not Exists Queries
(
    query_name varchar(30),
    result     varchar(50),
    position   int,
    rating     int
);
Truncate table Queries;
insert into Queries (query_name, result, position, rating)
values ('Dog', 'Golden Retriever', '1', '5');
insert into Queries (query_name, result, position, rating)
values ('Dog', 'German Shepherd', '2', '5');
insert into Queries (query_name, result, position, rating)
values ('Dog', 'Mule', '200', '1');
insert into Queries (query_name, result, position, rating)
values ('Cat', 'Shirazi', '5', '2');
insert into Queries (query_name, result, position, rating)
values ('Cat', 'Siamese', '3', '3');
insert into Queries (query_name, result, position, rating)
values ('Cat', 'Sphynx', '7', '4');
-- https://leetcode.cn/problems/monthly-transactions-i/?envType=study-plan-v2&envId=sql-free-50
Drop table If EXISTS Transactions;
Create table If Not Exists Transactions
(
    id         int,
    country    varchar(4),
    state      enum ('approved', 'declined'),
    amount     int,
    trans_date date
);
Truncate table Transactions;
insert into Transactions (id, country, state, amount, trans_date)
values ('121', 'US', 'approved', '1000', '2018-12-18');
insert into Transactions (id, country, state, amount, trans_date)
values ('122', 'US', 'declined', '2000', '2018-12-19');
insert into Transactions (id, country, state, amount, trans_date)
values ('123', 'US', 'approved', '2000', '2019-01-01');
insert into Transactions (id, country, state, amount, trans_date)
values ('124', 'DE', 'approved', '2000', '2019-01-07');

-- https://leetcode.cn/problems/immediate-food-delivery-ii/?envType=study-plan-v2&envId=sql-free-50
Create table If Not Exists Delivery
(
    delivery_id                 int,
    customer_id                 int,
    order_date                  date,
    customer_pref_delivery_date date
);
Truncate table Delivery;
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date)
values ('1', '1', '2019-08-01', '2019-08-02');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date)
values ('2', '2', '2019-08-02', '2019-08-02');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date)
values ('3', '1', '2019-08-11', '2019-08-12');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date)
values ('4', '3', '2019-08-24', '2019-08-24');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date)
values ('5', '3', '2019-08-21', '2019-08-22');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date)
values ('6', '2', '2019-08-11', '2019-08-13');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date)
values ('7', '4', '2019-08-09', '2019-08-09');

-- https://leetcode.cn/problems/game-play-analysis-iv/?envType=study-plan-v2&envId=sql-free-50
Drop table If Exists Activity;
Create table If Not Exists Activity
(
    player_id    int,
    device_id    int,
    event_date   date,
    games_played int
);
Truncate table Activity;
insert into Activity (player_id, device_id, event_date, games_played)
values ('1', '2', '2016-03-01', '5');
insert into Activity (player_id, device_id, event_date, games_played)
values ('1', '2', '2016-03-02', '6');
insert into Activity (player_id, device_id, event_date, games_played)
values ('2', '3', '2017-06-25', '1');
insert into Activity (player_id, device_id, event_date, games_played)
values ('3', '1', '2016-03-02', '0');
insert into Activity (player_id, device_id, event_date, games_played)
values ('3', '4', '2018-07-03', '5');