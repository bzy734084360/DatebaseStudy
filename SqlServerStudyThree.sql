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

--联合查询

--横表
select MAX( sc.score) 最高成绩,MIN(sc.score)最低成绩, SUM(sc.score) 总成绩   from ScoreInfo sc;
--纵表
select '最高成绩' 描述信息,MAX(sc.score) 成绩 from ScoreInfo sc
union
select '最低成绩' 描述信息,MIN(sc.score) 成绩 from ScoreInfo sc
union
select '总成绩' 描述信息,SUM(sc.score)成绩  from ScoreInfo sc

--快速备份
--等同于插入多条数据

--表中的数据赋值，约束没有
--
select * into tbtest from ScoreInfo;
drop table tbtest;

--只赋值表结构
select top 0 * into tbtest from ScoreInfo;

--关闭自增标识的语句
--测试 2012 版本无效 原因未查明！
set identity_insert tbtest on;

--向已有表插入数据
insert into tbtest select *from ScoreInfo;

--常用函数

select LEN('天气真好');
select DATALENGTH('明天休息');

--大小写转换
select  UPPER('asdv');
select LOWER('ADSD');
--去空格
-- LTRIM RTRIM

--字符串截取
--左边截取
select LEFT('每天都要吃饭',1)
--右边截取
select RIGHT('可口可乐不好吃',3)
--任意截取
--从第二个字符截取，截取长度为四个
select SUBSTRING('123456',2,4)

--获取时间
select GETDATE();
--五年后
select DATEADD(year,5,GETDATE())
--五个月后
select DATEADD(MONTH,5,GETDATE())
--五个小时后
select DATEADD(HOUR,5,GETDATE())
--时间求差
select DATEDIFF(year,'1997-3-1',GETDATE());
--数据库 时间范围
select DATEADD(year,-266,GETDATE())
--获取时间的某个部分
select DATEPART(YEAR,GETDATE())
--获取时间的某个部分
select DATEPART("HOUR",GETDATE())

--输出所有数据中通话时间最长的5调记录
select top 5  *,DATEDIFF(SECOND,StartDateTime,EndDateTime) 通话时间 from 
CallRecords order by 通话时间 desc;
