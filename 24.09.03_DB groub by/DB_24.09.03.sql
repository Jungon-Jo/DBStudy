// 응용 1. 그룹별 인원수를 출력하되 학년을 오름차순으로 정렬
select grade, count(*) student from users group by grade order by grade;
// 응용 2. 그룹별 최고점과 최저점을 출력하시오
select grade, max(point) highscore, min(point) lowscore from users group by grade;
// 응용 3. 그룹별 최고점을 획득한 사람의 이름은?
select grade, name, max(point) highscore from users group by grade;
-- name은 그룹화 되지 않았음으로 에러가 난다.
-- 함수로 표현되는 출력값은 표현이 되나, 그룹화된 컬럼을 제외한 다른 컬럼명을 직접 입력할 경우 에러가 난다.

// 확인문제 1. 3학년과 4학년 각각 그룹의 인원수를 출력하시오.
select grade, count(*) student from users where grade=3 or grade=4 group by grade;
select grade, count(*) student from users group by grade having grade>=3;
// 확인문제 2. 1학년과 2학년의 최고점과 최저점의 점수 차이를 출력하시오.
select grade, max(point)-min(point) point from users where grade=1 or grade=2 group by grade;
select grade, max(point)-min(point) point from users group by grade having grade<=2;
// 확인문제 3. 주민번호 2자리는 태어난 년도이다. 같은 년도에 태어난 사람을 카운팅하시오.
//            이때 태어난 년도와 인원수로 출력한다.
select substr(jumin, 1, 2) birthYear, count(*) student from users group by substr(jumin, 1, 2) order by substr(jumin, 1, 2);

// 연구과제
/* 그룹을 만들 때, 급룹별 조건을 지정할 수 있다.
*  예를 들어, 그룹의 인원이 3명 이상인 그룹의 인원수를 출력하시오. 라고 했을 때
*  그룹별로 인원을 카운팅 하고, 그룹 중 인원수가 3명 이상인 그룹만 선택해야한다.
*  그룹에 조건을 지정하는 방법은 having이라는 조건절을 group by 뒤에 사용하여,
*  그룹 중 조건을 만족하는 그룹만 선택한다는 의미이다.
*  예시 문제를 풀어보자
*/

// 그룹의 인원이 3명 이상인 그룹의 인원수를 출력하시오
select grade, count(*) student from users group by grade having count(*)>=3; 
// 학년 그룹 평균이 전체 평균보다 높은 그룹의 평균만 출력하시오.
select grade, avg(point) pointAverage from users group by grade having avg(point)>=(select avg(point) from users);
// select grade, avg(point) pointAverage from users group by grade having avg(point)>= 본쿼리
// (select avg(point) from users) 서브쿼리(결과값이 전체 평균으로 결과값을 본쿼리 실행에 사용한다.)
// 서브쿼리는 ()안에 select절을 사용하여 결과값을 활용하는것을 의미한다.(본쿼리의 조건으로 활용이 가능) - where, having
// 서브쿼리가 먼저 계산 된 후 본쿼리가 실행된다.
// 서브쿼리는 본쿼리 안에 함수처럼 리턴값을 사용하고 싶을 때 사용하며, ()를 사용하여 select절을 넣어준다.
// 본쿼리의 테이블로 활용가능 - from
// 본쿼리의 원하는 컬럼에서 활용 가능 - select

// 정리
// select에서 서브쿼리를 활용하면(단일값을 리턴) > 스칼라 서브쿼리(속도가 느려질 수 있어 조심해야 한다.)
// from에서 서브쿼리를 활용하면(테이블을 리턴) > 인라인뷰 서브쿼리
// 인라인뷰 서브쿼리
select m.name, m.addr from (select * from users) m where m.grade=3;
// users 테이블 가상본(램으로 끌고온다)을 만들고 m이라는 이름을 붙인다.
// 가상 테이블 m은 현재 쿼리에서만 적용되며, 다른 select절에서는 사용이 불가능하다.

// 최종 문제
// 그룹별 가장 높은 점수를 획득한 사람의 이름과 점수는?
select name, point from users where point=(select max(point) from users);