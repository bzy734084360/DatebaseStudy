/*
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
create  table ScoreInfo
(
	scoreId	int identity(1,1) primary key not null,
	stuId int not null,
	foreign key (stuId) references StudentInfo (StudentID),
	subId	int not null,
	foreign key (subId) references Subject(subId),
	score int not null
)
select *from ScoreInfo;
--添加学生成绩
insert into ScoreInfo
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
select  *from StudentInfo st order by st.StudentID asc;
--降序
select *from StudentInfo st order by st.StudentID desc;
--消除重复行
select distinct t.StudentGender from StudentInfo t;
*/

/*

--条件查询 where
select *from StudentInfo t 
where t.StudentID>10;
--between and
--取出编号从3-8的学生
select *from StudentInfo t 
where t.StudentID between 3 and 8;
select *from StudentInfo t 
where t.StudentID>=3 and t.StudentID<=8;
--获取成绩表 分数 在85到90之间的数据
select *from ScoreInfo t 
where t.score between 85 and 90;

-- in
--取班级编号为1-3的学生信息
select *from StudentInfo t 
where t.ClassID between 1 and 3;
--取班级编号为1或3的学生信息
select *from StudentInfo t 
where t.ClassID in(1,3);
--and or not 
select *from StudentInfo t
where t.ClassID=1 or t.ClassID=3;
select *from StudentInfo t
where t.ClassID>=1 and t.ClassID<=3;
--去学生编号为3-8的在1班的学生
select *from StudentInfo t 
where  t.StudentID between 3 and 8
and t.ClassID=1;
--取不在1班的学生
select *from StudentInfo t 
where t.ClassID not in(1,3);
--not
select *from StudentInfo t 
where not  (t.StudentID between 3 and 8
or t.ClassID=1);--and or 会在not中做转换

select *from StudentInfo t
where t.StudentGender=0;
--模糊查询
--查询名字中包含三的学生
select *from StudentInfo st
where st.StudentName like '_三';
select *from StudentInfo st
where st.StudentName like '_三%';
--查询姓张的学生
select *from StudentInfo st
where st.StudentName like '张%';
--查询姓名为两个名字的姓张的学生
select *from StudentInfo st
where st.StudentName like '张_';
--查询使用电话为13段的学生信息
select *from StudentInfo st
where st.StudentPhone like '13%';
--
select *from StudentInfo st
where st.StudentPhone like '1[0-4]%';
--
select *from StudentInfo st
where st.StudentPhone like '1[013]%';
--查询出使用QQ邮箱的
select *from StudentInfo st
where st.StudentEmail like '%@qq.com';
--将部分数据电话改为null
update StudentInfo set StudentPhone =null where StudentID in (5,6);

--not 分配律
--not ( a and b)
--=> not a or not b 
--查询学生电话为null 的信息
select *from StudentInfo st
where st.StudentPhone is null;
--查不为空的
select *from StudentInfo st
where st.StudentPhone is not  null;
*/

/*

--连接查询
--查询学生姓名及所在班级名称
--内连接查询 inner join
select st.StudentName,cl.ClassName 
from StudentInfo st
inner join ClassInfo cl
on cl.ClassID=st.ClassID
where cl.ClassID=1;
--外连接 left join 以左表为基准
select *from ClassInfo cl
left join StudentInfo st
on st.ClassID =cl.ClassID;
--外连接 right join 以右表为基准
select *from StudentInfo st
right join ClassInfo cl
on st.ClassID =cl.ClassID;
--外连接 full join
select *from StudentInfo st
full join ClassInfo cl
on st.ClassID =cl.ClassID;
--练习
--学生姓名、班级名称、科目名称、对应成绩
select st.StudentName,cl.ClassName, sb.subTitle,sc.score from StudentInfo st
inner join ScoreInfo sc on sc.stuId=st.StudentID
inner join Subject sb on sb.subId=sc.subId
inner join ClassInfo cl on cl.ClassID=st.ClassID;
*/
--聚合函数

/*

--count 计数函数
--查询学生人数
select COUNT(st.StudentPhone)班级人数 from StudentInfo st
where st.ClassID=1;
select COUNT(*)班级人数 from StudentInfo st
--max 获取最大值
--获取分数最高的学生
select MAX(sc.score) from ScoreInfo sc
where sc.subId=2;
--min 获取最小值
--获取学生编号为5 的最低分
select min(sc.score) from ScoreInfo sc 
where sc.stuId=5;
--avg 平均成绩
--求数据库科目的平均分
select AVG(sc.score) from ScoreInfo sc 
inner join Subject sb on sb.subId=sc.subId
where sb.subTitle ='数据库';
--sum 求和函数
--求学生成绩的综合
select SUM(sc.score) from ScoreInfo sc;
--开窗函数 over
--将合并的数据↓
--将统计信息分布到行中
select  sc.*, avg(sc.score )  over()
from ScoreInfo sc;
*/


/*

--分组 group by :
--统计男女生人数

select st.StudentGender,  count(*) from  
StudentInfo st
group by st.StudentGender;

--查询成绩
select AVG(sc.score) from ScoreInfo sc
where sc.subId=1;

--查询每个科目的平均分
select sc.subId,AVG(sc.score) from ScoreInfo sc
group by sc.subId;

--多列分组
--练习1
select sc.subId,AVG(sc.score),sc.stuId from ScoreInfo sc
group by sc.subId,sc.stuId;

--练习2
select st.StudentGender,st.ClassID, count(*)总人数
from StudentInfo st 
group by st.StudentGender,st.ClassID;

--统计学生编号大于6的各班级的各性别学生人数
select st.ClassID,st.StudentGender,COUNT(*) 
from StudentInfo st 
where st.StudentID>6
group by st.ClassID,st.StudentGender;


--统计学生编号大于2的编号为3的编辑的个性别的学生人数
select  st.StudentGender,count(*) 
from StudentInfo st
where st.StudentID>6 and st.ClassID=3
group by st.StudentGender

--统计学生编号大于6的各班级的各性别学生人数学生人数大于3的信息
select  st.StudentGender,count(*)Serial 
from StudentInfo st
where st.StudentID>6 and st.ClassID=3
group by st.StudentGender
having COUNT(*)>2;

*/

--联合查询

use Study;

-- union
select ClassID from ClassInfo
union 
select StudentID from  StudentInfo ;
-- union all
select ClassID from ClassInfo
union all
select StudentID from  StudentInfo ;

--except 差集

select StudentID 
from  StudentInfo 
except
select ClassID 
from ClassInfo;

SELECT   ClassID
FROM      ClassInfo
except
select StudentID
from  StudentInfo 

--intersect 交集
select ClassID from ClassInfo
intersect
select StudentID from  StudentInfo ;

--快速备份
--快速备份未存在表中备份数据：
--表结构加数据
select * into test1  from ClassInfo;
select *from test1;
--表结构
select * into test2  from ClassInfo where 1=2;
select *from test2;
-- 备份到以有的表
insert  into test2(ClassName) select ClassName from test1
where ClassID>2;

--函数
--类型转换 cast Convert
select CAST(89.0000 as decimal(4,2));
--Convert 有类型转换功能
select CONVERT(decimal(4,2),89.0000,null)
--数据库加号运算符 会将连接的字符串转换成int类型进行计算
select cast(1 as char(1))+'1';
select  str(1) +'1';
--字符串函数
--ascii
select ASCII(1);
--char()
select char(49);
--字符串截取
--left(截取字符串,截取长度)
select LEFT('abcd',2);
--right(截取字符串,截取长度)
select right('abcd',2);
--substring(截取字符串,开始截取位置,截取长度)
select SUBSTRING('abcd',2,1);
--len 返回字符串的长度
select LEN('abcd');
--lower,upper;大小写转换
select LOWER('ABCD');
select UPPER('abcd');
--ltrim ,rtrim 去空格
select '    aaaa '
select  LTRIM('    aaaa    ')
select RTRIM('    aaaa    ')
--日期函数
--getDate
select GETDATE();
--获取一年的第几天
select DATEPART("DAYOFYEAR",GETDATE())
select DATEPART("HOUR",GETDATE())
--函数总结：以"2015-1-1"的格式显示日期
select CAST( DATEPART("YYYY",GETDATE()) as char(4)) + '-'
 +CAST( DATEPART("MM",GETDATE()) as char(2))+'-'
 +CAST(DATEPART("DD",GETDATE()) as char(2))
 --作业练习
 --查询科目名称、平均分
 select sb.subTitle,AVG(sc.score) 平均分 from Subject sb
 inner join ScoreInfo sc on sc.subId=sb.subId
 group by sb.subTitle;
 --查询班级名称平均分
 select ci.ClassName,AVG(sc.score)平均分 from ClassInfo ci 
 inner join StudentInfo st on st.ClassID= ci.ClassID
 inner join ScoreInfo sc on sc.stuId=st.StudentID
 group by ci.ClassName;
--查询班级名称、科目名称、平均分
select ci.ClassName,sb.subTitle,AVG(sc.score) from ClassInfo ci
inner join StudentInfo st on st.ClassID=ci.ClassID
inner join ScoreInfo sc on sc.stuId=st.StudentID
inner join Subject sb on sb.subId=sc.subId
group by ci.ClassName,sb.subTitle;


select  LEN('菜');
select   LEN( t.ClassName )from test1 t;--varchar
select   LEN( t.ClassName )from test2 t;--nvarchar
insert into test1
values('aaaa');
insert into test2
values('四个名字'),('aaaa');

		


