create table hm (
no number(3) primary key,
name varchar2(10) not null,
point number(5) default 0,
addr varchar2(20),
indate TIMESTAMP default sysdate);

insert into hm values (1, 'ȫ�浿', 45, '�����', default);
insert into hm values (2, '������', 50, '����', default);
insert into hm values (3, '������', 43, '����', default);

select * from hm;
select no, name from hm;

select count(*) from hm;

// 1. ��� ����� �̸��� ������ ����Ͻÿ�.
select name, point from hm;

// 2. ������ 50�� ������ ����� �̸��� ������ ����Ͻÿ�.
select name, point from hm where point <= 50;

// 3. ������ 50�� ������ ����� ��� ����ΰ���?
select count(*) from hm where point <= 50;

// 4. ȫ�浿�� ������ �����ΰ���?
select point from hm where name = 'ȫ�浿';

// 5. �������� ��� ������ ����ϼ���.
select * from hm where no = 2;

commit;