CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
	name varchar(10),
    age SMALLINT NOT NULL
);


CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id smallint references students(student_id),/*欄位constraint,REFERENCES*/
    course_name VARCHAR(20),
    grade VARCHAR(5)
);

INSERT INTO students (name, age) VALUES
    ('張小明', 20),
    ('李美華', 19),
    ('王大寶', 21),
    ('陳雅婷', 20),
    ('林志偉', 22);

select * from students;

INSERT INTO enrollments (student_id, course_name, grade) VALUES
    (1, '資料庫系統', 'A'),
    (1, '程式設計', 'B+'),
    (2, '資料庫系統', 'A-'),
    (2, '網頁設計', 'A'),
    (3, '程式設計', 'B'),
    (3, '資料結構', 'B+'),
    (4, '資料庫系統', 'A+'),
    (4, '作業系統', 'A-'),
    (5, '網頁設計', 'B+'),
    (5, '資料庫系統', 'A-');

select * from students;
select * from enrollments;

-- select * 
select 	s.student_id as 學生編號,
		name as 學生姓名,
		age as 年齡,
		course_name as 課程名稱,
		grade as 成績
from enrollments e
left join students s on e.student_id=s.student_id
where s.name='張小明';







	