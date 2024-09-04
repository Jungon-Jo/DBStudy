// ���̺� ����
create table muser(
id int,
reg_num varchar2(8) not null,
name varchar2(10 char),
grade int,
salary int,
time int);

create sequence muser_no
increment by 1
start with 10;

// ������ �Է�
insert into muser values(muser_no.nextval,'870205-1','�̽���',1,10000,34);
insert into muser values(muser_no.nextval,'880405-1','������',2,20000,31);
insert into muser values(muser_no.nextval,'770715-2','���̼�',4,40000,32);
insert into muser values(muser_no.nextval,'010205-3','������',1,10000,30);
insert into muser values(muser_no.nextval,'810205-2','������',2,20000,34);
insert into muser values(muser_no.nextval,'820219-2','���¿�',3,30000,35);
insert into muser values(muser_no.nextval,'020205-3','�����',1,10000,30);
insert into muser values(muser_no.nextval,'970214-2','������',2,20000,31);
insert into muser values(muser_no.nextval,'040205-4','������',4,40000,31);
insert into muser values(muser_no.nextval,'770225-1','���翵',5,50000,30);
insert into muser values(muser_no.nextval,'770905-2','�̽ż�',4,40000,34);
insert into muser values(muser_no.nextval,'050208-3','�̹߲�',2,20000,30);
insert into muser values(muser_no.nextval,'051205-4','�̿���',1,10000,34);
insert into muser values(muser_no.nextval,'891215-1','���¾�',3,30000,30);
insert into muser values(muser_no.nextval,'670805-1','������',2,20000,34);
insert into muser values(muser_no.nextval,'840207-1','���̷�',1,10000,35);
insert into muser values(muser_no.nextval,'770405-1','��õ��',1,10000,31);

select * from muser;

// ����
// 1. grade�� 3�� ����� ����ΰ���?
select count(*) �ο��� from muser where grade=3;
select count(*)
from muser
where grade=3;
-- select���� grade�÷��� ǥ���Ű�� ���ؼ��� group by�� ����Ͽ� grade �׷��� �������־�� �Ѵ�.

// 2. grade�� 1, 2, 4�� ����� salary�� ����� ���Ͻÿ�.
select avg(salary) ��պ��� from muser where grade=1 or grade=2 or grade=4;
select avg(salary)
from muser
where grade in (1,2,4);
//where grade=1 or grade=2 or grade=4;
// group by  -- ���� : �׷캰 ������ ���
// order by

// 3. salary�� 20000 �̸��� ����� �� ����Դϱ�?
select count(*) �ο��� from muser where salary<20000;

// 4. salary�� 30000 �̻��� ����� salary ����� ���Ͻÿ�.
select avg(salary) ��պ��� from muser where salary>=30000;

// 5. 77��� �߿� salary�� ���� ���� ����� �̸��� ���̿� salary�� ����Ͻÿ�.
select name, 124-substr(reg_num,1,2) age, salary 
    from muser 
    where substr(reg_num,1,2)='77' and salary=(select min(salary) from muser where substr(reg_num,1,2)='77');
    
select min(salary)
from muser
where substr(reg_num,1,2)='77';

-- 77����� �����͸� �̾ƺ���.
select substr(reg_num,1,2) from muser;

-- 77��� �� ���� ���� salary�� �̾� ������.
select min(salary)
from muser
where substr(reg_num,1,2)='77';

-- ����(������ where���� salary�� ���� ��� ���� �� �ִ� ���̹Ƿ�, ����� ��� �ٸ� ������ ���ִ°��� ����.)
select name, 124-substr(reg_num,1,2) age, salary 
    from muser 
    where substr(reg_num,1,2)='77' and salary=10000;
    
-- ����, �Լ� ��� ��� �Ұ��ϹǷ�, ���������� ������ش�.(77��� �� ���� ���� salary�� �̾Ƴ� ������ ���������� ���)
select name, 124-substr(reg_num,1,2) age, salary 
    from muser 
    where substr(reg_num,1,2)='77' and salary=
                                            (select min(salary)
                                            from muser
                                            where substr(reg_num,1,2)='77');
                                            
-- ���̸� ����Ϸ��� �ϴµ� �ֹι�ȣ�ۿ� ����, �м��Լ��� ����ϱ� ���ؼ��� ���ڸ��� ����⵵�� �ʿ��ϴ�.
select 1900+substr(reg_num,1,2) from muser;
-- 2000��� ����ڵ��� ��� ������ �߻�
-- 2000��� ����ڵ��� �ֹι�ȣ ���ڸ��� ù��° ���� 3�� 4�� �����ϴ°��� �̿��Ͽ� �����ؼ� ���� ������ش�.
select substr(reg_num,1,2) a, 
       decode(substr(reg_num,8,1),1,1900,2,1900,2000) b 
       from muser;
select substr(reg_num,1,2) a, 
       decode(substr(reg_num,8,1),1,1900,2,1900,2000) b,
       decode(substr(reg_num,8,1),1,1900,2,1900,2000)+substr(reg_num,1,2) c 
       from muser;
       
-- ���� ���
select name �̸�,
       extract (year from sysdate)-(decode(substr(reg_num,8,1),1,1900,2,1900,2000)+substr(reg_num,1,2)) ����,
       salary �޿�
       from muser 
       where substr(reg_num,1,2)='77'
             and salary=(select min(salary)
                                from muser
                                where substr(reg_num,1,2)='77');
    
// 6. ��� ����� �̸��� ����(���� ��, ���� ��� 0205)�� ����Ͻÿ�.
select name, substr(reg_num,3,4) birth from muser;

// 7. ������ ��� �޿��� ���Ͻÿ�.
select avg(salary) from muser where substr(reg_num,length(reg_num),1) in (1,3);

// 8. ��ü ��ձ޿����� ���� �޿��� �޴� ����� �̸���, �޿��� ����Ͻÿ�.
select name, salary from muser where salary>(select avg(salary) from muser);
-- ��� �޿����� ���� �޿��� �޴� ����� Ʃ�� ����
-- �÷� ��ü�� �ذ�? ����? �Լ�? ��������?
-- ��ձ޿��� ��������� ������ �ϼ� �� ��������

// 9. ��ü ��ձ޿����� ���� �޿��� �޴� ����� �̸���, �޿�, ��ձ޿��� ����Ͻÿ�.
select name,
       salary,
       (select avg(salary) from muser) avgSalary -- ��Į�� ���� ����
    from muser
    where salary>(select avg(salary) from muser);
-- ������ ���� ���ϴ�.(������ select���� Ʃ���� �ϳ��� �ϼ��� �������� ���������� ����)
-- ���� ���������� ��� �����ϱ� �����̴�.

// 10. �������� ��ձ޿����� ���� ���������� ��� ����Դϱ�
select sum(count(*))
from muser
where salary>(select avg(salary) from muser where substr(reg_num,length(reg_num),1)=2 or substr(reg_num,length(reg_num),1)=4)
group by reg_num
having substr(reg_num,length(reg_num),1)=1 or substr(reg_num,length(reg_num),1)=3;

select sum(count(*))
from muser
where substr(reg_num,length(reg_num),1)=1 or substr(reg_num,length(reg_num),1)=3
group by salary
having salary>(select avg(salary) from muser where substr(reg_num,length(reg_num),1)=2 or substr(reg_num,length(reg_num),1)=4);

// 11. grade�� ��� �޿��� ����ϼ���
select grade, avg(salary) avgsalary from muser group by grade;

// 12. �׷캰 ��ձ޿��� ��ü ��պ��� ���� �׷��� ����Ͻÿ�.
select grade from muser group by grade having avg(salary)>(select avg(salary) from muser) order by grade;

// 13. �������� ���� ������ ����Ͻÿ�. (��� ���´� �̸�, ����(grade*salary*time)
select name �̸�, grade*salary*time ���� from muser;

// 14. �������� ������ ����Ͻÿ�. (��� ���� �̸�, ����(������ ���Ǵ� ���� ����Ѵ�)
select name �̸�
    , case when substr(reg_num, length(reg_num), 1)=1 or substr(reg_num, length(reg_num), 1)=3 then '��' 
           when substr(reg_num, length(reg_num), 1)=2 or substr(reg_num, length(reg_num), 1)=4 then '��' end ����
from muser;

select name �̸�,
       case when substr(reg_num, length(reg_num), 1) in (1,3) then '��' 
           else '��'
       end ����
       from muser;

select name �̸�,
       decode(substr(reg_num,8,1),'1','��',3,'��','��') ����
       from muser;

select distinct grade, salary from muser;
-- distinct�� �ߺ��� �÷��� �����ϰ� select ������ �ѹ��� ����� ����
-- �ߺ����� ������ select���� ������ ��ü ���� �ߺ��̴�.
-- #3�� �������� ���ɺ�(time�÷�) �޿��� ��. over �Լ� �̿�
select time ����,
       sum(salary) over(partition by time) ����
       from muser;
       
select distinct -- distinct�� select���� ���� ��� column�� ����Ǿ� �ߺ��� �����Ѵ�.
       time ����,
       sum(salary) over(partition by time) ����
       from muser;

// 15. time�� �ٹ��ð�, �ٹ��ð��� 31�̻��� ����� �̸��� ����Ͻÿ�.
select name from muser where time>=31;

// 16. ¦���⵵�� �¾ ������� �̸��� ��� ����Ͻÿ�.
select name, reg_num from muser where mod(substr(reg_num,1,2),2)=0;

// 17. �������� ��������� ����Ͻÿ�. (��� ���´� �̸��� �������(97��1��2��))
select substr(reg_num,1,2)||'��'||replace(substr(reg_num,3,2)||'��'||substr(reg_num,5,2)||'��','0','') ������� from muser;

// 18. ���������� ���Ƹ� �����ϱ� ���� ��å���� time�� 2�ð������ϱ�� �ߴ�. �̸� ó�� �Ͻÿ�.
select id
    , reg_num
    , name
    , grade
    , salary
    , case when substr(reg_num, length(reg_num), 1)=1 or substr(reg_num, length(reg_num), 1)=3 then time 
           when substr(reg_num, length(reg_num), 1)=2 or substr(reg_num, length(reg_num), 1)=4 then time+2 end time
    from muser;

// 19. ���̺� �ο����� ����Դϱ�
select substr(reg_num,1,2), count(*) from muser group by substr(reg_num,1,2);

// 20. 2�г�׷�� 4�г� �׷��� ��� ����Դϱ�
select grade, count(*) �ο��� from muser group by grade having grade=2 or grade=4;


// �߰�����

// #1) ��� ����� �¾ �� ���ñ��� �� ���� �������� ����Ͻÿ�
// (�������: �̸�, �ֹι�ȣ, ���ݱ�����ƿ¿���)
select name
    , reg_num
    , trunc(months_between(sysdate, (substr(reg_num,1,2)||'-'||substr(reg_num,3,2)||'-'||substr(reg_num,5,2)))) �� 
    from muser;
    
// #2) time�� ���̷� ��. 30~31���� ��ƿ� ������ ��, 32�� �̻��� ��ƿ� ������ �� ���ϱ�
select sum(12*(select sum(time) from muser where time>=30 and time <=31)) "31�� ����"
    , sum(12*(select sum(time) from muser where time>=32)) "32�� �̻�"
    from muser;
    
select
    (select trunc(sum(months_between(sysdate,substr(reg_num,1,6)))) from muser where time in (30,31)) as �������,
    (select trunc(sum(months_between(sysdate,substr(reg_num,1,6)))) from muser where time >= 32) as �������
    from dual;

// #3) ���ɺ� �޿��� ��, over()�Լ� �̿�
select time, sum(salary) over(partition by time order by time) "�޿��� ��" from muser;

// #4) ���ɺ� �ο���, over()�Լ� �̿�
select time, count(*) over(partition by time order by time) �ο��� from muser;

// #5) ��޺� �޿��� �ְ�޿�, over()�Լ� �̿�
select grade, max(salary) over(partition by grade order by grade) �ְ�޿� from muser;

// #6) ���۰˻��Ͽ� ����Ŭ �Լ� ����
// �����Լ�
-- count(*) : Ʃ���� ������ ����
-- sum([�÷���]) : �÷��� �ش��ϴ� ���� ��
-- like : like '[�������� Ȱ��� ���ڿ�]%' or '%[�������� Ȱ��� ���ڿ�]'/Ư�� ���ڿ��� ������ ���ڿ��� ã���� �� �� ����Ѵ�.
-- is null : [�÷���] is null/���������� null���� ��츦 ������ �� ����ϸ�, =null�� ����� �� ����.