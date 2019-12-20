--练习
select *from StudentInfo;
select *from ClassInfo;
--插入学生数据
insert into StudentInfo
values('张三',1,'1991.1.2','123456','777@qq.com',1),
('李四',1,'1991.1.3','1256666','555@qq.com',2),
('王五',1,'1991.1.4','123555','666@qq.com',3),
('赵六',1,'1991.1.5','13333','999@qq.com',5)

--创建科目表
create table Subject
(
	subId int primary key not null identity(1,1),
	subTitle nvarchar(10) not null
)
--插入科目数据
insert into Subject
values('数据库'),
('软件工程'),
('计算机英语'),
('算法与设计')
--创建学生成绩表
create  table Score
(
	scoreId	int identity(1,1) primary key not null,
	stuId int not null,
	foreign key (stuId) references StudentInfo (StudentID),
	subId	int not null,
	foreign key (subId) references Subject(subId),
	score int not null
)
select *from Score;
--添加学生成绩
insert into Score
values(5,1,80),
(5,2,88),
(5,3,90),
(5,4,95),
(6,1,80),
(6,2,88),
(6,3,90),
(6,4,95),
(7,1,80),
(7,2,88),
(7,3,90),
(7,4,95),
(8,1,80),
(8,2,88),
(8,3,90),
(8,4,95)
--查询
--表别名，列别名，查询列
select  ui.UserName Name,ui.UserPwd Pwd
from UserInfo ui;
--查询行,查询前N行数据
select top 2 * from StudentInfo ;
--百分比查询
select top 2 percent  *from StudentInfo;
--Order by  asc|desc  升序|降序
--升序
select top 2 *from StudentInfo st order by st.StudentID asc;
--降序
select top 2*from StudentInfo st order by st.StudentID desc;
