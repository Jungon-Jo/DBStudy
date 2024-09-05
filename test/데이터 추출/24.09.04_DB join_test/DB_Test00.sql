drop table users;
drop table carinfo;

create table users(
id varchar2(8), 
name varchar2(10), 
addr varchar2(10));

create table carinfo(
c_num varchar2(4),   --�ڵ��� ��ȣ
c_name varchar2(10),  -- �ڵ��� ����
id varchar2(8));

create table companycar(     -- �ڵ��� ����
c_num varchar2(4),   -- ����ȣ
c_com varchar2(30), 
c_name varchar2(10),  -- ���̸�
c_price number);  -- �� ����

insert into users values ('1111','kim','����');
insert into users values ('2222','lee','����');
insert into users values ('3333','park','����');
insert into users values ('4444','choi','����');

insert into carinfo values ('1234','����','1111');
insert into carinfo values ('3344','����','1111');
insert into carinfo values ('5566','����','3333');
insert into carinfo values ('6677','����','3333');
insert into carinfo values ('7788','����','4444');
insert into carinfo values ('8888','����','5555');

insert into companycar values ('1234','����','�ҳ�Ÿ',1000);
insert into companycar values ('3344','���','����',2000);
insert into companycar values ('7788','���','��2',800);
insert into companycar values ('9900','����','�׷���',2100);

-- �� �ڷḦ ȸ���� ����� �ڵ��� �����̴�.
// 1. ȸ���� �̸��� �ּҸ� ����Ͻÿ�.
select name, addr from users;
-- �̸��� users �ּҵ� users ���̺� �ִ�/join�� �ʿ����.

// 2. ȸ���� �̸��� ������ �ڵ��� ��ȣ�� ����Ͻÿ�.
select u.name, ci.c_num from users u, carinfo ci where u.id=ci.id;
-- �̸� users; �ڵ��� ��ȣ carinfo; ȸ���� ������ �ڵ��� : inner join(id)

// 3. �ڵ��� ��ȣ�� 7788�� �������� �̸��� �ּҸ� ����Ͻÿ�.
--> 1. ������ �ؼ� �������� 7788�� �ڵ����� �������� ������ ��� > join
select u.name, u.addr from users u, carinfo ci where u.id=ci.id and ci.c_num='7788';
--> 7788�������� ȸ�� ���̵� �˻� �� �� ������� �� ������ ���� > sub query
select name, addr from users where id=(select id from carinfo where c_num='7788');
--> ������ �޶���
select u.name, u.addr from users u, carinfo ci where ci.c_num='7788' and u.id=ci.id;

// 4. �ڵ����� �������� ���� ����� �̸��� �ּҸ� ����Ͻÿ�.
select u.name, u.addr from users u left outer join carinfo ci on u.id=ci.id where ci.c_num is null;
-- �̸��� �ּҴ� users
-- �ڵ����� �������� ���� ����̶�� ���� �� carinfo ���̺��� �����غ����ϰ� inner/outer join �� �����ؼ� ����ؾ��Ѵ�.
select u.* from users u left outer join carinfo ci on u.id=ci.id where c_name is null;
select u.name, u.addr from users u left outer join carinfo ci on u.id=ci.id where c_name is null;
select u.name, u.addr from users u, carinfo ci where u.id=ci.id(+) and  c_name is null;

// 5. ȸ���� ����� �ڵ��� ���� ����Ͻÿ�.
select u.name, a.������ from users u, (select id, count(*) ������ from carinfo group by id) a where u.id=a.id;
-- ���������� ������� ���̺��� from ���� �־� ������� ���̺��� ���
-- ȸ���� ����, users �����δ� ȸ���� �ڵ����� �� �� ������ users�� carinfo ���̺��� join�Ѵ�.
-- inner join �� ȸ������ �׷��� ����� ī������ ����
select u.*, ci.* from users u, carinfo ci where u.id=ci.id;
-- ���� 2���� �� ������ u.namedl �ƴ� u.id�� ����
select u.name, count(*) from users u, carinfo ci where u.id=ci.id group by u.name, ci.id;   
--> ���� 2�� �� �� �����Ƿ� id�� �׷� �������� ���
select u.name, count(*) from users u, carinfo ci where u.id=ci.id group by u.name, ci.id;
select u.name, count(*) from users u, carinfo ci where u.id=ci.id group by (u.name, ci.id);
--> �ΰ��� �Ӽ��� �ϳ��� ���ڴٶ�� �ǹ�

// 6. 2�� �̻��� ������ ȸ���� �̸��� ������ �ڵ��� ���� ����Ͻÿ�.
select u.name, a.������ from users u, (select id, count(*) ������ from carinfo group by id) a where u.id=a.id and a.������>=2;

// 7. �ڵ����� ��ϵǾ� �ִµ� �����ڰ� ���� �ڵ��� ��ȣ�� ����Ͻÿ�.
select ci.c_num from users u right outer join carinfo ci on u.id=ci.id where u.name is null;
--> ��, ���� ���� ���̺�� ���߿� ���� ���̺��� ������ ���
--> ���� ���� ���̺��� carinfo, �ι�°�� ���� ���̺� users

-- ���� ���ʹ� 3�� ���̺��� �����ϴ� �����Դϴ�.
-- companycar ȸ�翡�� ������ �ڵ����� �ǹ�, 
-- carinfo�� �������� ������ �ڵ���
// 8. ���� �ڵ����� ����ȣ, ������, �ڵ�����, ������ ����Ͻÿ�.
select ci.c_num, co.c_com, co.c_name, co.c_price from carinfo ci, companycar co where ci.c_num=co.c_num;

// 9. ȸ�翡�����Ŵ� �Ͽ����� �������� ���� �ڵ����� ����ȣ, ������, �ڵ��� �̸��� ���
select co.c_num, co.c_com, co.c_name from carinfo ci right outer join companycar co on ci.c_num=co.c_num where ci.c_num is null;

// 10. �ڵ��� ������ 1000���� �̻��� �ڵ����� �ڵ��� ��ȣ�� ����Ͻÿ�.
select c_num from companycar where c_price>=1000;

// 11. ������ �ڵ��� �߿� ȸ�翡�� ������ �ڵ����� �ƴ� �ڵ��� ��ȣ�� ����Ͻÿ�.
select ci.c_num from carinfo ci left outer join companycar co on ci.c_num=co.c_num where co.c_num is null;
select ci.*, co.* from carinfo ci left outer join companycar co on ci.c_num=co.c_num where co.c_num is null;
select ci.c_num from carinfo ci, companycar co where ci.c_num!=co.c_num;
select ci.*, co.* from carinfo ci left outer join companycar co on ci.c_num=co.c_num;

// 12. ��� ����� ������ ����Ͻÿ�. �̸�, �������� �ڵ�����ȣ, �ڵ����̸�
select u.name, ci.c_num, co.c_name
    from users u
    left outer join carinfo ci on u.id=ci.id
    left outer join companycar co on ci.c_num=co.c_num;
-- 3�� �̻��� ���̺� outer join�� �����ϴ�.
-- (left/right) outer join [���̺��] on [�������� ������ ����� �÷����� �����)

--> ���� ���̺��� users, carinfo, companycar
--> users.name carinfo.c_num companycar.c_name
--> �� ���̺� 3���� join, ������ ���ϰ� ������� 2���� join
--> ���� join�� �� ���̺�� ���� ���̺� join

// ����
/* ���̺��� ������ �ߺ��� �ּ�ȭ �ϱ����� ����ȭ �Ǿ�� �ϰ�,
*  ����ȭ�� ���̺��� �и��ϴ� �ǹ̰� �ִ�.
*  �׷���, ���񽺸� �̿��ϴ� �����忡���� 2�� �̻��� ���̺��� join�Ǿ�� �ϴ� ��찡 �ִ�.
*  �׷��� ����ȭ�� �������� �����̰�, join�� ���񽺸� �����ϴ� ������ ����̴�.
*  2�� �̻��� ���̺��� join�Ǿ�� �ϴ� ���񽺴� ���񽺰� �̿�ɶ� ���� db�� join ������ ����ؾ��ϰ� ������ ����������.
*  �� �����ϰ� ��� �� ����� ������?
*  �ذ�å�� �������� ���̺��� �����ϵ�, ���� ����� ��ģ ���� ���̺��� ����� ���̴�. ������ ���̺��� �������� ���̺��� ������� ��������ִ�.
*  �̷� ������ ���̺��� ���� �Ѵ�.
*/

// 12���� ���񽺸� �����ϱ� ���� view ����(�÷� �� ���� �ʼ�)
create view all_users as(
select u.name name, NVL(ci.c_num,'����') carnum, NVL(co.c_name,'����') carname
    from users u
    left outer join carinfo ci on u.id=ci.id
    left outer join companycar co on ci.c_num=co.c_num);

select * from all_users;

select name, carnum, carname from all_users;

// view�� ���� �̷������� insert, delete, update�� ���������� ���̺� ���Ἲ �������ǿ� ����Ǿ�� �ȵȴ�.
// �̷� ������ view�� ��ȸ�������� ���� ����Ѵ�.


