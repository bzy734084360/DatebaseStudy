select *from StudentInfo sd
inner join ClassInfo ci on ci.ClassID=sd.ClassID
where ci.ClassID=2;
--创建视图
create view GetStudentInfo
as
select sd.*,ci.ClassName from StudentInfo sd
inner join ClassInfo ci on ci.ClassID=sd.ClassID;
--修改
alter view  GetStudentInfo
as 
select sd.*,ci.ClassName from StudentInfo sd
inner join ClassInfo ci on ci.ClassID=sd.ClassID;
--删除
drop view GetStudentInfo
--使用
select *from GetStudentInfo t 
where t.ClassID=2;

--子查询

select *from StudentInfo;
select *from ScoreInfo;
--查询参与了考试的学生信息

select *from StudentInfo st where st.StudentID in ( select distinct si.stuId from ScoreInfo si);

--exists in 
select *from StudentInfo st where  exists( select '' from ScoreInfo sc where sc.stuId=st.StudentID)

--分页查询 已知：页大小，页索引
-- 3  1 
-- 1,3 1,3
-- 2,3 4,6
-- 3,3 7,9
-- 4,3 10,12 
select *from  (select top 100 percent *,ROW_NUMBER()  over(order by st.StudentID desc) rowindex from StudentInfo st 
where st.StudentGender=1
) a
where a.rowindex between 5 and 8;


--case when then end

--查询学生名称、科目名称、成绩
select st.studentName,si.score,sb.subTitle
from ScoreInfo si
inner join StudentInfo st on st.StudentID=si.stuId
inner join Subject sb on sb.subId=si.subId

-- 姓名 语文 数据 英语

--列转行
select a.StudentName,
sum(a.数据库) 数据库,
sum(a.软件工程) 软件工程,
sum(a.计算机英语) 计算机英语,
sum(a.算法与设计) 算法与设计
from  (select   st.StudentName,
case  sb.subTitle  when '数据库' then si.score   else 0 end  as 数据库,
case  sb.subTitle  when '软件工程' then si.score   else 0 end  as 软件工程,
case  sb.subTitle  when '计算机英语' then si.score   else 0 end  as 计算机英语,
case  sb.subTitle  when '算法与设计' then si.score   else 0 end  as 算法与设计
from ScoreInfo si
inner join Subject sb on si.subID=sb.subID
inner join StudentInfo st on st.StudentID=si.stuId) a 
group by a.StudentName
select *from ScoreInfo;
select *from Subject;

-- 班级 男生 女生
select a.ClassName,
case a.StudentGender  when  0 then a.Num else 0 end as 男,
case a.StudentGender  when  1 then a.Num else 0 end as 女
from  (select cl.ClassName,stu.StudentGender,Count(*)Num
from StudentInfo stu
inner join ClassInfo cl on cl.ClassID=stu.ClassID
group by cl.ClassName,stu.StudentGender)a 