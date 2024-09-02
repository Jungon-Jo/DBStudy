// 추가문제
// 1. 모든 사람의 이름과 주민번호를 출력하고 나이를 출력하시오.
select name, jumin, 124-substr(jumin, 1, 2) age from users;

// 2. 모든 사람의 정보를 출력하시오(단, 이름을 마스킹하시오.)
//    (마스킹 방법, abcdef > a*****)
select no, rpad(substr(name, 1, 1), lengthb(name), '*') name, addr, point, grade, jumin from users;

// 3. 모든 사람의 정보를 출력하시오.
//    (1학년은 이름뒤에 *, 2학년은 이름뒤어 %, 3학년은 이름뒤에 #, 4학년은 이름뒤에 !를 추가하여 출력)
select no
    , decode(grade, '1', 'name*', '2', 'name$', '3', 'name#', '4', 'name!', name) name
    , addr
    , grade
    , point
    , jumin
    from users;