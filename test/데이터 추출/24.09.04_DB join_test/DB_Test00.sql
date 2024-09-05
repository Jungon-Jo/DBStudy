drop table users;
drop table carinfo;

create table users(
id varchar2(8), 
name varchar2(10), 
addr varchar2(10));

create table carinfo(
c_num varchar2(4),   --자동차 번호
c_name varchar2(10),  -- 자동차 종류
id varchar2(8));

create table companycar(     -- 자동차 정보
c_num varchar2(4),   -- 차번호
c_com varchar2(30), 
c_name varchar2(10),  -- 차이름
c_price number);  -- 차 가격

insert into users values ('1111','kim','수원');
insert into users values ('2222','lee','서울');
insert into users values ('3333','park','대전');
insert into users values ('4444','choi','대전');

insert into carinfo values ('1234','중형','1111');
insert into carinfo values ('3344','소형','1111');
insert into carinfo values ('5566','중형','3333');
insert into carinfo values ('6677','중형','3333');
insert into carinfo values ('7788','중형','4444');
insert into carinfo values ('8888','중형','5555');

insert into companycar values ('1234','현다','소나타',1000);
insert into companycar values ('3344','기와','축제',2000);
insert into companycar values ('7788','기와','레2',800);
insert into companycar values ('9900','현다','그랭저',2100);

-- 위 자료를 회원이 등록한 자동차 정보이다.
// 1. 회원의 이름과 주소를 출력하시오.
select name, addr from users;
-- 이름은 users 주소도 users 테이블에 있다/join이 필요없다.

// 2. 회원의 이름과 소유한 자동차 번호를 출력하시오.
select u.name, ci.c_num from users u, carinfo ci where u.id=ci.id;
-- 이름 users; 자동차 번호 carinfo; 회원이 소유한 자동차 : inner join(id)

// 3. 자동차 번호가 7788인 소유자의 이름과 주소를 출력하시오.
--> 1. 조인을 해서 조건절로 7788인 자동차의 소유자의 정보를 출력 > join
select u.name, u.addr from users u, carinfo ci where u.id=ci.id and ci.c_num='7788';
--> 7788소유자의 회원 아이디를 검색 한 후 결과값을 본 쿼리의 조건 > sub query
select name, addr from users where id=(select id from carinfo where c_num='7788');
--> 순서가 달라짐
select u.name, u.addr from users u, carinfo ci where ci.c_num='7788' and u.id=ci.id;

// 4. 자동차를 소유하지 않은 사람의 이름과 주소를 출력하시오.
select u.name, u.addr from users u left outer join carinfo ci on u.id=ci.id where ci.c_num is null;
-- 이름과 주소는 users
-- 자동차를 소유하지 않은 사람이라는 조건 → carinfo 테이블을 참조해봐야하고 inner/outer join 중 선택해서 사용해아한다.
select u.* from users u left outer join carinfo ci on u.id=ci.id where c_name is null;
select u.name, u.addr from users u left outer join carinfo ci on u.id=ci.id where c_name is null;
select u.name, u.addr from users u, carinfo ci where u.id=ci.id(+) and  c_name is null;

// 5. 회원별 등록한 자동차 수를 출력하시오.
select u.name, a.차량수 from users u, (select id, count(*) 차량수 from carinfo group by id) a where u.id=a.id;
-- 서브쿼리로 만들어진 테이블을 from 절에 넣어 만들어진 테이블을 사용
-- 회원별 집계, users 만으로는 회원의 자동차를 알 수 없으니 users와 carinfo 테이블을 join한다.
-- inner join 후 회원으로 그룹을 만들고 카운팅을 집계
select u.*, ci.* from users u, carinfo ci where u.id=ci.id;
-- 동명 2인일 수 있으니 u.namedl 아닌 u.id로 집계
select u.name, count(*) from users u, carinfo ci where u.id=ci.id group by u.name, ci.id;   
--> 동명 2인 일 수 있으므로 id를 그룹 조건으로 사용
select u.name, count(*) from users u, carinfo ci where u.id=ci.id group by u.name, ci.id;
select u.name, count(*) from users u, carinfo ci where u.id=ci.id group by (u.name, ci.id);
--> 두개의 속성을 하나로 보겠다라는 의미

// 6. 2대 이상을 소유한 회원의 이름과 소유한 자동차 수를 출력하시오.
select u.name, a.차량수 from users u, (select id, count(*) 차량수 from carinfo group by id) a where u.id=a.id and a.차량수>=2;

// 7. 자동차는 등록되어 있는데 소유자가 없는 자동차 번호를 출력하시오.
select ci.c_num from users u right outer join carinfo ci on u.id=ci.id where u.name is null;
--> 팁, 먼저 보는 테이블과 나중에 보는 테이블의 순서를 기억
--> 먼저 보는 테이블은 carinfo, 두번째로 보는 테이블 users

-- 다음 부터는 3개 테이블을 조인하는 문제입니다.
-- companycar 회사에서 구매한 자동차를 의미, 
-- carinfo는 직원에게 배정한 자동차
// 8. 배정 자동차의 차번호, 제조사, 자동차명, 가격을 출력하시오.
select ci.c_num, co.c_com, co.c_name, co.c_price from carinfo ci, companycar co where ci.c_num=co.c_num;

// 9. 회사에서구매는 하였지만 배정되지 않은 자동차의 차번호, 제조자, 자동차 이름을 출력
select co.c_num, co.c_com, co.c_name from carinfo ci right outer join companycar co on ci.c_num=co.c_num where ci.c_num is null;

// 10. 자동차 가격이 1000만원 이상인 자동차의 자동차 번호를 출력하시오.
select c_num from companycar where c_price>=1000;

// 11. 배정된 자동차 중에 회사에서 구매한 자동차가 아닌 자동차 번호를 출력하시오.
select ci.c_num from carinfo ci left outer join companycar co on ci.c_num=co.c_num where co.c_num is null;
select ci.*, co.* from carinfo ci left outer join companycar co on ci.c_num=co.c_num where co.c_num is null;
select ci.c_num from carinfo ci, companycar co where ci.c_num!=co.c_num;
select ci.*, co.* from carinfo ci left outer join companycar co on ci.c_num=co.c_num;

// 12. 모든 사람의 정보를 출력하시오. 이름, 배정받은 자동차번호, 자동차이름
select u.name, ci.c_num, co.c_name
    from users u
    left outer join carinfo ci on u.id=ci.id
    left outer join companycar co on ci.c_num=co.c_num;
-- 3개 이상의 테이블도 outer join이 가능하다.
-- (left/right) outer join [테이블명] on [데이터의 내용이 공통된 컬럼들의 동등식)

--> 관련 테이블은 users, carinfo, companycar
--> users.name carinfo.c_num companycar.c_name
--> 즉 테이블 3개를 join, 순서를 정하고 순서대로 2개씩 join
--> 먼저 join된 논리 테이블과 다음 테이블 join

// 고찰
/* 테이블은 데이터 중복을 최소화 하기위해 정규화 되어야 하고,
*  정규화는 테이블을 분리하는 의미가 있다.
*  그런데, 서비스를 이용하는 고객입장에서는 2개 이상의 테이블이 join되어야 하는 경우가 있다.
*  그래서 정규화는 설계자의 입장이고, join은 서비스를 제공하는 입장의 기술이다.
*  2개 이상의 테이블이 join되어야 하는 서비스는 서비스가 이용될때 마다 db가 join 연선을 계속해야하고 쿼리도 복잡해진다.
*  → 간단하게 사용 할 방법이 없을까?
*  해결책은 물리적인 테이블은 유지하되, 조인 결과를 합친 논리적 테이블을 만드는 것이다. 논리적인 테이블은 물리적인 테이블의 데이토로 만들어져있다.
*  이런 논리적인 테이블을 뷰라고 한다.
*/

// 12번의 서비스를 제공하기 위해 view 생성(컬럼 명 지정 필수)
create view all_users as(
select u.name name, NVL(ci.c_num,'없음') carnum, NVL(co.c_name,'없음') carname
    from users u
    left outer join carinfo ci on u.id=ci.id
    left outer join companycar co on ci.c_num=co.c_num);

select * from all_users;

select name, carnum, carname from all_users;

// view를 통해 이론적으로 insert, delete, update가 가능하지만 테이블 무결성 제약조건에 위배되어서는 안된다.
// 이런 점에서 view는 조회목적으로 많이 사용한다.


