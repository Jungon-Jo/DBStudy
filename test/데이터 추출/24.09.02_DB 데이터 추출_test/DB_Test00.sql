// 1. 테이블 만들기
create table users(
no int primary key,
name varchar2(10),
addr varchar2(10),
point number,
grade varchar2(1),
jumin varchar2(8));

// 2. 테이블에 튜플 삽입
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
// 3. 문제풀기
// 기본문제
// 1) 모든 사람들의 이름과 점수와 생년월일을 검색하시오.
select name, point, jumin from users;

// 2) 80점 이상의 사람의 이름과 주소, 점수를 검색하시오.
select name, addr, point from users where point>=80;

// 3) 이름이 kim으로 시작되는 사람의 이름과 주소를 검색하시오.
select name, addr from users where name like 'kim%';
// kim% = kim~~~~인 값을 의미

// 4) 현재 점수에서 +10으로 보정한 점수를 출력하시오.(단, 원본 데이터에는 반영되지 않습니다.)
select no, name, addr, point+10 point, grade, jumin from users;

// 5) 1학년의 점수를 +1점씩 올려서 출력하세요.
select no, name, addr, point+1 point, grade, jumin from users where grade=1;

// 6) B등급을 획득한 사람의 이름, 주소, 점수를 출력하세요.(B등급 80점 이상 90점 미만입니다.)
select name, addr, point from users where point>=80 and point<90;
// and = 두 조건을 모두 충족시켜라

// 7) 쿼리 결과 중 NULL은 실제 입력하지 않은 값입니다.
//    주소를 입력하지 않은 학생의 이름과 주소, 학년, 점수, 주민번호를 출력하세요.
select name, addr, grade, point, jumin from users where addr is null;
// is null = null 값, 즉 데이터가 입력되지 않은 데이터를 출력하기위한 조건

// 8) 4학년의 점수를 10%로 올린 점수를 계산하세요.(단, 원본 데이터에는 반영되지 않습니다.)
select no, name, addr, grade, point*1.1 point, jumin from users;

// 9) 점수가 낮은 학생부터 출력하세요.(번호, 이름, 주소, 포인트)
select no, name, addr, point from users order by point;
// 오름차순 : ASC(생략가능)
// 내림차순 : DESC

// 10) 학년을 오름차순으로 정렬하시오.(단, 학년이 동일 할 경우 포인트가 높은 사람이 먼저 출력됩니다.)
select * from users order by grade asc, point desc;
// 우선순위가 높은 정렬을 앞에 배치시킨다.

// 11) 현재의 점수에서 -10을 보정한 결과 80점 이상인 사람의 이름과 점수, 보정한 결과 점수를 출력하세요.
select name, point, point-10 revise from users where point-10>=80;
// 다른 방법이 있지 않을까?

// 12) 2학년의 모든 학생을 출력하시오.(칼럼명을 이름, 주소, 학년으로 출력)
select name 이름, addr 주소, grade 학년 from users where grade=2;

// 추가문제
// 13) 학생은 총 몇명입니까?
select count(*) 총학생수 from users;

// 14) 1학년은 총 몇명입니까?
select count(*) "1학년" from users where grade=1;
// 컬럼 명을 숫자+글자 또는 띄어쓰기를 하는 경우 쌍따옴표를 사용한다.

// 15) 모든 학생의 이름과 학년을 출력하시오.(단, 이름은 모두 소문자로만 출력하시오.)
select lower(name), grade from users;
// 소문자 : lower()
// 대문자 : upper()
// 혼합 : initcap()

// 16) 2학년 학생의 이름과 학년을 출력하시오. (단, 보안을 위해 주소는 앞 2굴자만 출력하시오.)
select name, grade, substr(addr, 1, 2) from users;
// substr(컬럼명 or '문자열', 기준 자릿수 N, 잘라낼 문자수 M)

// 17) 모든 학생의 점수의 일의 자리는 절삭하시오.(단, 반올림은 없으며, 원본 데이터에는 반영되지 않습니다.)
select no, name, addr, trunc(point, -1), grade, jumin from users;
// trunc(컬럼명, 절사 단위)
// 절사 단위 : 1(소수점 첫째자리), 2(소수점 둘째자리),...
//          : -1(일의 자리), -2(십의 자리),...

// 18) 모든 학생의 점수를 반올림하여 출력하시오.(단, 원본 데이터에는 반영되지 않습니다.)
select no, name, addr, round(point, -1), grade, jumin from users;
// round(컬럼명, 반올림 단위)

// 19) 2학년은 모두 몇명입니까?
select count(*) "2학년" from users where grade=2;

// 20) 1학년 중 80점 이상은 몇명입니까?
select count(*) "80점 이상 1학년" from users where grade=1 and point>=80;

// 21) 3학년의 평균은 몇점입니까?
select avg(point) "3학년 평균점수" from users where grade=3;
select avg(nvl(point,0)) "3학년 평균점수" from users where grade=3;
// avg(컬럼명) = 컬럼명 값들의 평균
// nvl(컬럼명, 치환값) = 컬럼명에 해당하는 null 값을 치환값으로 치환 후 계산
// 그냥 avg를 사용 할 경우 null 값을 제외하고 계산한다.

// 22) 전체 학생 중 최고점은 몇점입니까?
select max(point) "최고점(전체)" from users;
// max/min = 최고점/최저점

// 23) 2학년 중 가장 낮은 점수를 획득한 점수는 몇점입니까?
select min(point) "최저점(2학년)" from users where grade=2;

// level up
// 24) 보안을 위해서 주소를 모두 출력하지 않고 앞의 세 글자만 출력하고 뒤에 *를 하나 붙인다.
select no, name, rpad(substr(addr, 1, 2), lengthb(addr), '*') addr, grade, point, jumin from users;
// lpad/rpad (작성하고자 하는 문자열(A), 출력하고자 하는 총 바이트 수(B), A가 모두 출력되고 남은 바이트(B-A)를 채워줄 문자)

// 25) 이름의 맨 앞에 *를 맨 뒤에도 *를 붙혀서 출력한다.(단, 원본 데이터에는 반영되지 않습니다.)
select no, concat('*',concat(name,'*')), addr, grade, point, jumin from users;

// 26) 생년월일을 그대로 출력하지 않고, xx년 xx월 xx일 형식으로 출력한다.(단, 성별은 무시하며, 원본 데이터에는 반영되지 않습니다.)
select no, name, addr, grade, point, substr(jumin, 1, 2)||'년'||substr(jumin, 3, 2)||'월'||substr(jumin, 5, 2)||'일' from users;

// 27) 이름, 포인트, 학년, 생년월일, 성별을 추가한다. 성별은 생년월일로 판단하며 마지막 숫자가 1이면 남 2이면 여라고 표시한다.

-- alter table users add gender varchar2(2) check (gender in ('남','여'));
-- update users set gender='남' where substr(jumin, length(jumin), 1)=1;
-- update users set gender='여' where substr(jumin, length(jumin), 1)=2;
-- alter table users modify jumin varchar2(12);
-- alter table users rename column jumin to birth;
-- update users set jumin=substr(jumin, 1, 2)||'년'||substr(jumin, 3, 2)||'월'||substr(jumin, 5, 2)||'일';
select name 이름
    , point 포인트
    , grade 학년
    , substr(jumin, 1, 2)||'년'||substr(jumin, 3, 2)||'월'||substr(jumin, 5, 2)||'일' 생년월일
    , decode(substr(jumin, length(jumin), 1), 1, '남', '여') 성별
    from users; 
select * from users;
--drop table users;