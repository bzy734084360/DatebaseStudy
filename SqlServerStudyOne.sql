
/*--��ѯϵͳ�⣬���鿴�ж������ݿ�
select *from sysdatabases;
--��ѯ�û������ı�
select *from sysobjects where xtype='U';
--ɾ�����ݿ�
drop database dbTest;
--�������ݿ�
--��ɲο�ϵͳ���ݿⴴ����sql
create database  dbTest
on primary
(
	name='dbTest_Data',
	filename='D:\SQL2012\MSSQL11.SQLEXPRESS\MSSQL\DATA\dbTest_Data.mdf',
	size=10mb,
	filegrowth=10mb
)
log on 
(
	name='dbTest_Log',
	filename='D:\SQL2012\MSSQL11.SQLEXPRESS\MSSQL\DATA\dbTest_Log.mdf',
	size=10mb,
	filegrowth=10%
)
--������
use Study
create table TestTable
(
	cId int not null primary key  identity(1,1),
	cTitle	nvarchar(10)
)

create table TestTable2
(
 sId int not null primary key identity(1,1),
 sName nvarchar(10) not null,
 sGender bit default(0),
 sBirthday date,
 sPhone char(11),
 sEmail varchar(20),
 cId int not null,
 foreign key (cId) references TestTable(cId)
)
*/

/*
--���������ɾ�Ĳ�ű����
--21232f297a57a5a743894a0e4a801fc3 admin

--���� insert info info����ʡ�ԣ�
select *from UserInfo;
insert   UserInfo 
(
	UserName,
	UserPwd
)
values
(
	'С����',
	'21232f297a57a5a743894a0e4a801fc3'
);
--��Ҫ����������������Ҫ��ʾ������
--��д��
insert UserInfo
values
(
	'��ͷ��',
	'21232f297a57a5a743894a0e4a801fc3',
	'1994-12-12',
	null
)
--ΪĳЩ�и�ֵ����д��ָ������
insert UserInfo
(
	UserName,
	UserPwd
)
values
(
	'��־ƽ',
	'21232f297a57a5a743894a0e4a801fc3'
);
--һ����д�������ݣ���������д����
select *from ClassInfo order by ClassID;
insert into ClassInfo
values('����'),('�׻�'),('����'),('��ȸ');
*/
/*
--�޸� update ���� set ����1��ֵ=ֵ1,����2��ֵ=ֵ2
select *from UserInfo;

--Ϊ�����е�ָ���� �����޸�
update UserInfo set UserPwd='admin';
--Ϊָ���м��������޸���
update UserInfo set UserPwd='21232f297a57a5a743894a0e4a801fc3'
where UserId>1;
*/
/*
--ɾ�� delete ���� where
select *from ClassInfo order by ClassID	;
delete ClassInfo where ClassID>3;
insert into ClassInfo
values('�䵱');
*/

--���
select *from UserInfo;
truncate table UserInfo;