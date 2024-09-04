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

/*  join → 정의 : 한개 이상의 테이블을 논리적으로 합치는 것
	
	table이 나눠지는게 좋은 이유 :
	중복을 최소화 시키기 위해(중복이 많아질수록 데이터의 무결성이 깨지게 된다.) 정규화(데이터를 나누는) 과정이 필요하다.
	데이터 중복이 일어나지 않는 경우 정규화(erd가 정규화(데이터 중복을 찾기위해)의 일환이다.)를 할 필요는 없어진다.

	student				score
	no	name	tel		sno	subject	point
	1	홍	1111		1	java	70
	2	길	2222		1	html	80
	3	이	3333		3	java	90

	- select a.name, b.subject, b.point from student a, score b;
	→ full join
	→ 현업에서 절대 사용해서는 안된다.
	→ student의 튜플 하나가 score의 모든 튜플을 비교
	→ N*M의 갯수만큼 튜플 생성(튜플 3개 X 튜플 3개 = 9개의 튜플 생성)

	- select a.name, b.subject, b.point from student a, score b where a.no=b.sno;
	→ inner join
	→ 조건을 입력하여 참이 되는 경우의 튜플만 생성하게 된다.
	→ 동등 inner join(==), 비동등 inner join(!=)
    → 튜플 1개 X 튜플 2개 = 2개의 튜플 생성
    
    - select a.name, b.e_name, b.e_point from stu a left outer join pp b on a.no=b.no;
	→ outer join
	→ inner join + join 되지 않은 테이블의 튜플까지 생성
	→ 기준이 되는 테이블의 모든 튜플을 생성하고 이에 해당하는 대상 테이블 튜플의 값을 가져온다.
    → left outer join : 왼쪽 테이블이 기준
    → right outer join : 오른쪽 테이블이 기준
*/
select a.no, a.name, b.no, b.e_name, b.e_point from stu a, pp b;
select a.no, a.name, b.no, b.e_name, b.e_point from stu a, pp b where a.no=b.no;
select a.no, a.name, b.no, b.e_name, b.e_point from stu a, pp b where a.no!=b.no;

-- 시험을 본 학생들의 이름과 과목과 점수를 출력하시오.
-- 2개의 테이블을 합쳐야 한다.(join, 동일 column을 합치므로 inner join)
select a.name, b.e_name, b.e_point
    from stu a, pp b
    where a.no=b.no;
-- 홍길동의 이름과 과목과 점수를 출력하시오.
select a.name, b.e_name, b.e_point
    from stu a, pp b
    where a.no=b.no and a.name='hong';
-- 시험을 치루지 않은 학생들의 이름을 출력하시오.
-- inner join에 참여하지 않은 튜플의 정보이므로 아우터 조인 사용
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
