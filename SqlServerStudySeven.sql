--�洢����
-- '  abc  ' 'ababcc'
DECLARE @temp VARCHAR(10)

SET @temp ='  abc  '

SELECT Ltrim(Rtrim(@temp))

--��װȥ���ո�ĺ���
--����
CREATE PROC Trim @str1 VARCHAR(10)
AS
  BEGIN
      SELECT Ltrim(Rtrim(@str1))
  END

--ʹ��
EXEC Trim
  '  abc   '

--��д �洢���̣� ��ѯ���е������ݣ�����ǰҳ������
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

--�ۼ�����
--�Ǿۼ�����
SELECT *
FROM   personList;

SELECT *
INTO   personListTest2
FROM   PersonList;

--��Ʊ��������
--�ű��������
CREATE NONCLUSTERED INDEX ix_phone
  ON personlistTest(pPhone);

--һ�������Ż���Ϊ�ۼ�����
--create clustered index
SET statistics time ON --off

SELECT *
FROM   PersonListTest t
WHERE  t.pPhone = '15109298203'; -- CPU ʱ�� = 46 ���룬ռ��ʱ�� = 1241 ���롣

SELECT *
FROM   PersonListTest2 t
WHERE  t.pPhone = '15109298203'; -- CPU ʱ�� = 16 ���룬ռ��ʱ�� = 1189 ���롣
--��ɾ�Ĳ���ϰ
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



--������
--1��insert ������ѧϰ
--��������������ѧ����
CREATE TABLE studentTriggerTB
  (
     stu_id     INT IDENTITY(1, 1) PRIMARY KEY,
     stu_name   VARCHAR(10),
     stu_gender CHAR(2),
     stu_age    INT
  )

--����insert ������
CREATE TRIGGER trig_insert
ON studentTriggerTB
after INSERT
AS
  BEGIN
      IF Object_id(N'student_sum', N'U') IS NULL --�жϱ��Ƿ����
        CREATE TABLE student_sum
          (
             stuCount INT DEFAULT(0)
          ); --�����洢ѧ�������ı�
      DECLARE @stuNumber INT;

      SELECT @stuNumber = Count(*)
      FROM   studentTriggerTB;

      IF NOT EXISTS (SELECT *
                     FROM   student_sum) --�жϱ����Ƿ��м�¼
        INSERT INTO student_sum
        VALUES      (0);

      UPDATE student_sum
      SET    stuCount = @stuNumber;
  END 

--���Դ�����trig_insert-->��������student�������ݵ�ͬʱ�������뵽student_sum���У�����stuCount
--��Ϊ�Ǻ󴥷����������Ȳ������ݺ󣬲Ŵ���������trig_insert;
insert into studentTriggerTB(stu_name,stu_gender,stu_age)values('����','��',30);
select stuCount ѧ�������� from student_sum;    
insert into studentTriggerTB(stu_name,stu_gender,stu_age)values('����','Ů',30);            
select stuCount ѧ�������� from student_sum;
insert into studentTriggerTB(stu_name,stu_gender,stu_age)values('�ܰ���','��',40);                
select stuCount ѧ�������� from student_sum;

--��������ѧ��������Ӧ��ֹ��������

--����insert_forbidden����ֹ�û���student_sum���в�������
CREATE TRIGGER insert_forbidden
ON student_sum
after INSERT
AS
  BEGIN
      RAISERROR('��ֱֹ����ñ��в����¼����������ֹ',1,1); --raiserror �������׳�һ������

      --����ع�
      ROLLBACK TRANSACTION
  END 


--����������insert_forbidden
insert student_sum (stuCount) values(5);

--delete������ѧϰ
-- ɾ�����ݼ�¼����ʱ�洢�� ������������ deleted ��ʱ���� ������ִ��������������

--����ɾ��������
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
--����delete ������
delete from studentTriggerTB where stu_id=1;

--update ������ѧϰ

--����update ������
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

      SELECT stu_id   ����ǰѧ�����,
             stu_name ����ǰѧ������
      FROM   deleted; --����ǰ����

      SELECT stu_id   ���º�ѧ�����,
             stu_name ���º�ѧ������
      FROM   inserted; --���º�����
  END 

--����update ������
update studentTriggerTB set stu_name='�ŷ�'where stu_id=2;

--������������� instead of  ˵������������� ֻ��ִ�д��������ݣ�����ִ��ԭ�е�insert���
CREATE TRIGGER trig_insteadOf
ON studentTriggerTB
instead OF INSERT
AS
  BEGIN
      DECLARE @stuAge INT;

      SELECT @stuAge = (SELECT stu_age
                        FROM   inserted);

      IF( @stuAge > 120 )
        SELECT '�����������' AS 'ʧ��ԭ��'
  END 

--�������������

INSERT INTO [dbo].[studentTriggerTB]
           ([stu_name]
           ,[stu_gender]
           ,[stu_age])
     VALUES
           ('����'
           ,'��'
           ,110)

select *from studentTriggerTB;
select *from student_sum;


--Ƕ�״����� ������1���޸����� �����˴�����2 ����
--δ�ҵ����ʵķ���
--�ݹ鴥���� ���������ִ����˵�ǰ������
