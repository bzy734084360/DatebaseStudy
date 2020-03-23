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
select *
from ScoreInfo si
inner join StudentInfo st on st.StudentID=si.stuId
inner join Subject sb on sb.subId=si.subId
