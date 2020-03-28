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
select b.ClassName,max(b.男) 男,max(b.女) 女  from (select a.ClassName,
case a.StudentGender  when  0 then a.Num else 0 end as 男,
case a.StudentGender  when  1 then a.Num else 0 end as 女
from  (select cl.ClassName,stu.StudentGender,Count(*)Num
from StudentInfo stu
inner join ClassInfo cl on cl.ClassID=stu.ClassID
group by cl.ClassName,stu.StudentGender)a ) b
group by b.ClassName;


--t-sql编程

declare @name nvarchar(10)
set @name='五大头贴'
select @name

--查看当前数据库版本
select  @@version

--查询最近插入标识
insert into ClassInfo values('222')
select @@IDENTITY id -- 最近的insert 语句的标识

--服务器名称
select @@SERVICENAME 

--查询最近的一条报错编号
begin try
insert into UserInfo values('abc')
end try
begin catch
select @@ERROR  
end catch

--返回上一语句影响的行数
insert into ClassInfo values('223')
select @@rowcount

--选择语句

declare @id int
set @id=10
if @id<5
begin
 --满足条件时的代码
 select 'OK'
end
else 
 --不满足条件时的代码
begin
select 'No'
 end

 --循环语句
 declare @id int
 set @id=1
 while @id<10
 begin
  print @id
  set @id=@id+1
 end

 --输出1-10之的所有偶数
 declare @id int
  set @id=1
  while @id<=10
  begin
   if @id%2=0
   begin
    select @id
   end
   set @id=@id+1
  end

--异常处理 try catch 语句
begin try
delete from ClassInfo
end try
begin catch
select @@ERROR  
end catch

--事务

--
select *from UserInfo

-- insert 语句自带事务
insert into UserInfo(username,UserPwd,RegDate) values ('111','123','2020-02-01')
insert into UserInfo (username,UserPwd,RegDate)values ('112','213','2020-02-01')

--删除demo 事务

begin try
--tran可以简写
--begin  transaction
begin  tran --开启事务

delete from UserInfo where UserName='112'
delete from ClassInfo

commit tran --提交事务

end try
begin catch

rollback tran --回滚事务 回滚到开始事务状态处
select '失败'A

end catch

--锁模型
select *from userInfo;

begin tran

update UserInfo set UserName='abc1'  where UserId=26;
--其他界面进行查询时 表被锁住 无法查询
rollback  tran