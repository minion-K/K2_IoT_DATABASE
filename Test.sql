# 1-1
CREATE TABLE IF NOT EXISTS `member` (
	member_id 	BIGINT PRIMARY KEY AUTO_INCREMENT,
    name 		VARCHAR(50) NOT NULL,
    phone 		VARCHAR(20) NOT NULL UNIQUE,
    gender 		ENUM('M','F'),
    join_date 	DATE DEFAULT (CURDATE())
);

# 1-2
CREATE TABLE IF NOT EXISTS `product` (
	product_id 		BIGINT PRIMARY KEY AUTO_INCREMENT,
    name 			VARCHAR(100) NOT NULL,
    category 		VARCHAR(30) NOT NULL,
    price 			DECIMAL(10,2) NOT NULL,
    stock 			INT NOT NULL,
    
    CHECK(price >= 0),
    CHECK(stock >= 0)
);


# 1-3
CREATE TABLE IF NOT EXISTS `buy` (
	buy_id 			BIGINT PRIMARY KEY AUTO_INCREMENT,
    member_id 		BIGINT NOT NULL,
    product_id 		BIGINT NOT NULL,
    quantity 		INT NOT NULL DEFAULT 1,
    payment 		ENUM('CARD', 'BANK', 'CASH') NOT NULL,
    status 			ENUM('PAID', 'CANCEL') NOT NULL DEFAULT 'PAID',
    buy_date 		DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    # 2-1
    FOREIGN KEY (member_id) REFERENCES `member`(member_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (product_id) REFERENCES `product`(product_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

select * from member;
select * from product;
select * from buy;


# 2-2
# a)
alter table member add email varchar(100) not null unique;

# b)
ALTER TABLE product ADD COLUMN category_enum ENUM('FOOD', 'LIFE', 'BEAUTY');
UPDATE product SET category_enum = category;
ALTER TABLE product DROP COLUMN category;
ALTER TABLE product CHANGE category_enum category ENUM('FOOD', 'LIFE', 'BEAUTY');

# c)
alter table buy modify status enum('PAID', 'CANCEL') default 'CANCEL';


# 3-1)
insert into member(name, phone, gender, email)
values
	('Kwon', '010-0000-0001', 'F','kwon@example.com'),
    ('Kim', '010-1111-1111', 'M', 'Kim@example.com'),
    ('Jung', '010-2222-2222', 'F', 'Jung@example.com');

# 3-2)
insert into product(name, price, stock, category)
values
	('TV', 50000, 3, 'LIFE'),
    ('COFFEE', 2000, 4, 'FOOD'),
    ('SUNCREAM', 5000, 2, 'BEAUTY');

# 3-3)
insert into buy(member_id, product_id, quantity, payment, status)
values 
	(1, 3, 1, 'CARD', 'PAID'),
    (2, 2, 3, 'CASH', 'PAID'),
    (3, 1, 1, 'BANK', 'CANCEL');
insert into buy(member_id, product_id, quantity, payment, status, buy_date)
values
(1, 2, 2, 'CARD','CANCEL', "2025-07-22 16:20:39");

# 4-1)
update product set price = round((price*1.1),1) where category ='FOOD';

# 4-2)
delete from buy where status = 'CANCEL' AND buy_date < date_sub(CURRENT_TIMESTAMP, interval 30 day);	

use k5_iot_springboot;


create table if not exists student(
	student_id int primary key,
    name varchar(20),
    grade int,
    phone varchar(100),
    dept_id int,
    
    foreign key (dept_id) references department(dept_id)
);

create table if not exists department (
	dept_id int primary key,
    dept_name varchar(20),
    office varchar(30)
);

create table if not exists enroll (
	enroll_id int primary key,
    student_id int,
    subject varchar(30),
    score int,
    
	foreign key (student_id) references student(student_id)
);


# 1-1
SELECT 
	name, phone
FROM 
	student
WHERE 
	grade = 2;

# 1-2 
SELECT 
	s.name, d.dept_name
FROM 
	department d
JOIN student s
ON d.dept_id = s.dept_id;

# 1-3
SELECT 
	student_id, subject
FROM 
	enroll
WHERE 
score >= 90;

# 2-1
INSERT INTO department
VALUES (5, '컴퓨터공학과', '201호');

# 2-2
INSERT INTO student
VALUES (101, '홍길동', 1, '010-9999-1111', 5);

# 2-3
INSERT INTO enroll
VALUES (1, 101, 'Database', 95);

# 3-1
UPDATE student SET grade = 2 WHERE student_id = 101;

# 3-2
UPDATE department SET office = '305호' WHERE dept_name = '컴퓨터공학과';

# 3-3
UPDATE enroll SET score = 60 WHERE subject = 'Database' AND score < 60;

# 4-1
DELETE FROM enroll WHERE subject = 'Database';

# 4-2
DELETE FROM student WHERE student_id = 101;

# 4-3
DELETE FROM department WHERE dept_name = '컴퓨터공학과';

# 5-1
SELECT 
	s.student_id, AVG(e.score)
FROM 
	student s
JOIN enroll e
ON s.student_id = e.student_id
GROUP BY s.student_id
HAVING avg(e.score) >= 80;

# 5-2
SELECT
	d.dept_name, count(s.student_id)
FROM
	department d
JOIN student s
ON d.dept_id = s. dept_id
GROUP BY d.dept_id;

# 5-3
SELECT 
	s.name, s.grade
FROM
	student s
JOIN department d
ON s.dept_id = d.dept_id
WHERE
	d.dept_name = '컴퓨터공학과';