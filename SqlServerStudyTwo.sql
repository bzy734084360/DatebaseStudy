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
