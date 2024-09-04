# DBstudy
<h1>1. 테이블 설계</h1>
<h2>테이블 관리 용어</h2>
<p>relation</p>
<p>attribute</p>
<h2>테이블 설계 과정</h2>
<p>1. 개념적 설계(ERD)</p>
<p>2. 논리적 설계(테이블 명세서/정의서)</p>
<p>3. 물리적 설계(쿼리문)</p>
<h3>1. 개념적 설계(ERD)</h3>
<p>- E(Entity) : 개체, 독립적으로 존재할 수 있는 대상(네모로 표시하며, 동그라미는 개체의 속성을 표시할 때 사용)</p>
<p>- R(Relationship) : 관계, 개체간의 관계성을 가질 수 있는 것(마름모로 표시, 1:1, 1:N, N:M 의 관계)</p>
<p>- D(Diagram) : 표현, 개체와 개체간의 관계성을 시각적으로 표현(관계성을 가진 개체 사이는 선으로 표시하며, 선 위에 과계를 써준다.</p>
<p>Ex)</p>
<img width="100%" src="https://github.com/user-attachments/assets/15bcbbc7-5132-4e43-baba-4452ad1325ab">
<p></p>
<p></p>
<p></p>
<p></p>
<hr>

<h1>2. CRUD</h1>

<h2>C_데이터 입력</h2>
<p>insert 절의 정의 : 데이터베이스에 원하는 데이터를 입력</p>
<h3>기본 사용 코드</h3>
<p>insert into [table_name] values ([column1], [column2], [column3], ...)</p>

<h2>R_데이터 출력</h2>
<p>select 절의 정의 : 데이터베이스에 저장된 데이터를 조회(원하는 테이블에서 원하는 튜플 및 컬럼을 선택하여 추출)</p>
<h3>기본 사용 코드</h3>
<p>select [column1], [column2], [column3], ... from [table_name] (where [조건]) (group by [분류 조건]) (order by [정렬 조건]);</p>
<p>a. select : 화면에 출력과 관련된 코드/count(*), sum([테이블 명]), ...</p>
<p>b. from : 출력하고자 하는 테이블을 선택할때 사용하는 코드/from [테이블 명]</p>
<p>c. where : 튜플(행)을 선정할때 사용하는 코드(각종 조건(참과 거짓으로 구분되는 것)을 활용)/where [컬럼 명] or [함수 및 수식 값] >= 0</p>
<p>d. group by : 그룹별 통계를 내야할 때 사용하며 튜플을 선정과는 무관/group by [컬럼 명]</p>
<p>e. order by : 정렬(내림차순, 오름차순 등)이 필요할 때 사용/order by [컬럼 명] asc(오름차순, default 값으로 써주지 않아도 적용), desc(내림차순)</p>
<h3>사용 순서</h3>
<p>a → b → (c → d → e)</p>
<h3>사고의 흐름</h3>
<p><strong>b → c → d → a → e</strong></p>
<p>	→ b. 어떤 테이블에서 데이터를 가져올꺼야?(from)</p>
<p> → c. 어떤 조건의 튜플을 가져올꺼야?(where)</p>
<p> → d. 어떤 기준으로 그룹을 묶을거야(group by)</p>
<p>	→ a. 가져온 튜플에서 어떤 정보를 출력할거야?(select)</p>
<p>	→ e. 이런 배열을 가지고 출력할게(order by)</p>

