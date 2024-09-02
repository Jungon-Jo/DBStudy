// 1. ���̺� �����
create table users(
no int primary key,
name varchar2(10),
addr varchar2(10),
point number,
grade varchar2(1),
jumin varchar2(8));

// 2. ���̺� Ʃ�� ����
insert into users values (1,'kimsu','suwon',99.12,1,'820405-1');
insert into users values (2,'leesu','suwon city',89.00,2,'970805-2');
insert into users values (3,'choihee','seoul',88.21,1,'910204-2');
insert into users values (4,'leesil','suwon',77.62,4,'850405-1');
insert into users values (5,'james','seoul',60.22,1,'871105-1');
insert into users values (6,'parksuji','suwon',90.12,3,'880405-2');
insert into users values (7,'kimrae','yougin',89.96,3,'820105-1');
insert into users values (8,'sangJin','youngin',99.31,3,'990420-2');
insert into users values (9,'Leechan','incheon',79.12,2,'970605-2');
insert into users values (10,'kimmi','incheon',79.92,1,'810505-1');
insert into users values (11,'ryusu','seoul',85.32,4,'861205-2');
insert into users values (12,'Gosu',null,82.13,4,'810715-1');

select * from users;
// 3. ����Ǯ��
// �⺻����
// 1) ��� ������� �̸��� ������ ��������� �˻��Ͻÿ�.
select name, point, jumin from users;

// 2) 80�� �̻��� ����� �̸��� �ּ�, ������ �˻��Ͻÿ�.
select name, addr, point from users where point>=80;

// 3) �̸��� kim���� ���۵Ǵ� ����� �̸��� �ּҸ� �˻��Ͻÿ�.
select name, addr from users where name like 'kim%';
// kim% = kim~~~~�� ���� �ǹ�

// 4) ���� �������� +10���� ������ ������ ����Ͻÿ�.(��, ���� �����Ϳ��� �ݿ����� �ʽ��ϴ�.)
select no, name, addr, point+10 point, grade, jumin from users;

// 5) 1�г��� ������ +1���� �÷��� ����ϼ���.
select no, name, addr, point+1 point, grade, jumin from users where grade=1;

// 6) B����� ȹ���� ����� �̸�, �ּ�, ������ ����ϼ���.(B��� 80�� �̻� 90�� �̸��Դϴ�.)
select name, addr, point from users where point>=80 and point<90;
// and = �� ������ ��� �������Ѷ�

// 7) ���� ��� �� NULL�� ���� �Է����� ���� ���Դϴ�.
//    �ּҸ� �Է����� ���� �л��� �̸��� �ּ�, �г�, ����, �ֹι�ȣ�� ����ϼ���.
select name, addr, grade, point, jumin from users where addr is null;
// is null = null ��, �� �����Ͱ� �Էµ��� ���� �����͸� ����ϱ����� ����

// 8) 4�г��� ������ 10%�� �ø� ������ ����ϼ���.(��, ���� �����Ϳ��� �ݿ����� �ʽ��ϴ�.)
select no, name, addr, grade, point*1.1 point, jumin from users;

// 9) ������ ���� �л����� ����ϼ���.(��ȣ, �̸�, �ּ�, ����Ʈ)
select no, name, addr, point from users order by point;
// �������� : ASC(��������)
// �������� : DESC

// 10) �г��� ������������ �����Ͻÿ�.(��, �г��� ���� �� ��� ����Ʈ�� ���� ����� ���� ��µ˴ϴ�.)
select * from users order by grade asc, point desc;
// �켱������ ���� ������ �տ� ��ġ��Ų��.

// 11) ������ �������� -10�� ������ ��� 80�� �̻��� ����� �̸��� ����, ������ ��� ������ ����ϼ���.
select name, point, point-10 revise from users where point-10>=80;
// �ٸ� ����� ���� ������?

// 12) 2�г��� ��� �л��� ����Ͻÿ�.(Į������ �̸�, �ּ�, �г����� ���)
select name �̸�, addr �ּ�, grade �г� from users where grade=2;

// �߰�����
// 13) �л��� �� ����Դϱ�?
select count(*) ���л��� from users;

// 14) 1�г��� �� ����Դϱ�?
select count(*) "1�г�" from users where grade=1;
// �÷� ���� ����+���� �Ǵ� ���⸦ �ϴ� ��� �ֵ���ǥ�� ����Ѵ�.

// 15) ��� �л��� �̸��� �г��� ����Ͻÿ�.(��, �̸��� ��� �ҹ��ڷθ� ����Ͻÿ�.)
select lower(name), grade from users;
// �ҹ��� : lower()
// �빮�� : upper()
// ȥ�� : initcap()

// 16) 2�г� �л��� �̸��� �г��� ����Ͻÿ�. (��, ������ ���� �ּҴ� �� 2���ڸ� ����Ͻÿ�.)
select name, grade, substr(addr, 1, 2) from users;
// substr(�÷��� or '���ڿ�', ���� �ڸ��� N, �߶� ���ڼ� M)

// 17) ��� �л��� ������ ���� �ڸ��� �����Ͻÿ�.(��, �ݿø��� ������, ���� �����Ϳ��� �ݿ����� �ʽ��ϴ�.)
select no, name, addr, trunc(point, -1), grade, jumin from users;
// trunc(�÷���, ���� ����)
// ���� ���� : 1(�Ҽ��� ù°�ڸ�), 2(�Ҽ��� ��°�ڸ�),...
//          : -1(���� �ڸ�), -2(���� �ڸ�),...

// 18) ��� �л��� ������ �ݿø��Ͽ� ����Ͻÿ�.(��, ���� �����Ϳ��� �ݿ����� �ʽ��ϴ�.)
select no, name, addr, round(point, -1), grade, jumin from users;
// round(�÷���, �ݿø� ����)

// 19) 2�г��� ��� ����Դϱ�?
select count(*) "2�г�" from users where grade=2;

// 20) 1�г� �� 80�� �̻��� ����Դϱ�?
select count(*) "80�� �̻� 1�г�" from users where grade=1 and point>=80;

// 21) 3�г��� ����� �����Դϱ�?
select avg(point) "3�г� �������" from users where grade=3;
select avg(nvl(point,0)) "3�г� �������" from users where grade=3;
// avg(�÷���) = �÷��� ������ ���
// nvl(�÷���, ġȯ��) = �÷��� �ش��ϴ� null ���� ġȯ������ ġȯ �� ���
// �׳� avg�� ��� �� ��� null ���� �����ϰ� ����Ѵ�.

// 22) ��ü �л� �� �ְ����� �����Դϱ�?
select max(point) "�ְ���(��ü)" from users;
// max/min = �ְ���/������

// 23) 2�г� �� ���� ���� ������ ȹ���� ������ �����Դϱ�?
select min(point) "������(2�г�)" from users where grade=2;

// level up
// 24) ������ ���ؼ� �ּҸ� ��� ������� �ʰ� ���� �� ���ڸ� ����ϰ� �ڿ� *�� �ϳ� ���δ�.
select no, name, rpad(substr(addr, 1, 2), lengthb(addr), '*') addr, grade, point, jumin from users;
// lpad/rpad (�ۼ��ϰ��� �ϴ� ���ڿ�(A), ����ϰ��� �ϴ� �� ����Ʈ ��(B), A�� ��� ��µǰ� ���� ����Ʈ(B-A)�� ä���� ����)

// 25) �̸��� �� �տ� *�� �� �ڿ��� *�� ������ ����Ѵ�.(��, ���� �����Ϳ��� �ݿ����� �ʽ��ϴ�.)
select no, concat('*',concat(name,'*')), addr, grade, point, jumin from users;

// 26) ��������� �״�� ������� �ʰ�, xx�� xx�� xx�� �������� ����Ѵ�.(��, ������ �����ϸ�, ���� �����Ϳ��� �ݿ����� �ʽ��ϴ�.)
select no, name, addr, grade, point, substr(jumin, 1, 2)||'��'||substr(jumin, 3, 2)||'��'||substr(jumin, 5, 2)||'��' from users;

// 27) �̸�, ����Ʈ, �г�, �������, ������ �߰��Ѵ�. ������ ������Ϸ� �Ǵ��ϸ� ������ ���ڰ� 1�̸� �� 2�̸� ����� ǥ���Ѵ�.

-- alter table users add gender varchar2(2) check (gender in ('��','��'));
-- update users set gender='��' where substr(jumin, length(jumin), 1)=1;
-- update users set gender='��' where substr(jumin, length(jumin), 1)=2;
-- alter table users modify jumin varchar2(12);
-- alter table users rename column jumin to birth;
-- update users set jumin=substr(jumin, 1, 2)||'��'||substr(jumin, 3, 2)||'��'||substr(jumin, 5, 2)||'��';
select name �̸�
    , point ����Ʈ
    , grade �г�
    , substr(jumin, 1, 2)||'��'||substr(jumin, 3, 2)||'��'||substr(jumin, 5, 2)||'��' �������
    , decode(substr(jumin, length(jumin), 1), 1, '��', '��') ����
    from users; 
select * from users;
--drop table users;