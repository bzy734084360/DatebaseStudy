--存储过程
-- '  abc  ' 'ababcc'
declare @temp varchar(10)
set @temp ='  abc  '
select LTRIM(RTRIM(@temp))

--封装去除空格的函数
--创建
create proc trim
	@str1 varchar(10)
as
begin
	select LTRIM(RTRIM(@str1))
end 

--使用
exec trim '  abc   '

--编写 存储过程， 查询表中的总数据，及当前页的数据

alter proc SeachStudent
--pageindx,pagesize
@pageindex int,
@pagesize int,
@rowsCount int output
as
begin 
 set nocount on;
select @rowsCount=count(*)   from StudentInfo;

select  *from 
(
select  ROW_NUMBER() over(order by studentid desc)rowIndex,*from StudentInfo) t
where rowindex between ((@pageindex-1)*@pagesize+1) and @pagesize*@pageindex  ;
end

declare @temp int  
exec SeachStudent 1,2,@temp output
print @temp

--聚集索引
--非聚集索引

select *from personList;
select  * into personListTest2 from PersonList;

--设计表添加索引
--脚本添加索引
create nonclustered index ix_phone
on personlistTest(pPhone);
--一般主键才会作为聚集索引
--create clustered index

set statistics time on off
select *from PersonListTest t where t.pPhone='15109298203' ;-- CPU 时间 = 46 毫秒，占用时间 = 1241 毫秒。
select *from PersonListTest2 t where t.pPhone='15109298203' ;-- CPU 时间 = 16 毫秒，占用时间 = 1189 毫秒。


--增删改查练习

select *from SubjectInfo;

alter view ScoreInfoList as

select sc.scoreId,st.StudentID,sb.subiD,cl.ClassID, st.StudentName,sb.subTitle,sc.score from ScoreInfo sc
inner join StudentInfo st on st.StudentID=sc.stuId
inner join ClassInfo cl on cl.ClassID=st.ClassID
inner join SubjectInfo sb on sb.subiD=sc.subId;

select *from ScoreInfoList;


select *from ClassInfo;
select *from SubjectInfo;
select *from StudentInfo;
select *from ScoreInfo;