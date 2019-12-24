/*
--��ϰ
select *from StudentInfo;
select *from ClassInfo;
--����ѧ������
insert into StudentInfo
values('����',1,'1991.1.2','123456','777@qq.com',1),
('����',1,'1991.1.3','1256666','555@qq.com',2),
('����',1,'1991.1.4','123555','666@qq.com',3),
('����',1,'1991.1.5','13333','999@qq.com',5)

--������Ŀ��
create table Subject
(
	subId int primary key not null identity(1,1),
	subTitle nvarchar(10) not null
)
--�����Ŀ����
insert into Subject
values('���ݿ�'),
('�������'),
('�����Ӣ��'),
('�㷨�����')
--����ѧ���ɼ���
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
--���ѧ���ɼ�
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
--��ѯ
--��������б�������ѯ��
select  ui.UserName Name,ui.UserPwd Pwd
from UserInfo ui;
--��ѯ��,��ѯǰN������
select top 2 * from StudentInfo ;
--�ٷֱȲ�ѯ
select top 2 percent  *from StudentInfo;
--Order by  asc|desc  ����|����
--����
select  *from StudentInfo st order by st.StudentID asc;
--����
select *from StudentInfo st order by st.StudentID desc;
--�����ظ���
select distinct t.StudentGender from StudentInfo t;
*/

/*

--������ѯ where
select *from StudentInfo t 
where t.StudentID>10;
--between and
--ȡ����Ŵ�3-8��ѧ��
select *from StudentInfo t 
where t.StudentID between 3 and 8;
select *from StudentInfo t 
where t.StudentID>=3 and t.StudentID<=8;
--��ȡ�ɼ��� ���� ��85��90֮�������
select *from ScoreInfo t 
where t.score between 85 and 90;

-- in
--ȡ�༶���Ϊ1-3��ѧ����Ϣ
select *from StudentInfo t 
where t.ClassID between 1 and 3;
--ȡ�༶���Ϊ1��3��ѧ����Ϣ
select *from StudentInfo t 
where t.ClassID in(1,3);
--and or not 
select *from StudentInfo t
where t.ClassID=1 or t.ClassID=3;
select *from StudentInfo t
where t.ClassID>=1 and t.ClassID<=3;
--ȥѧ�����Ϊ3-8����1���ѧ��
select *from StudentInfo t 
where  t.StudentID between 3 and 8
and t.ClassID=1;
--ȡ����1���ѧ��
select *from StudentInfo t 
where t.ClassID not in(1,3);
--not
select *from StudentInfo t 
where not  (t.StudentID between 3 and 8
or t.ClassID=1);--and or ����not����ת��

select *from StudentInfo t
where t.StudentGender=0;
--ģ����ѯ
--��ѯ�����а�������ѧ��
select *from StudentInfo st
where st.StudentName like '_��';
select *from StudentInfo st
where st.StudentName like '_��%';
--��ѯ���ŵ�ѧ��
select *from StudentInfo st
where st.StudentName like '��%';
--��ѯ����Ϊ�������ֵ����ŵ�ѧ��
select *from StudentInfo st
where st.StudentName like '��_';
--��ѯʹ�õ绰Ϊ13�ε�ѧ����Ϣ
select *from StudentInfo st
where st.StudentPhone like '13%';
--
select *from StudentInfo st
where st.StudentPhone like '1[0-4]%';
--
select *from StudentInfo st
where st.StudentPhone like '1[013]%';
--��ѯ��ʹ��QQ�����
select *from StudentInfo st
where st.StudentEmail like '%@qq.com';
--���������ݵ绰��Ϊnull
update StudentInfo set StudentPhone =null where StudentID in (5,6);

--not ������
--not ( a and b)
--=> not a or not b 
--��ѯѧ���绰Ϊnull ����Ϣ
select *from StudentInfo st
where st.StudentPhone is null;
--�鲻Ϊ�յ�
select *from StudentInfo st
where st.StudentPhone is not  null;
*/

/*

--���Ӳ�ѯ
--��ѯѧ�����������ڰ༶����
--�����Ӳ�ѯ inner join
select st.StudentName,cl.ClassName 
from StudentInfo st
inner join ClassInfo cl
on cl.ClassID=st.ClassID
where cl.ClassID=1;
--������ left join �����Ϊ��׼
select *from ClassInfo cl
left join StudentInfo st
on st.ClassID =cl.ClassID;
--������ right join ���ұ�Ϊ��׼
select *from StudentInfo st
right join ClassInfo cl
on st.ClassID =cl.ClassID;
--������ full join
select *from StudentInfo st
full join ClassInfo cl
on st.ClassID =cl.ClassID;
--��ϰ
--ѧ���������༶���ơ���Ŀ���ơ���Ӧ�ɼ�
select st.StudentName,cl.ClassName, sb.subTitle,sc.score from StudentInfo st
inner join ScoreInfo sc on sc.stuId=st.StudentID
inner join Subject sb on sb.subId=sc.subId
inner join ClassInfo cl on cl.ClassID=st.ClassID;
*/
--�ۺϺ���

/*

--count ��������
--��ѯѧ������
select COUNT(st.StudentPhone)�༶���� from StudentInfo st
where st.ClassID=1;
select COUNT(*)�༶���� from StudentInfo st
--max ��ȡ���ֵ
--��ȡ������ߵ�ѧ��
select MAX(sc.score) from ScoreInfo sc
where sc.subId=2;
--min ��ȡ��Сֵ
--��ȡѧ�����Ϊ5 ����ͷ�
select min(sc.score) from ScoreInfo sc 
where sc.stuId=5;
--avg ƽ���ɼ�
--�����ݿ��Ŀ��ƽ����
select AVG(sc.score) from ScoreInfo sc 
inner join Subject sb on sb.subId=sc.subId
where sb.subTitle ='���ݿ�';
--sum ��ͺ���
--��ѧ���ɼ����ۺ�
select SUM(sc.score) from ScoreInfo sc;
--�������� over
--���ϲ������ݡ�
--��ͳ����Ϣ�ֲ�������
select  sc.*, avg(sc.score )  over()
from ScoreInfo sc;
*/


/*

--���� group by :
--ͳ����Ů������

select st.StudentGender,  count(*) from  
StudentInfo st
group by st.StudentGender;

--��ѯ�ɼ�
select AVG(sc.score) from ScoreInfo sc
where sc.subId=1;

--��ѯÿ����Ŀ��ƽ����
select sc.subId,AVG(sc.score) from ScoreInfo sc
group by sc.subId;

--���з���
--��ϰ1
select sc.subId,AVG(sc.score),sc.stuId from ScoreInfo sc
group by sc.subId,sc.stuId;

--��ϰ2
select st.StudentGender,st.ClassID, count(*)������
from StudentInfo st 
group by st.StudentGender,st.ClassID;

--ͳ��ѧ����Ŵ���6�ĸ��༶�ĸ��Ա�ѧ������
select st.ClassID,st.StudentGender,COUNT(*) 
from StudentInfo st 
where st.StudentID>6
group by st.ClassID,st.StudentGender;


--ͳ��ѧ����Ŵ���2�ı��Ϊ3�ı༭�ĸ��Ա��ѧ������
select  st.StudentGender,count(*) 
from StudentInfo st
where st.StudentID>6 and st.ClassID=3
group by st.StudentGender

--ͳ��ѧ����Ŵ���6�ĸ��༶�ĸ��Ա�ѧ������ѧ����������3����Ϣ
select  st.StudentGender,count(*)Serial 
from StudentInfo st
where st.StudentID>6 and st.ClassID=3
group by st.StudentGender
having COUNT(*)>2;

*/

--���ϲ�ѯ

use Study;

-- union
select ClassID from ClassInfo
union 
select StudentID from  StudentInfo ;
-- union all
select ClassID from ClassInfo
union all
select StudentID from  StudentInfo ;

--except �

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

--intersect ����
select ClassID from ClassInfo
intersect
select StudentID from  StudentInfo ;

--���ٱ���
--���ٱ���δ���ڱ��б������ݣ�
--��ṹ������
select * into test1  from ClassInfo;
select *from test1;
--��ṹ
select * into test2  from ClassInfo where 1=2;
select *from test2;
-- ���ݵ����еı�
insert  into test2(ClassName) select ClassName from test1
where ClassID>2;

--����
--����ת�� cast Convert
select CAST(89.0000 as decimal(4,2));
--Convert ������ת������
select CONVERT(decimal(4,2),89.0000,null)
--���ݿ�Ӻ������ �Ὣ���ӵ��ַ���ת����int���ͽ��м���
select cast(1 as char(1))+'1';
select  str(1) +'1';
--�ַ�������
--ascii
select ASCII(1);
--char()
select char(49);
--�ַ�����ȡ
--left(��ȡ�ַ���,��ȡ����)
select LEFT('abcd',2);
--right(��ȡ�ַ���,��ȡ����)
select right('abcd',2);
--substring(��ȡ�ַ���,��ʼ��ȡλ��,��ȡ����)
select SUBSTRING('abcd',2,1);
--len �����ַ����ĳ���
select LEN('abcd');
--lower,upper;��Сдת��
select LOWER('ABCD');
select UPPER('abcd');
--ltrim ,rtrim ȥ�ո�
select '    aaaa '
select  LTRIM('    aaaa    ')
select RTRIM('    aaaa    ')
--���ں���
--getDate
select GETDATE();
--��ȡһ��ĵڼ���
select DATEPART("DAYOFYEAR",GETDATE())
select DATEPART("HOUR",GETDATE())
--�����ܽ᣺��"2015-1-1"�ĸ�ʽ��ʾ����
select CAST( DATEPART("YYYY",GETDATE()) as char(4)) + '-'
 +CAST( DATEPART("MM",GETDATE()) as char(2))+'-'
 +CAST(DATEPART("DD",GETDATE()) as char(2))
 --��ҵ��ϰ
 --��ѯ��Ŀ���ơ�ƽ����
 select sb.subTitle,AVG(sc.score) ƽ���� from Subject sb
 inner join ScoreInfo sc on sc.subId=sb.subId
 group by sb.subTitle;
 --��ѯ�༶����ƽ����
 select ci.ClassName,AVG(sc.score)ƽ���� from ClassInfo ci 
 inner join StudentInfo st on st.ClassID= ci.ClassID
 inner join ScoreInfo sc on sc.stuId=st.StudentID
 group by ci.ClassName;
--��ѯ�༶���ơ���Ŀ���ơ�ƽ����
select ci.ClassName,sb.subTitle,AVG(sc.score) from ClassInfo ci
inner join StudentInfo st on st.ClassID=ci.ClassID
inner join ScoreInfo sc on sc.stuId=st.StudentID
inner join Subject sb on sb.subId=sc.subId
group by ci.ClassName,sb.subTitle;


select  LEN('��');
select   LEN( t.ClassName )from test1 t;--varchar
select   LEN( t.ClassName )from test2 t;--nvarchar
insert into test1
values('aaaa');
insert into test2
values('�ĸ�����'),('aaaa');

		


