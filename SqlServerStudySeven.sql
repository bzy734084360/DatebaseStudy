--�洢����
-- '  abc  ' 'ababcc'
declare @temp varchar(10)
set @temp ='  abc  '
select LTRIM(RTRIM(@temp))

--��װȥ���ո�ĺ���
--����
create proc trim
	@str1 varchar(10)
as
begin
	select LTRIM(RTRIM(@str1))
end 

--ʹ��
exec trim '  abc   '

--��д �洢���̣� ��ѯ���е������ݣ�����ǰҳ������

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

--�ۼ�����
--�Ǿۼ�����

select *from personList;
select  * into personListTest2 from PersonList;

--��Ʊ��������
--�ű��������
create nonclustered index ix_phone
on personlistTest(pPhone);
--һ�������Ż���Ϊ�ۼ�����
--create clustered index

set statistics time on off
select *from PersonListTest t where t.pPhone='15109298203' ;-- CPU ʱ�� = 46 ���룬ռ��ʱ�� = 1241 ���롣
select *from PersonListTest2 t where t.pPhone='15109298203' ;-- CPU ʱ�� = 16 ���룬ռ��ʱ�� = 1189 ���롣


--��ɾ�Ĳ���ϰ

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