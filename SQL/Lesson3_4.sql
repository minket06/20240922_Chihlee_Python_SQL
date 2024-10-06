Create table student(
	student_id SERIAL,
	name varchar(20) not null,
	major varchar(20),
	PRIMARY KEY(student_id)
);

select * from student;

--新增資料
insert into student(name,major)
values ('小白','歷史')

insert into student(major,name)
values ('生物','小黑')

insert into student(major,name)
values (NULL,'小藍')

--新增多筆資料
insert into student(major,name)
values ('國文','小綠'),('數學','小綠')

--新增多筆資料，傳回新增的資訊(INSERT INTO RETURNING *)
insert into student(major,name)
values ('生物','小線'),('歷史','小線')
RETURNING *;

--
DROP TABLE if exists STUDENT
