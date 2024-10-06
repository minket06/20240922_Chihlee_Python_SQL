Create table if not exists student(
	student_id SERIAL,
	name varchar(20) not null,
	major varchar(20),
	score int,
	PRIMARY KEY(student_id)
);


--新增資料
insert into student values (1,'小白','英語',50);
insert into student values (2,'小黃','生物',90);
insert into student values (3,'小綠','歷史',70);
insert into student values (4,'小藍','英語',80);
insert into student values (5,'小黑','化學',20);

select * from student

--
drop table if exists student

--新增資料
insert into student values (1,'小白','英語',50),
							(2,'小黃','生物',90),
							(3,'小綠','歷史',70),
							(4,'小藍','英語',80),
							(5,'小黑','化學',20)
returning * ;

--刪除全部資料
delete from student

--刪除資料
delete from student where name='小白';

select * from student

delete from student where name like '小%';


--修改(update set where)
update student 
set major='英語文學'
where major='英語'
returning *;

update student 
set major='生化'
where major='生物' or major='化學'
returning *;
