# DBstudy
# 1. 테이블 설계
 ## 테이블 관리 용어
relation

attribute

## 테이블 설계 과정
1. 개념적 설계(ERD)
 
2. 논리적 설계(테이블 명세서/정의서)

3. 물리적 설계(쿼리문)

### 1. 개념적 설계(ERD)
정의 및 사용 : 개체 관계도, 데이터 구축 전 개체간의 관계를 도식화한 것으로 

	      이러한 과정을 거치는 이유는 데이터간 중복성을 최소화(정규화)하여 무결성의 원칙을 해치지 않기 위함이다.

- E(Entity) : 개체, 독립적으로 존재할 수 있는 대상(네모로 표시하며, 동그라미는 개체의 속성을 표시할 때 사용)
 
- R(Relationship) : 관계, 개체간의 관계성을 가질 수 있는 것(마름모로 표시, 1:1, 1:N, N:M 의 관계)
 
- D(Diagram) : 표현, 개체와 개체간의 관계성을 시각적으로 표현(관계성을 가진 개체 사이는 선으로 표시하며, 선 위에 과계를 써준다.

Ex)
<img width="100%" src="https://github.com/user-attachments/assets/15bcbbc7-5132-4e43-baba-4452ad1325ab">
- 1:1 = 양쪽 개체에 +-- 형태로 선을 그어준다.

- 1:N = 1에 해당하는 개체는 +--, N에 해당하는 개체는 --← 형태로 선을 그어준다.

- N:M = 양쪽 개체에 --← 형태로 선을 그어준다.

* 네모나 동그라미 등 형태는 반드시 지켜질 필요는 없으나, 내용이 빠져서는 안된다.

### 2. 논리적 설계(테이블 명세서/정의서)
<hr>

# 2. CRUD

## C_데이터 입력
insert 절의 정의 : 데이터베이스에 원하는 데이터를 입력

### 기본 사용 코드
insert into [table_name] values ([column1], [column2], [column3], ...)

## R_데이터 출력
select 절의 정의 : 데이터베이스에 저장된 데이터를 조회(원하는 테이블에서 원하는 튜플 및 컬럼을 선택하여 추출)

### 기본 사용 코드
select [column1], [column2], [column3], ... from [table_name] (where [조건]) (group by [분류 조건]) (order by [정렬 조건]);

a. select : 화면에 출력과 관련된 코드/count(*), sum([테이블 명]), ...

b. from : 출력하고자 하는 테이블을 선택할때 사용하는 코드/from [테이블 명]

c. where : 튜플(행)을 선정할때 사용하는 코드(각종 조건(참과 거짓으로 구분되는 것)을 활용)/where [컬럼 명] or [함수 및 수식 값] >= 0

d. group by : 그룹별 통계를 내야할 때 사용하며 튜플을 선정과는 무관/group by [컬럼 명]

e. order by : 정렬(내림차순, 오름차순 등)이 필요할 때 사용/order by [컬럼 명] asc(오름차순, default 값으로 써주지 않아도 적용), desc(내림차순)

f. join : 2개 이상의 테이블을 논리적으로 합치는 것

* join의 사용법
  	1. full join :	select a.name, b.subject, b.point from student a, score b;

			→ 현업에서는 절대 사용해서는 안되는 방법

			→ studentd(n개의 행)의 튜플 하나가 score(m개의 행)의 모든 튜플을 비교(n x m 만큼의 튜플이 만들어진다.)

  	2. inner join :	select a.name, b.subject, b.point from student a, score b where a.id=b.id;

			→ where 절에 조건을 입력하여 참이 되는 경우만 튜플을 생성

			→ 동등 inner join(==), 비동등 inner join(!=)
  
  	3. outer join : select a.name, b.subject, b.point from student a left outer join score b on a.id=b.id;

  			→ inner join에서 생성되지 않는 테이블의 튜플까지 생성하는것이 목적

			→ 기준 테이블의 모든 튜플을 생성하고 이에 해당되는 대상 테이블의 튜플 값을 가져온다.

			→ 3개 이상의 테이블도 적용 가능

				from [table_name_1] a

					left/right outer join [table_name_2] b on a.id=b.id

				     	left/right outer join [table_name_3] c on b.num=c.num;
 

			→ left outer join : 왼쪽 테이블 기준

			  right outer join : 오른쪽 테이블 기준

			→ code이 외에 (+)를 활용하여 간소화 하여 사용 가능

### 사용 순서
a → b → (c → d → e)

### 사고의 흐름
<strong>b → c → d → a → e</strong>

 → b. 어떤 테이블에서 데이터를 가져올꺼야?(from)
 
 → c. 어떤 조건의 튜플을 가져올꺼야?(where)
 
 → d. 어떤 기준으로 그룹을 묶을거야(group by)
 
 → a. 가져온 튜플에서 어떤 정보를 출력할거야?(select)
 
 → e. 이런 배열을 가지고 출력할게(order by)

