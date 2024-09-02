// �߰�����
// 1. ��� ����� �̸��� �ֹι�ȣ�� ����ϰ� ���̸� ����Ͻÿ�.
select name, jumin, 124-substr(jumin, 1, 2) age from users;

// 2. ��� ����� ������ ����Ͻÿ�(��, �̸��� ����ŷ�Ͻÿ�.)
//    (����ŷ ���, abcdef > a*****)
select no, rpad(substr(name, 1, 1), lengthb(name), '*') name, addr, point, grade, jumin from users;

// 3. ��� ����� ������ ����Ͻÿ�.
//    (1�г��� �̸��ڿ� *, 2�г��� �̸��ھ� %, 3�г��� �̸��ڿ� #, 4�г��� �̸��ڿ� !�� �߰��Ͽ� ���)
select no
    , decode(grade, '1', 'name*', '2', 'name$', '3', 'name#', '4', 'name!', name) name
    , addr
    , grade
    , point
    , jumin
    from users;