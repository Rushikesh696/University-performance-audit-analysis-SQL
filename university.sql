create database university;
use university;
-- 1
create table departments(
department_id int,
department_name varchar(100),
hod_id	int,
faculty_count int);


-- 2
create table courses(
course_id int,	
course_name	 varchar(100),
department_id  int,
credits int,
semester_offered int);

-- 3
create table student(
student_id	int,
student_name varchar(100),
gender char(6),
dob date,
department_id int,
admission_year	int,
email	varchar(100),
phone varchar(50)
);

-- 4
create table attendence(
attendance_id int,
student_id  int,
course_id int,
date date,
status  varchar(100));


-- 5
create table exams(
exam_id	 int ,
course_id int,
exam_type	varchar(100),
exam_date date,
max_marks int);

-- 6
create table marks(
mark_id int,	
exam_id int,
student_id	int,
marks_obtained int);

-- 7
create table faculty(
faculty_id	int,
faculty_name varchar(100),
designation	 varchar(100),
department_id int,
email varchar(100) unique,
phone	varchar(30),
joining_date varchar(255));

-- 8
create table feedback(
feedback_id int ,
student_id	int,
faculty_id int,
course_id int,
rating	smallint,
comments varchar(225));


-- 9
create table enrollments(
enrollment_id int ,	
student_id int,
course_id int,
academic_year int,	
semester smallint,	
grade char(2));


select * from departments;
select * from  attendence;
select * from  courses;
select * from  exams;
select * from  faculty;
select * from  enrollments;
select * from  marks;
select * from student;
select * from  feedback;


-- List all students who enrolled in more than 10 courses in the academic year 2022.
select name, admission_year, count(course_name) as course from student as s
join courses as c on s.department_id = c.department_id
where admission_year = '2022'
group by name
having count(course_name) >=10;


-- Find the average rating received by each faculty member.
select name, avg(rating) as avg_rating from faculty as ft
join feedback as fd on ft.faculty_id = fd.faculty_id
group by name;

-- Retrieve names and emails of students from the ‘Computer Science’ department.
select name,email,department_name from student s join departments d on s.department_id=d.department_id
where department_name ="Computer Science";

-- Find all courses that have more than 3credits and are offered in semester 1.
select  course_name,credits,semester from courses as c join enrollments e on c.course_id= e.course_id
where credits>3 and semester =1;

-- List all students who were absent (status = 'Absent') more than 5 times in any course.
select count(status) as no_of_times, course_name, status from attendence a join  courses c on c.course_id= a.course_id
where status="Absent"
group by course_name
having no_of_times > 5;

-- Find the top 3 scoring students in each course based on total marks across all exams
select sum(marks_obtained), course_name, exam_type from student s join marks m on s.student_id= m.student_id
join courses c on c.department_id= s.department_id
join exams e on c.course_id = e.course_id
group by exam_type, name, course_name;

-- Identify students who have never submitted feedback for any faculty.
select * from student;
select * from feedback;
select * from faculty;

select s.student_id, f.faculty_id, s.student_name, f.faculty_name from student s
join faculty f on s.department_id = f.department_id
where s.student_id not in (select distinct(s.student_id) from feedback);

-- Determine the department with the highest average student grade (based on enrollments).
select * from student;
select * from enrollments;
select * from departments;

select d.department_name,
avg(
case when grade = 'A' then 4
	 when grade = 'B' then 3
     when grade = 'C' then 2
     when grade = 'D' then 1
     when grade = 'F' then 0
END ) as new_grades
from enrollments e
join student s on e.student_id = s.student_id
join departments d on s.department_id = d.department_id
group by d.department_name ;

-- For each faculty member, list the number of different courses they received feedback on.
select f.faculty_id, f.faculty_name, count(distinct fd.course_id), group_concat(distinct c.course_name) from faculty f 
join feedback fd on f.faculty_id = fd.faculty_id
join courses c on fd.course_id = c.course_id
group by f.faculty_id, f.faculty_name;

-- List students who failed (grade = 'F') in more than 2 different courses.
select * from enrollments;
select * from student;
select s.student_id, s.student_name, count(distinct e.course_id) as course_count from student s
join enrollments e on s.student_id = e.student_id
where grade ='F'
group by s.student_name, s.student_id
having course_count >= 2;

