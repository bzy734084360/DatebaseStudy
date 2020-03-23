select *from StudentInfo sd
inner join ClassInfo ci on ci.ClassID=sd.ClassID
where ci.ClassID=2;
--������ͼ
create view GetStudentInfo
as
select sd.*,ci.ClassName from StudentInfo sd
inner join ClassInfo ci on ci.ClassID=sd.ClassID;
--�޸�
alter view  GetStudentInfo
as 
select sd.*,ci.ClassName from StudentInfo sd
inner join ClassInfo ci on ci.ClassID=sd.ClassID;
--ɾ��
drop view GetStudentInfo
--ʹ��
select *from GetStudentInfo t 
where t.ClassID=2;

--�Ӳ�ѯ

select *from StudentInfo;
select *from ScoreInfo;
--��ѯ�����˿��Ե�ѧ����Ϣ

select *from StudentInfo st where st.StudentID in ( select distinct si.stuId from ScoreInfo si);

--exists in 
select *from StudentInfo st where  exists( select '' from ScoreInfo sc where sc.stuId=st.StudentID)

--��ҳ��ѯ ��֪��ҳ��С��ҳ����
-- 3  1 
-- 1,3 1,3
-- 2,3 4,6
-- 3,3 7,9
-- 4,3 10,12 
select *from  (select top 100 percent *,ROW_NUMBER()  over(order by st.StudentID desc) rowindex from StudentInfo st 
where st.StudentGender=1
) a
where a.rowindex between 5 and 8;


--case when then end

--��ѯѧ�����ơ���Ŀ���ơ��ɼ�
select *
from ScoreInfo si
inner join StudentInfo st on st.StudentID=si.stuId
inner join Subject sb on sb.subId=si.subId
