## project - bandi
"좋은 글을 비추는 사이트"

## 🖥️ 프로젝트 소개
웹소설 플랫폼 사이트 "반디"

옛날 선비들은 밤에 글을 보기 위해 반딧불이를 모아 그 빛으로 글을 읽었습니다.
저희 프로젝트도 웹소설 플랫폼으로써 선비들을 위해 빛을 비추던 반딧불이처럼 
글 읽기를 좋아하는 사람들을 위해 좋은 글을 비추는 빛이 되고자 하는 마음으로 반디라는 이름을 선정하였습니다.

## 🕰️ 개발 기간
- 23.05.15일 - 23.06.07일 총 24일

## ✅ 시연영상 <a href="https://www.youtube.com/watch?v=Rk62IlzpeMM" >(유튜브 링크)</a>

## 🧑‍🤝‍🧑 멤버구성 (4명)
![팀원 소개](https://github.com/DevDogFe/bandi_v1/assets/125328301/e70cb4b5-4faa-4e96-922b-22ac7abd92d5)

## ⚙️ 기술스택
### Backend
- jdk : 11.0.17
- lombok
- MyBatis
- JSP
- Apache Tomcat : 9.0

### Frontend
- bootstrap : 5.0.2
- HTML5
- CSS3
- JavaScript : 1.16.1
- JQuery : 3.6.4
- Slick.js
- turn.js
- summernote : 0.8.18

### 협업도구
- git
- github
- jira

### 데이터베이스
- H2 Database
- MySQL : 8.0.32

### 의존성
```java
implementation 'org.apache.tomcat.embed:tomcat-embed-jasper' 
implementation 'javax.servlet:jstl'
// implementation 'org.springframework.security:spring-security-taglibs:5.6.2'
implementation 'org.springframework.security:spring-security-crypto'
	
implementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter:2.3.0'
// implementation 'org.springframework.boot:spring-boot-starter-security'
implementation 'org.springframework.security:spring-security-crypto'
implementation 'org.springframework.boot:spring-boot-starter-validation'
implementation 'org.springframework.boot:spring-boot-starter-web'
compileOnly 'org.projectlombok:lombok'
developmentOnly 'org.springframework.boot:spring-boot-devtools'
runtimeOnly 'com.mysql:mysql-connector-j'
runtimeOnly 'com.h2database:h2'
annotationProcessor 'org.projectlombok:lombok'
testImplementation 'org.springframework.boot:spring-boot-starter-test'
// testImplementation 'org.springframework.security:spring-security-test'
// 이메일 전송
implementation 'org.springframework.boot:spring-boot-starter-mail'
```


## 🙋‍♀️ ERD & 테이블 명세서
테이블 명세서<a href="https://docs.google.com/spreadsheets/d/1m_ARw78GDXOBfCcHcgeFqTYF-r_rrqpB1SlbBKp3tiA/edit#gid=0" >https://docs.google.com/spreadsheets/d/1m_ARw78GDXOBfCcHcgeFqTYF-r_rrqpB1SlbBKp3tiA/edit#gid=0</a>  
  ![image](https://github.com/DevDogFe/bandi_v1/assets/125328301/3b97bc85-cb80-40cf-beec-1dceb53eb043)

## ⚒️ SiteMap
<br>

<table>
<tr>
 <td>User</td>
 <td>Manager</td>
 </tr>
<tr>
<td><img src="https://github.com/DevDogFe/bandi_v1/assets/125328301/e3df3cd8-8e15-42c2-99e4-d5cb0d831670"></td>
<td><img src="https://github.com/DevDogFe/bandi_v1/assets/125328301/edb83c75-d680-44d6-959f-475e3206d58f"></td>
</tr>
</table>

<br>

## 📌 주요 기능

#### 메인
- 소설 인기순 정렬
- (로그인시) 유저정보 기반 추천알고리즘을 통한 추천리스트 정렬
#### 로그인
- 세션처리
- 쿠키저장
- 소셜 로그인(kakao, naver)
- 회원가입시 중복체크(Ajax), 이메일 인증(smtp)
- 아이디 찾기
- 비밀번호 발급(smtp)
<br>

<table>
<tr>
  <td>네이버 회원가입 및 로그인</td>
  <td>카카오 회원가입 및 로그인</td>
</tr>
<tr>
  <td><img src="https://github.com/DevDogFe/bandi_v1/assets/125328301/cbbe14d4-6027-4820-ac02-0dbe6b28bca5"></td>
  <td><img src="https://github.com/DevDogFe/bandi_v1/assets/125328301/e28c6134-44b0-4c65-9e5d-c05411b913da"></td>
</tr>
<tr>
  <td>일반 회원가입 및 로그인</td>
</tr>
<tr>
  <td><img src="https://github.com/DevDogFe/bandi_v1/assets/125328301/cbbe14d4-6027-4820-ac02-0dbe6b28bca5"></td>
</tr>
</table>

<br>

#### 마이페이지(회원정보)
- 내 정보 조회
- 내 정보 수정
#### 마이페이지 기타 항목
- 내 즐겨찾기 조회
- 내 작품 조회 및 등록
- 내 구매 목록 조회
- 내 대여 목록 조회
- 내 결제 목록 조회(결제 및 환불 기능)
- 내 1:1 문의 조회
<br>

<table>
<tr>
  <td>소설 즐겨찾기 및 마이페이지 구매 대여 기록</td>
</tr>
<tr>
  <td><img src="https://github.com/DevDogFe/bandi_v1/assets/125328301/15151ac9-8f3b-4be3-9646-82bf76b28cfb"></td>
</tr>
</table>

<br>

#### 게시판(자유, 추천, 팬아트, 홍보)
- 카테고리별 글 작성
- 페이징 및 검색기능
- 댓글
- 좋아요 및 신고

#### 소설(유료, 무료, 공모전)
- 소설 리스트 조회(최신순, 평점순, 즐겨찾기순) 및 검색(장르별 검색, 키워드 검색)
- 소설 상세 조회(소설 상세 정보, 회차 리스트 조회, 다른 소설 추천리스트 팝업)
- (유료 소설의 회차 조회시) 결제 페이지
- 소설 회차 조회(댓글, 별점, 소설 조회 책처럼 페이징(js), 이전화 및 다음화)
<br>

<table>
<tr>
  <td>소설 결제 및 조회</td>
  <td>소설 등록</td>
</tr>
<tr>
  <td><img src="https://github.com/DevDogFe/bandi_v1/assets/125328301/e28c6134-44b0-4c65-9e5d-c05411b913da"></td>
  <td><img src="https://github.com/DevDogFe/bandi_v1/assets/125328301/6dca5670-10ab-4595-b01b-971562bb1a31"></td>
</tr>
<tr>
  <td>게시판 신고 기능</td>
  <td>공모전 CRUD</td>
</tr>
<tr>
  <td><img src="https://github.com/DevDogFe/bandi_v1/assets/125328301/962c309b-ee39-453a-841e-ea0554b113da"></td>
  <td><img src="https://github.com/DevDogFe/bandi_v1/assets/125328301/0535b28e-ef01-4b1c-80d6-61f5b048ba28"></td>
</tr>
<tr>
  <td>소설 즐겨찾기 및 마이페이지 구매 대여 기록</td>
  <td>표지등록 및 소설 쓰기</td>
</tr>
<tr>
  <td><img src="https://github.com/DevDogFe/bandi_v1/assets/125328301/15151ac9-8f3b-4be3-9646-82bf76b28cfb"></td>
  <td><img src="https://github.com/DevDogFe/bandi_v1/assets/125328301/0437302a-0fc1-4918-af96-4a5fdc303516"></td>
</tr>
</table>

<br>

#### CS(Q&A, FAQ, 제휴문의)
- 게시판 형식의 Q&A
- FAQ 카테고리별 조회, AJAX 비동기 통신 통한 리스트업
- 유저가 회원등급을 작가('author')로 변경하기위한 제휴문의 신청기능

<br>

<table>
<tr>
  <td>고객 지원</td>
</tr>
<tr>
  <td><img src="https://github.com/DevDogFe/bandi_v1/assets/125328301/5f9a66df-04a5-4032-a722-5a4189f52d81"></td>
</tr>
</table>

<br>
  
#### 관리자 페이지
- 대시보드(달 매출, 오늘 가입한 회원 수, 인기 소설, 장르 점유 등 조회)
- 장르 및 카테고리 관리(관리자가 개발자를 거치지않고 소설 장르나 게시판 카테고리 생성 및 삭제)
- 게시물 신고 관리(신고 내용 및 신고대상 게시물 조회, 삭제 기능)
- 소설타입 변경(공모전 -> 유료 or 무료, 무료 -> 유료)
- Q&A 답변, 수정, 삭제
- FAQ 등록, 수정, 삭제
- 제휴문의 조회

<br>

<table>
<tr>
  <td>관리자 페이지 대시보드, 신고게시물 처리</td>
  <td>관리자 페이지 자주 묻는 질문</td>
</tr>
<tr>
  <td><img src="https://github.com/DevDogFe/bandi_v1/assets/125328301/c14392c5-b15c-4b05-998a-4d85760ff520"></td>
  <td><img src="https://github.com/DevDogFe/bandi_v1/assets/125328301/11f75490-d3c3-48e8-b997-78f0232c38e3"></td>
</tr>
<tr>
  <td>관리자 페이지 소설 타입변경 및 연재 문의</td>
  <td>관리자 페이지 사용자 등급 변경 및 카테고리 변경</td>
</tr>
<tr>
  <td><img src="https://github.com/DevDogFe/bandi_v1/assets/125328301/008a8fd7-2e5a-4706-97c7-d77ec3e1640d"></td>
  <td><img src="https://github.com/DevDogFe/bandi_v1/assets/125328301/8ab09886-e84b-428f-8483-54d5b1aecf0a"></td>
</tr>
</table>

<br>

#### 기타
- 메일 SMTP: naver
- 결제 Api: kakao pay

<br>

<table>
<tr>
  <td>소설 결제 및 조회</td>
</tr>
<tr>
  <td><img src="https://github.com/DevDogFe/bandi_v1/assets/125328301/5cc64c2c-6e4b-449b-9eed-2a368d92ac1d"></td>
</tr>
</table>

<br>
