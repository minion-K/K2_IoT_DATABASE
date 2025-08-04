### 뷰 연습문제 ###
create database if not exists `school`;
use `school`;

create table `students` (
	student_id int primary key,
    first_name varchar(50),
    last_name varchar(50),
    age int,
    major varchar(50)
);

create table `courses` (
	course_id int primary key,
    course_name varchar(100),
    instructor varchar(100),
    credit_hours int
);

create table `student_course` (
	student_id int,
    course_id int,
    
    primary key (student_id, course_id),
    foreign key (student_id) references `students`(student_id),
    foreign key (course_id) references `courses`(course_id)
);

INSERT INTO students (student_id, first_name, last_name, age, major)
VALUES (1, 'John', 'Doe', 20, 'Computer Science'),
       (2, 'Jane', 'Smith', 22, 'Mathematics'),
       (3, 'Alice', 'Johnson', 19, 'Biology'),
       (4, 'Bob', 'Brown', 21, 'History');
       
INSERT INTO courses (course_id, course_name, instructor, credit_hours)
VALUES (101, 'Introduction to Programming', 'Prof. Smith', 3),
       (102, 'Calculus I', 'Prof. Johnson', 4),
       (103, 'Biology 101', 'Prof. Davis', 3),
       (104, 'World History', 'Prof. Wilson', 3);
       
INSERT INTO student_course (student_id, course_id)
VALUES (1, 101),
       (2, 102),
       (3, 103),
       (4, 104);

create or replace view `student_course_view`
as
	select concat(S.first_name,' ', S.last_name) '학생 이름',C.course_name '수강 과목 이름', C.instructor '담당 강사 이름'
    from student_course SC 
		join students S
		on SC.student_id = S.student_id
		join courses C
        on SC.course_id = C.course_id;
	
    select * from `student_course_view`;