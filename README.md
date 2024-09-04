# DBstudy
<h1>1. 테이블 생성 및 조작</h1>
<h3>테이블 관리 용어</h3>
<h5>relation</h5>
<h5>attribute</h5>
<hr>

<h1>2. CRUD</h1>
<br>
<h2>C_데이터 입력</h2>
<p>insert 절의 정의 : 데이터베이스에 원하는 데이터를 입력</p>
<h3>기본 사용 코드</h3>
<p>insert into [table_name] values ([column1], [column2], [column3], ...)</p>
<br>
<h2>R_데이터 출력</h2>
<p>select 절의 정의 : 데이터베이스에 저장된 데이터를 조회(원하는 테이블에서 원하는 튜플 및 컬럼을 선택하여 추출)</p>
<h3>기본 사용 코드</h3>
<p>a. select : 화면에 출력과 관련된 코드/count(*), sum([테이블 명]), ...</p>
<p>b. from : 출력하고자 하는 테이블을 선택할때 사용하는 코드/from [테이블 명]</p>
<p>c. where : 튜플(행)을 선정할때 사용하는 코드(각종 조건(참과 거짓으로 구분되는 것)을 활용)/where [컬럼 명] >= 0</p>
<p>d. order by : 정렬(내림차순, 오름차순 등)이 필요할 때 사용/order by [컬럼 명] asc(오름차순, default 값으로 써주지 않아도 적용), desc(내림차순)</p><br>
<h3>사용 순서</h3>
<p>a → b → c or d</p>
<h3>사고의 흐름</h3>
<p><strong>b → c → a → group by → d</strong></p>
<p>	→ b. 어떤 테이블에서 데이터를 가져올꺼야?(from)</p>
<p> → c. 어떤 조건의 튜플을 가져올꺼야?(where)</p>
<p>	→ a. 가져온 튜플에서 어떤 정보를 출력할거야?(select)</p>
<p>	→ d. 이런 배열을 가지고 출력할게(order by)</p>

