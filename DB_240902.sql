create table hm (
no number(3) primary key,
name varchar2(10) not null,
point number(5) default 0,
addr varchar2(20),
indate TIMESTAMP default sysdate);

insert into hm values (1, '홍길동', 45, '서울시', default);
insert into hm values (2, '일지매', 50, '수원', default);
insert into hm values (3, '이지매', 43, '서울', default);

select * from hm;
select no, name from hm;

select count(*) from hm;

// 1. 모든 사람의 이름과 점수만 출력하시오.
select name, point from hm;

// 2. 점수가 50점 이하인 사람의 이름과 점수를 출력하시오.
select name, point from hm where point <= 50;

// 3. 점수가 50점 이하인 사람은 모두 몇명인가요?
select count(*) from hm where point <= 50;

// 4. 홍길동의 점수는 몇점인가요?
select point from hm where name = '홍길동';

// 5. 일지매의 모든 정보를 출력하세요.
select * from hm where no = 2;

commit;