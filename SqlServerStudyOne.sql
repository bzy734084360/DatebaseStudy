
/*--查询系统库，来查看有多少数据库
select *from sysdatabases;
--查询用户创建的表
select *from sysobjects where xtype='U';
--删除数据库
drop database dbTest;
--创建数据库
--或可参考系统数据库创建的sql
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
--创建表
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
--操作表的增删改查脚本语句
--21232f297a57a5a743894a0e4a801fc3 admin

--插入 insert info info可以省略，
select *from UserInfo;
insert   UserInfo 
(
	UserName,
	UserPwd
)
values
(
	'小笼包',
	'21232f297a57a5a743894a0e4a801fc3'
);
--若要插入所有数据则不需要显示出列名
--简写：
insert UserInfo
values
(
	'大头贴',
	'21232f297a57a5a743894a0e4a801fc3',
	'1994-12-12',
	null
)
--为某些列赋值则需写明指定列名
insert UserInfo
(
	UserName,
	UserPwd
)
values
(
	'尹志平',
	'21232f297a57a5a743894a0e4a801fc3'
);
--一次性写入多个数据（批量插入写法）
select *from ClassInfo order by ClassID;
insert into ClassInfo
values('青龙'),('白虎'),('玄武'),('朱雀');
*/
/*
--修改 update 表名 set 列名1的值=值1,列名2的值=值2
select *from UserInfo;

--为所有行的指定列 进行修改
update UserInfo set UserPwd='admin';
--为指定行继续进行修改列
update UserInfo set UserPwd='21232f297a57a5a743894a0e4a801fc3'
where UserId>1;
*/
/*
--删除 delete 表名 where
select *from ClassInfo order by ClassID	;
delete ClassInfo where ClassID>3;
insert into ClassInfo
values('武当');
*/

--清空
select *from UserInfo;
truncate table UserInfo;