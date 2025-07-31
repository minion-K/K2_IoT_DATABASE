create database `school_db`;
use `school_db`;

create table students (
	학생Id bigint primary key,
	이름 varchar(100),
    전공 varchar(100),
    입학년도 int
);

create table professors (
	교수Id bigint primary key,
    이름 varchar(100),
    학과 varchar(100),
    사무실위치 varchar(100)
);

create table courses (
	강의Id bigint primary key,
    강의명 varchar(100),
    담당교수Id bigint,
    학점수 bigint,
    
    foreign key (담당교수Id) references professors(교수Id)
);

create table enrollments (
	수강Id bigint primary key,
    학생Id bigint,
    강의Id bigint, 
    수강년도 int,
    학기 int,
    
    foreign key (학생Id) references students(학생Id),
    foreign key (강의Id) references courses(강의Id)
);

INSERT INTO Students VALUES (1, 'Alice', 'Computer Science', 2020);
INSERT INTO Students VALUES (2, 'Bob', 'Mathematics', 2021);
INSERT INTO Students VALUES (3, 'Charlie', 'Physics', 2022);

-- Professors
INSERT INTO Professors VALUES (1, 'Dr. Smith', 'Computer Science', 'Room 101');
INSERT INTO Professors VALUES (2, 'Dr. Johnson', 'Mathematics', 'Room 102');
INSERT INTO Professors VALUES (3, 'Dr. Williams', 'Physics', 'Room 103');

-- Courses
INSERT INTO Courses VALUES (1, 'Introduction to Programming', 1, 3);
INSERT INTO Courses VALUES (2, 'Calculus I', 2, 4);
INSERT INTO Courses VALUES (3, 'Mechanics', 3, 4);

-- Enrollments
INSERT INTO Enrollments VALUES (1, 1, 1, 2023, 1);
INSERT INTO Enrollments VALUES (2, 2, 2, 2023, 1);
INSERT INTO Enrollments VALUES (3, 3, 3, 2023, 1);


select 이름, 입학년도
from students
where 전공 = 'Computer Science';

select 강의명, 학점수
from courses
where 담당교수Id = 2;

select s.학생Id, s.이름
from enrollments e join students s on e.학생Id = s.학생Id
where e.수강년도 = 2023 and e.학기 = 1;