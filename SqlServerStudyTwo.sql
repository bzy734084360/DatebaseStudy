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
create  table Score
(
	scoreId	int identity(1,1) primary key not null,
	stuId int not null,
	foreign key (stuId) references StudentInfo (StudentID),
	subId	int not null,
	foreign key (subId) references Subject(subId),
	score int not null
)
select *from Score;
--���ѧ���ɼ�
insert into Score
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
select top 2 *from StudentInfo st order by st.StudentID asc;
--����
select top 2*from StudentInfo st order by st.StudentID desc;
