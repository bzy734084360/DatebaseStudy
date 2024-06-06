--存储过程
-- '  abc  ' 'ababcc'
DECLARE @temp VARCHAR(10)

SET @temp ='  abc  '

SELECT Ltrim(Rtrim(@temp))

--封装去除空格的函数
--创建
CREATE PROC Trim @str1 VARCHAR(10)
AS
  BEGIN
      SELECT Ltrim(Rtrim(@str1))
  END

--使用
EXEC Trim
  '  abc   '

--编写 存储过程， 查询表中的总数据，及当前页的数据
ALTER PROC Seachstudent
  --pageindx,pagesize
  @pageindex INT,
  @pagesize  INT,
  @rowsCount INT output
AS
  BEGIN
      SET nocount ON;

      SELECT @rowsCount = Count(*)
      FROM   StudentInfo;

      SELECT *
      FROM   (SELECT Row_number()
                       OVER(
                         ORDER BY studentid DESC)rowIndex,
                     *
              FROM   StudentInfo) t
      WHERE  rowindex BETWEEN ( ( @pageindex - 1 ) * @pagesize + 1 ) AND @pagesize * @pageindex;
  END

DECLARE @temp INT

EXEC Seachstudent
  1,
  2,
  @temp output

PRINT @temp

--聚集索引
--非聚集索引
SELECT *
FROM   personList;

SELECT *
INTO   personListTest2
FROM   PersonList;

--设计表添加索引
--脚本添加索引
CREATE NONCLUSTERED INDEX ix_phone
  ON personlistTest(pPhone);

--一般主键才会作为聚集索引
--create clustered index
SET statistics time ON --off

SELECT *
FROM   PersonListTest t
WHERE  t.pPhone = '15109298203'; -- CPU 时间 = 46 毫秒，占用时间 = 1241 毫秒。

SELECT *
FROM   PersonListTest2 t
WHERE  t.pPhone = '15109298203'; -- CPU 时间 = 16 毫秒，占用时间 = 1189 毫秒。
--增删改查练习
SELECT *
FROM   SubjectInfo;

ALTER VIEW ScoreInfoList
AS
  SELECT sc.scoreId,
         st.StudentID,
         sb.subiD,
         cl.ClassID,
         st.StudentName,
         sb.subTitle,
         sc.score
  FROM   ScoreInfo sc
         INNER JOIN StudentInfo st
                 ON st.StudentID = sc.stuId
         INNER JOIN ClassInfo cl
                 ON cl.ClassID = st.ClassID
         INNER JOIN SubjectInfo sb
                 ON sb.subiD = sc.subId;



--触发器
--1、insert 触发器学习
--创建触发器所用学生表
CREATE TABLE studentTriggerTB
  (
     stu_id     INT IDENTITY(1, 1) PRIMARY KEY,
     stu_name   VARCHAR(10),
     stu_gender CHAR(2),
     stu_age    INT
  )

--创建insert 触发器
CREATE TRIGGER trig_insert
ON studentTriggerTB
after INSERT
AS
  BEGIN
      IF Object_id(N'student_sum', N'U') IS NULL --判断表是否存在
        CREATE TABLE student_sum
          (
             stuCount INT DEFAULT(0)
          ); --创建存储学生人数的表
      DECLARE @stuNumber INT;

      SELECT @stuNumber = Count(*)
      FROM   studentTriggerTB;

      IF NOT EXISTS (SELECT *
                     FROM   student_sum) --判断表中是否有记录
        INSERT INTO student_sum
        VALUES      (0);

      UPDATE student_sum
      SET    stuCount = @stuNumber;
  END 

--测试触发器trig_insert-->功能是向student插入数据的同时级联插入到student_sum表中，更新stuCount
--因为是后触发器，所以先插入数据后，才触发触发器trig_insert;
insert into studentTriggerTB(stu_name,stu_gender,stu_age)values('吕布','男',30);
select stuCount 学生总人数 from student_sum;    
insert into studentTriggerTB(stu_name,stu_gender,stu_age)values('貂蝉','女',30);            
select stuCount 学生总人数 from student_sum;
insert into studentTriggerTB(stu_name,stu_gender,stu_age)values('曹阿瞒','男',40);                
select stuCount 学生总人数 from student_sum;

--级联更新学生人数表应禁止插入数据

--创建insert_forbidden，禁止用户向student_sum表中插入数据
CREATE TRIGGER insert_forbidden
ON student_sum
after INSERT
AS
  BEGIN
      RAISERROR('禁止直接向该表中插入记录，操作被禁止',1,1); --raiserror 是用于抛出一个错误

      --事务回滚
      ROLLBACK TRANSACTION
  END 


--触发触发器insert_forbidden
insert student_sum (stuCount) values(5);

--delete触发器学习
-- 删除数据记录会临时存储在 触发器作用域 deleted 临时表中 触发器执行完成则数据清空

--创建删除触发器
CREATE TRIGGER trig_delete
ON studentTriggerTB
after DELETE
AS
  BEGIN
      SELECT stu_id AS DeleteId,
             stu_name,
             stu_gender,
             stu_age
      FROM   deleted
	  declare @stuNumber int;
	  select @stuNumber=count(*) from studentTriggerTB;
	  update student_sum set stuCount=@stuNumber;
  END 
--测试delete 触发器
delete from studentTriggerTB where stu_id=1;

--update 触发器学习

--创建update 触发器
CREATE TRIGGER trig_update
ON studentTriggerTB
after UPDATE
AS
  BEGIN
      DECLARE @stuCount INT;

      SELECT @stuCount = Count(*)
      FROM   studentTriggerTB;

      UPDATE student_sum
      SET    stuCount = @stuCount;

      SELECT stu_id   更新前学生编号,
             stu_name 更新前学生姓名
      FROM   deleted; --更新前数据

      SELECT stu_id   更新后学生编号,
             stu_name 更新后学生姓名
      FROM   inserted; --更新后数据
  END 

--测试update 触发器
update studentTriggerTB set stu_name='张飞'where stu_id=2;

--创建替代触发器 instead of  说明：替代触发器 只会执行触发器内容，不会执行原有的insert语句
CREATE TRIGGER trig_insteadOf
ON studentTriggerTB
instead OF INSERT
AS
  BEGIN
      DECLARE @stuAge INT;

      SELECT @stuAge = (SELECT stu_age
                        FROM   inserted);

      IF( @stuAge > 120 )
        SELECT '插入年龄错误' AS '失败原因'
  END 

--测试替代触发器

INSERT INTO [dbo].[studentTriggerTB]
           ([stu_name]
           ,[stu_gender]
           ,[stu_age])
     VALUES
           ('子龙'
           ,'男'
           ,110)

select *from studentTriggerTB;
select *from student_sum;


--嵌套触发器 触发器1中修改数据 出发了触发器2 这种
--未找到合适的方法
--递归触发器 触发器中又触发了当前触发器
