--��ϰ
--���ݿ����ɾ�Ĳ�

--���ݼ���
--��ѯ�ñ������е�����
select *from StudentInfo;
--��ѯ����������������
select st.StudentName,st.StudentGender,st.StudentPhone  from StudentInfo st;
---����
select st.StudentName ����,st.StudentGender �Ա�,st.StudentPhone �绰  from StudentInfo st;

select ����= st.StudentName ,�Ա�=st.StudentGender ,�绰=st.StudentPhone   from StudentInfo st;


--select ����������
select 1+1;
print 1+1;

--��ȡ��ǰʱ��
select GETDATE();

--ȡǰ����������
select top 5 * from StudentInfo;
--��ȡ��ʶ����5��ѧ�� ��С�������� asc�ɲ���д
select top 5* from StudentInfo st
order by st.StudentID desc ; 
--ȡǰ�ٷ�֮����
select top  15 percent * from StudentInfo st;
--��ѯ�༶������������2 �İ༶��Ϣ
select  sc.ClassID,  count(1) from StudentInfo sc 
group by sc.ClassID
having count(1)>0;


select *from StudentInfo;
--ȥ���ظ�
select distinct StudentName from StudentInfo;
--���ӣ��������ͱ�����ͬ��
select st.StudentName+st.StudentEmail  from StudentInfo st;
--�ۺϺ��� null ����������
--sum
select sum(sc.score)  from ScoreInfo sc; 
--ƽ���ɼ�
select avg(sc.score)  from ScoreInfo sc; 
--max
select max(sc.score) from ScoreInfo sc;
--min
select count(st.StudentPhone) from StudentInfo st

select 1+null;
--�ۺϺ�����ϰ
--���� select *, count(*)  from  StudentInfo;

--ģ����ѯ



-- ��ֵ
--��ѯ�绰����Ϊ�յ���Ϣ
select *from StudentInfo st where st.StudentPhone is  null;
--��ѯ�绰���벻Ϊ�յ���Ϣ
select *from StudentInfo st where st.StudentPhone is not null;

--��ѯѧ�����в�ѯ��ÿ����İ༶ID�Ͱ༶����
select st.ClassID �༶��ID ,count(*) �༶������  from StudentInfo st
group by st.ClassID;

--��ѯѧ�����ѯ��ÿ����İ༶ID �Ͱ༶��ͬѧ������
select st.ClassID,count(*)
from StudentInfo st
where st.StudentGender=1
group by st.ClassID;


--ת��
select '����Ϊ'+CAST(GETDATE() as varchar(30))
select '����Ϊ'+ CONVERT(varchar(30),GETDATE(),111);

--��ѯѧϰ��Ϣ�����绰����Ϊ�����Ϊ ����ϵ��ʽ
select st.*, ISNULL(CONVERT(varchar(20),st.StudentPhone),'����ϵ��ʽ') from StudentInfo st;

--���ϲ�ѯ

--���
select MAX( sc.score) ��߳ɼ�,MIN(sc.score)��ͳɼ�, SUM(sc.score) �ܳɼ�   from ScoreInfo sc;
--�ݱ�
select '��߳ɼ�' ������Ϣ,MAX(sc.score) �ɼ� from ScoreInfo sc
union
select '��ͳɼ�' ������Ϣ,MIN(sc.score) �ɼ� from ScoreInfo sc
union
select '�ܳɼ�' ������Ϣ,SUM(sc.score)�ɼ�  from ScoreInfo sc

--���ٱ���
--��ͬ�ڲ����������

--���е����ݸ�ֵ��Լ��û��
--
select * into tbtest from ScoreInfo;
drop table tbtest;

--ֻ��ֵ��ṹ
select top 0 * into tbtest from ScoreInfo;

--�ر�������ʶ�����
--���� 2012 �汾��Ч ԭ��δ������
set identity_insert tbtest on;

--�����б��������
insert into tbtest select *from ScoreInfo;

--���ú���

select LEN('�������');
select DATALENGTH('������Ϣ');

--��Сдת��
select  UPPER('asdv');
select LOWER('ADSD');
--ȥ�ո�
-- LTRIM RTRIM

--�ַ�����ȡ
--��߽�ȡ
select LEFT('ÿ�춼Ҫ�Է�',1)
--�ұ߽�ȡ
select RIGHT('�ɿڿ��ֲ��ó�',3)
--�����ȡ
--�ӵڶ����ַ���ȡ����ȡ����Ϊ�ĸ�
select SUBSTRING('123456',2,4)

--��ȡʱ��
select GETDATE();
--�����
select DATEADD(year,5,GETDATE())
--����º�
select DATEADD(MONTH,5,GETDATE())
--���Сʱ��
select DATEADD(HOUR,5,GETDATE())
--ʱ�����
select DATEDIFF(year,'1997-3-1',GETDATE());
--���ݿ� ʱ�䷶Χ
select DATEADD(year,-266,GETDATE())
--��ȡʱ���ĳ������
select DATEPART(YEAR,GETDATE())
--��ȡʱ���ĳ������
select DATEPART("HOUR",GETDATE())

--�������������ͨ��ʱ�����5����¼
select top 5  *,DATEDIFF(SECOND,StartDateTime,EndDateTime) ͨ��ʱ�� from 
CallRecords order by ͨ��ʱ�� desc;
