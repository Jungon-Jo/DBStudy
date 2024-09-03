// ���� 1. �׷캰 �ο����� ����ϵ� �г��� ������������ ����
select grade, count(*) student from users group by grade order by grade;
// ���� 2. �׷캰 �ְ����� �������� ����Ͻÿ�
select grade, max(point) highscore, min(point) lowscore from users group by grade;
// ���� 3. �׷캰 �ְ����� ȹ���� ����� �̸���?
select grade, name, max(point) highscore from users group by grade;
-- name�� �׷�ȭ ���� �ʾ������� ������ ����.
-- �Լ��� ǥ���Ǵ� ��°��� ǥ���� �ǳ�, �׷�ȭ�� �÷��� ������ �ٸ� �÷����� ���� �Է��� ��� ������ ����.

// Ȯ�ι��� 1. 3�г�� 4�г� ���� �׷��� �ο����� ����Ͻÿ�.
select grade, count(*) student from users where grade=3 or grade=4 group by grade;
select grade, count(*) student from users group by grade having grade>=3;
// Ȯ�ι��� 2. 1�г�� 2�г��� �ְ����� �������� ���� ���̸� ����Ͻÿ�.
select grade, max(point)-min(point) point from users where grade=1 or grade=2 group by grade;
select grade, max(point)-min(point) point from users group by grade having grade<=2;
// Ȯ�ι��� 3. �ֹι�ȣ 2�ڸ��� �¾ �⵵�̴�. ���� �⵵�� �¾ ����� ī�����Ͻÿ�.
//            �̶� �¾ �⵵�� �ο����� ����Ѵ�.
select substr(jumin, 1, 2) birthYear, count(*) student from users group by substr(jumin, 1, 2) order by substr(jumin, 1, 2);

// ��������
/* �׷��� ���� ��, �޷캰 ������ ������ �� �ִ�.
*  ���� ���, �׷��� �ο��� 3�� �̻��� �׷��� �ο����� ����Ͻÿ�. ��� ���� ��
*  �׷캰�� �ο��� ī���� �ϰ�, �׷� �� �ο����� 3�� �̻��� �׷츸 �����ؾ��Ѵ�.
*  �׷쿡 ������ �����ϴ� ����� having�̶�� �������� group by �ڿ� ����Ͽ�,
*  �׷� �� ������ �����ϴ� �׷츸 �����Ѵٴ� �ǹ��̴�.
*  ���� ������ Ǯ���
*/

// �׷��� �ο��� 3�� �̻��� �׷��� �ο����� ����Ͻÿ�
select grade, count(*) student from users group by grade having count(*)>=3; 
// �г� �׷� ����� ��ü ��պ��� ���� �׷��� ��ո� ����Ͻÿ�.
select grade, avg(point) pointAverage from users group by grade having avg(point)>=(select avg(point) from users);
// select grade, avg(point) pointAverage from users group by grade having avg(point)>= ������
// (select avg(point) from users) ��������(�Լ�ó�� ���ϰ��� ����ϰ� ���� �� ����ϸ�, ()�� ����Ͽ� select���� �־��ش�.)
// ���������� ���� ��� �� �� �������� ����ȴ�.