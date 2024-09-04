create table stu(
no number,
name varchar2(5 char),
tel varchar2(13)
);

create table pp(
no number,
e_name varchar2(4),
e_point number(3)
);

insert into stu values (1, 'hong', '1111');
insert into stu values (2, 'kim', '2222');
insert into stu values (3, 'lee', '3333');

insert into pp values (1, 'java', 70);
insert into pp values (1, 'html', 90);
insert into pp values (3, 'java', 80);

commit;

/*  join �� ���� : �Ѱ� �̻��� ���̺��� �������� ��ġ�� ��
	
	table�� �������°� ���� ���� :
	�ߺ��� �ּ�ȭ ��Ű�� ����(�ߺ��� ���������� �������� ���Ἲ�� ������ �ȴ�.) ����ȭ(�����͸� ������) ������ �ʿ��ϴ�.
	������ �ߺ��� �Ͼ�� �ʴ� ��� ����ȭ(erd�� ����ȭ(������ �ߺ��� ã������)�� ��ȯ�̴�.)�� �� �ʿ�� ��������.

	student				score
	no	name	tel		sno	subject	point
	1	ȫ	1111		1	java	70
	2	��	2222		1	html	80
	3	��	3333		3	java	90

	- select a.name, b.subject, b.point from student a, score b;
	�� full join
	�� �������� ���� ����ؼ��� �ȵȴ�.
	�� student�� Ʃ�� �ϳ��� score�� ��� Ʃ���� ��
	�� N*M�� ������ŭ Ʃ�� ����(Ʃ�� 3�� X Ʃ�� 3�� = 9���� Ʃ�� ����)

	- select a.name, b.subject, b.point from student a, score b where a.no=b.sno;
	�� inner join
	�� ������ �Է��Ͽ� ���� �Ǵ� ����� Ʃ�ø� �����ϰ� �ȴ�.
	�� ���� inner join(==), �񵿵� inner join(!=)
    �� Ʃ�� 1�� X Ʃ�� 2�� = 2���� Ʃ�� ����
    
    - select a.name, b.e_name, b.e_point from stu a left outer join pp b on a.no=b.no;
	�� outer join
	�� inner join + join ���� ���� ���̺��� Ʃ�ñ��� ����
	�� ������ �Ǵ� ���̺��� ��� Ʃ���� �����ϰ� �̿� �ش��ϴ� ��� ���̺� Ʃ���� ���� �����´�.
    �� left outer join : ���� ���̺��� ����
    �� right outer join : ������ ���̺��� ����
*/
select a.no, a.name, b.no, b.e_name, b.e_point from stu a, pp b;
select a.no, a.name, b.no, b.e_name, b.e_point from stu a, pp b where a.no=b.no;
select a.no, a.name, b.no, b.e_name, b.e_point from stu a, pp b where a.no!=b.no;

-- ������ �� �л����� �̸��� ����� ������ ����Ͻÿ�.
-- 2���� ���̺��� ���ľ� �Ѵ�.(join, ���� column�� ��ġ�Ƿ� inner join)
select a.name, b.e_name, b.e_point
    from stu a, pp b
    where a.no=b.no;
-- ȫ�浿�� �̸��� ����� ������ ����Ͻÿ�.
select a.name, b.e_name, b.e_point
    from stu a, pp b
    where a.no=b.no and a.name='hong';
-- ������ ġ���� ���� �л����� �̸��� ����Ͻÿ�.
-- inner join�� �������� ���� Ʃ���� �����̹Ƿ� �ƿ��� ���� ���
-- 1.  left outer join
select a.name, b.e_name, b.e_point
    from stu a
    left outer join pp b
    on a.no=b.no
    where b.no is null;
    
select a.name, b.e_name, b.e_point
    from stu a
    left outer join pp b
    on a.no=b.no;
