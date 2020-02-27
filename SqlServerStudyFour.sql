--SQLSERVER 注入练习

select *from UserInfo ;

--插入数据练习
--参数化SQL
select count(*) from UserInfo where username=@name;
--参数化SQL查询结果
exec sp_executesql
 N'select count(*) from UserInfo where username=@name',N'@name nvarchar(19)',@name=N'dlb1'' or 1=1 or 1=''';


create table PersonList
(
	pid int primary key  not null identity(1,1),
	pName nvarchar(50),
	pPhone char(11),
	pBirthday date,
	pEmail varchar(50)
)
select count(*) from PersonList;
truncate table personlist;
select *from PersonList t where t.pName='郑一峰';
insert into PersonList values(@name,@phone,@birthday,@email);