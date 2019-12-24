--复习
--数据库的增删改查

--数据检索
--查询该表中所有的数据
select *from StudentInfo;
--查询姓名，姓名，年龄
select st.StudentName,st.StudentGender,st.StudentPhone  from StudentInfo st;
---别名
select st.StudentName 姓名,st.StudentGender 性别,st.StudentPhone 电话  from StudentInfo st;

select 姓名= st.StudentName ,性别=st.StudentGender ,电话=st.StudentPhone   from StudentInfo st;


--select 可用作计算
select 1+1;
print 1+1;

--获取当前时间
select GETDATE();

--取前多少条数据
select top 5 * from StudentInfo;
--获取标识最大的5个学生 从小到大排序 asc可不用写
select top 5* from StudentInfo st
order by st.StudentID desc ; 
--取前百分之多少
select top  15 percent * from StudentInfo st;
--查询班级人数数量大于2 的班级信息
select  sc.ClassID,  count(1) from StudentInfo sc 
group by sc.ClassID
having count(1)>0;


select *from StudentInfo;
--去除重复
select distinct StudentName from StudentInfo;
--连接（连接类型必须相同）
select st.StudentName+st.StudentEmail  from StudentInfo st;
--聚合函数 null 不参与运算
--sum
select sum(sc.score)  from ScoreInfo sc; 
--平均成绩
select avg(sc.score)  from ScoreInfo sc; 
--max
select max(sc.score) from ScoreInfo sc;
--min
select count(st.StudentPhone) from StudentInfo st

select 1+null;
--聚合函数练习
--报错 select *, count(*)  from  StudentInfo;

--模糊查询



-- 空值
--查询电话号码为空的信息
select *from StudentInfo st where st.StudentPhone is  null;
--查询电话号码不为空的信息
select *from StudentInfo st where st.StudentPhone is not null;

--查询学生表中查询出每个班的班级ID和班级人数
select st.ClassID 班级的ID ,count(*) 班级的人数  from StudentInfo st
group by st.ClassID;

--查询学生表查询出每个班的班级ID 和班级男同学的人数
select st.ClassID,count(*)
from StudentInfo st
where st.StudentGender=1
group by st.ClassID;


--转换
select '日期为'+CAST(GETDATE() as varchar(30))
select '日期为'+ CONVERT(varchar(30),GETDATE(),111);

--查询学习信息，若电话号码为空则改为 无联系方式
select st.*, ISNULL(CONVERT(varchar(20),st.StudentPhone),'无联系方式') from StudentInfo st;