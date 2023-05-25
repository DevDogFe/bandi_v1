-- sample data

insert into test_tb values
(1);

insert into user_tb(username, password, user_role, nick_name, email, birth_date, gender, external) values
('qwe', '$2a$10$W4axy9AFhjle0fvi1Hh9aucyDv.lV9Ouq8swDKUae6b5qwNIldBy.', 'admin', '현우씨', 'aa@sample.com', '1997-01-11', '남성', null),
('asd', '$2a$10$W4axy9AFhjle0fvi1Hh9aucyDv.lV9Ouq8swDKUae6b5qwNIldBy.', 'user', '민우씨', 'user@sample.com', '1992-12-12', '여성', null),
('qwq', '$2a$10$W4axy9AFhjle0fvi1Hh9aucyDv.lV9Ouq8swDKUae6b5qwNIldBy.', 'user', '용림씨', 'user2@sample.com', '1992-10-12', '여성', null),
--('hyo', '$2a$10$W4axy9AFhjle0fvi1Hh9aucyDv.lV9Ouq8swDKUae6b5qwNIldBy.', 'user', '효린씨', 'khl4459@naver.com', '1995-09-29', '여성', null),
('hyun', '$2a$10$W4axy9AFhjle0fvi1Hh9aucyDv.lV9Ouq8swDKUae6b5qwNIldBy.', 'user', '지현씨', 'jhkim900726@gmail.com', '1990-07-26', '여성', null);

insert into genre_tb(name) values
('무협'), ('판타지'), ('로맨스'), ('SF'), ('대체역사');

insert into service_type_tb(name) values
('유료'), ('무료'), ('공모전');

INSERT INTO contest_tb (user_id,begin_created_at,end_created_at,title,content) 
values 
(2,'2023-05-16', '2023-05-25', '2023 지상최대 웹소설 공모전5', '엄청난 공모전5'),
(2,'2023-05-16', '2023-05-20', '2023 지상최대 웹소설 공모전4', '엄청난 공모전4'),
(2,'2023-04-16', '2023-04-20', '2023 지상최대 웹소설 공모전3', '엄청난 공모전3'),
(2,'2023-03-16', '2023-03-20', '2023 지상최대 웹소설 공모전2', '엄청난 공모전2'),
(2,'2023-02-16', '2023-02-20', '2023 지상최대 웹소설 공모전1', '엄청난 공모전1');

INSERT INTO novel_tb (user_id, genre_id, service_type_id, title, overview, serial_cycle)
		VALUES
		(1, 5, 1, '단종이 너무강함1', '단종이 너무 강해서 막을수가 없다?!', '월'),
        (2, 1, 1, '회귀수선전1', '회귀해서 수선하는 소설', '일'),
        (1, 2, 3, '내 집에 영약 광산이 열렸다1', '어느 날 탑 100층과 내 집의 거실이 연결되었다.', '일'),
		(1, 5, 1, '단종이 너무강함2', '단종이 너무 강해서 막을수가 없다?!', '월'),
        (2, 1, 1, '회귀수선전2', '회귀해서 수선하는 소설', '일'),
        (1, 2, 3, '내 집에 영약 광산이 열렸다2', '어느 날 탑 100층과 내 집의 거실이 연결되었다.', '일'),
		(1, 5, 1, '단종이 너무강함3', '단종이 너무 강해서 막을수가 없다?!', '월'),
        (2, 1, 1, '회귀수선전3', '회귀해서 수선하는 소설', '일'),
        (1, 2, 3, '내 집에 영약 광산이 열렸다3', '어느 날 탑 100층과 내 집의 거실이 연결되었다.', '일'),
		(1, 5, 1, '단종이 너무강함4', '단종이 너무 강해서 막을수가 없다?!', '월'),
        (2, 1, 1, '회귀수선전4', '회귀해서 수선하는 소설', '일'),
        (1, 2, 3, '내 집에 영약 광산이 열렸다4', '어느 날 탑 100층과 내 집의 거실이 연결되었다.', '일'),
		(1, 5, 1, '단종이 너무강함5', '단종이 너무 강해서 막을수가 없다?!', '월'),
        (2, 1, 1, '회귀수선전5', '회귀해서 수선하는 소설', '일'),
        (1, 2, 3, '내 집에 영약 광산이 열렸다5', '어느 날 탑 100층과 내 집의 거실이 연결되었다.', '일'),
		(1, 5, 1, '단종이 너무강함6', '단종이 너무 강해서 막을수가 없다?!', '월'),
        (2, 1, 1, '회귀수선전6', '회귀해서 수선하는 소설', '일'),
        (1, 2, 3, '내 집에 영약 광산이 열렸다6', '어느 날 탑 100층과 내 집의 거실이 연결되었다.', '일'),
		(1, 5, 1, '단종이 너무강함7', '단종이 너무 강해서 막을수가 없다?!', '월'),
        (2, 1, 1, '회귀수선전7', '회귀해서 수선하는 소설', '일'),
        (1, 2, 3, '내 집에 영약 광산이 열렸다7', '어느 날 탑 100층과 내 집의 거실이 연결되었다.', '일'),
		(1, 5, 1, '단종이 너무강함8', '단종이 너무 강해서 막을수가 없다?!', '월'),
        (2, 1, 1, '회귀수선전8', '회귀해서 수선하는 소설', '일'),
        (1, 2, 3, '내 집에 영약 광산이 열렸다8', '어느 날 탑 100층과 내 집의 거실이 연결되었다.', '일'),
		(1, 5, 1, '단종이 너무강함9', '단종이 너무 강해서 막을수가 없다?!', '월'),
        (2, 1, 1, '회귀수선전9', '회귀해서 수선하는 소설', '일'),
        (1, 2, 3, '내 집에 영약 광산이 열렸다9', '어느 날 탑 100층과 내 집의 거실이 연결되었다.', '일'),
		(1, 5, 1, '단종이 너무강함10', '단종이 너무 강해서 막을수가 없다?!', '월'),
        (2, 1, 1, '회귀수선전10', '회귀해서 수선하는 소설', '일'),
        (1, 2, 3, '내 집에 영약 광산이 열렸다10', '어느 날 탑 100층과 내 집의 거실이 연결되었다.', '일'),
		(1, 5, 1, '단종이 너무강함11', '단종이 너무 강해서 막을수가 없다?!', '월'),
        (2, 1, 1, '회귀수선전11', '회귀해서 수선하는 소설', '일'),
        (1, 2, 3, '내 집에 영약 광산이 열렸다11', '어느 날 탑 100층과 내 집의 거실이 연결되었다.', '일'),
		(1, 5, 1, '단종이 너무강함12', '단종이 너무 강해서 막을수가 없다?!', '월'),
        (2, 1, 1, '회귀수선전12', '회귀해서 수선하는 소설', '일'),
        (1, 2, 3, '내 집에 영약 광산이 열렸다12', '어느 날 탑 100층과 내 집의 거실이 연결되었다.', '일'),
		(1, 5, 1, '단종이 너무강함13', '단종이 너무 강해서 막을수가 없다?!', '월'),
        (2, 1, 1, '회귀수선전13', '회귀해서 수선하는 소설', '일'),
        (1, 2, 3, '내 집에 영약 광산이 열렸다13', '어느 날 탑 100층과 내 집의 거실이 연결되었다.', '일'),
		(1, 5, 1, '단종이 너무강함14', '단종이 너무 강해서 막을수가 없다?!', '월'),
        (2, 1, 1, '회귀수선전14', '회귀해서 수선하는 소설', '일'),
        (1, 2, 3, '내 집에 영약 광산이 열렸다14', '어느 날 탑 100층과 내 집의 거실이 연결되었다.', '일'),
		(1, 5, 1, '단종이 너무강함15', '단종이 너무 강해서 막을수가 없다?!', '월'),
        (2, 1, 1, '회귀수선전15', '회귀해서 수선하는 소설', '일'),
        (1, 2, 3, '내 집에 영약 광산이 열렸다15', '어느 날 탑 100층과 내 집의 거실이 연결되었다.', '일'),
		(1, 5, 1, '단종이 너무강함16', '단종이 너무 강해서 막을수가 없다?!', '월'),
        (2, 1, 1, '회귀수선전16', '회귀해서 수선하는 소설', '일'),
        (1, 2, 3, '내 집에 영약 광산이 열렸다16', '어느 날 탑 100층과 내 집의 거실이 연결되었다.', '일'),
		(1, 5, 2, '단종이 너무강함17', '단종이 너무 강해서 막을수가 없다?!', '월'),
        (2, 1, 2, '회귀수선전17', '회귀해서 수선하는 소설', '일'),
        (1, 2, 2, '내 집에 영약 광산이 열렸다16', '어느 날 탑 100층과 내 집의 거실이 연결되었다.', '일'),
		(1, 5, 2, '단종이 너무강함167', '단종이 너무 강해서 막을수가 없다?!', '월'),
        (2, 1, 2, '회귀수선전168', '회귀해서 수선하는 소설', '일'),
        (1, 2, 2, '내 집에 영약 광산이 열렸다169', '어느 날 탑 100층과 내 집의 거실이 연결되었다.', '일');
        
INSERT INTO contest_novel_tb (novel_id,contest_id)
VALUES (3,1);
        
INSERT INTO novel_section_tb (novel_id, title, content, list_price, current_price)
VALUES 
(1, '1화 세조의 슬픔', '세조는 반역을 계획중이다.

하지만 단종이 너무 강하다는 것을 알게되었다.', 100, 100),
(3, '프롤로그', '거실 조명은 꺼짐', 100, 100),
(3, '영약 광산의 주인', '나는 형이 운전하는 차의 보조석에 앉아', 100, 100),
(3, '내 집에 영약 광산이 열렸다', '내 눈이 커다랗게 떠졌다.', 100, 100),
(3, '각성 측정 검사', '나는 에너지초를 가져다 착즙기에 넣어', 100, 100),
(3, '영약 거래', '늦은 오후, 나는 관리국을 나와 윤재의 차에 올라탔다.', 100, 100),
(3, '회복', '나는 영약 광산 안으로 들어섰다.', 100, 100),
(3, '설욕의 시간', '윤재는 나를 붙든 채 물었다.', 100, 100),
(3, '진화석의 쓰임새', '영상 속의 나는 기자의 질문에 답했었다.', 100, 100),
(3, '약팔이', '나는 형이 운전하는 차의 보조석에 앉아라', 100, 100),
(1, '2화 슬픈 세조', '세조는 계획중이다. 반역을', 200, 150);

-- FAQ category 
insert into faq_category_tb(category_name)
values('이용안내'), 
	  ('콘텐츠'),
	  ('구매'),
	  ('이벤트'),
	  ('공모전'),
	  ('연재'),
	  ('기타' );
	  
-- FAQ  	  
insert into faq_tb(faq_category_id, question, answer)
values (1, '로그인 어떻게 하나요', '무료'),	
	   (1, '문의는 어떻게 하나요', '무료'),	
	   (1, '탈퇴하고 싶습니다', '무료'),
	   (1, '게시글 및 댓글 신고가능한가요', '무료'),	
	   (2, '콘텐츠 사용기한이 있나요', '신청하세요'),	
	   (2, '즐겨찾기 할 수 있나요', '신청하세요'),	
	   (2, '싫어요는 없나요', '신청하세요'),	
	   (2, '콘텐츠는 신고 안되나요', '신청하세요'),	  
	   (3, '캐시란 무엇인가요', '무료'),
	   (3, '이용권은 무엇인가요', '무료'),
	   (3, '캐시충전은 어떻게 하나요', '무료'),
	   (3, '캐시 환불은 어떻게 하나요', '무료'),
	   (3, '결제 어떻게하나요', '무료'),
	   (3, '캐시 사용기한이 있나요', '무료'),
	   (3, '소장할 수 있나요', '무료'),	  
	   (4, '이벤트언제합니까', '내일'),
	   (4, '어떻게 참여하나요', '내일'),
	   (4, '당첨자는 어떻게 알려주나요', '내일'),
	   (5, '공모전 참여 어떻게 하나요', '내일') ,
	   (5, '언제 열리나요', '내일') ,
	   (5, '공모전 수상하면 어떻게 되나여', '내일') ,
	   (6, '제 작품 등록하고 싶은데 어떻게 하나요', '내일'),
	   (6, '작가로 데뷔하고싶습니다', '내일'),
	   (7, '알람 기능은 없나요', '내일'),
	   (7, '앱으로 이용할 수는 없나요', '내일');	  
	  

-- 게시판 종류 sample data
insert into board_type_tb(board_name) 
values ('자유'),
	   ('추천'),
	   ('팬아트'),
	   ('홍보');

-- 게시판 카테고리 sample data
insert into board_category_tb(board_type_id ,category_name) values
('1', '잡담'),
('1', '공지'),
('1', '정보'),
('1', '질문'),
('1', '토론'),
('2', '공지'),
('2', '추천'),
('3', '일러스트'),
('3', '카툰'),
('3', '기타'),
('4', '공지'),
('4', '홍보');
insert into board_tb(user_id, board_type_id, category_id, title, content, created_at)
values(1, 1, 4, '새로 등록된 작품은 어디서 찾나요?', '제가 공모전 등록을 했는데 검색을 해야 그나마 찾을 수 있고 일반적으로 어디를 클릭해서 들어가야 새작품을 볼 수 있는지 모르겠습니다. 도움!', now()),
(1, 1, 4, '일반연재 승급 관련 질문입니다', '75,000자를 채우고 일정 기간 동안(연재 당일을 제외한 최소 일주일 이상) 연재 후 신청 가능합니다고 하는데요. 만약에 제가 이번주 수요일에 연재를 시작했으면 다음 주 수요일에 신청이 가능한건가요? 답변 미리 감사합니다.' , now()),
(1, 1, 4, '현대판타지 사이다물 추천 해주세요.', '그냥.. 시원시원한 전개의 사이다 현판 추천 부탁드립니다. 회귀, 재벌 뭐 다 상관없습니다.', now()),
(1, 1, 4, '새로 등록된 작품은 어디서 찾나요?', '제가 공모전 등록을 했는데 검색을 해야 그나마 찾을 수 있고 일반적으로 어디를 클릭해서 들어가야 새작품을 볼 수 있는지 모르겠습니다. 도움!', now()),
(1, 1, 4, '일반연재 승급 관련 질문입니다', '75,000자를 채우고 일정 기간 동안(연재 당일을 제외한 최소 일주일 이상) 연재 후 신청 가능합니다고 하는데요. 만약에 제가 이번주 수요일에 연재를 시작했으면 다음 주 수요일에 신청이 가능한건가요? 답변 미리 감사합니다.' , now()),
(1, 1, 4, '현대판타지 사이다물 추천 해주세요.', '그냥.. 시원시원한 전개의 사이다 현판 추천 부탁드립니다. 회귀, 재벌 뭐 다 상관없습니다.', now()),
(1, 1, 4, '새로 등록된 작품은 어디서 찾나요?', '제가 공모전 등록을 했는데 검색을 해야 그나마 찾을 수 있고 일반적으로 어디를 클릭해서 들어가야 새작품을 볼 수 있는지 모르겠습니다. 도움!', now()),
(1, 1, 4, '일반연재 승급 관련 질문입니다', '75,000자를 채우고 일정 기간 동안(연재 당일을 제외한 최소 일주일 이상) 연재 후 신청 가능합니다고 하는데요. 만약에 제가 이번주 수요일에 연재를 시작했으면 다음 주 수요일에 신청이 가능한건가요? 답변 미리 감사합니다.' , now()),
(1, 1, 4, '현대판타지 사이다물 추천 해주세요.', '그냥.. 시원시원한 전개의 사이다 현판 추천 부탁드립니다. 회귀, 재벌 뭐 다 상관없습니다.', now()),
(1, 1, 4, '새로 등록된 작품은 어디서 찾나요?', '제가 공모전 등록을 했는데 검색을 해야 그나마 찾을 수 있고 일반적으로 어디를 클릭해서 들어가야 새작품을 볼 수 있는지 모르겠습니다. 도움!', now()),
(1, 1, 4, '일반연재 승급 관련 질문입니다', '75,000자를 채우고 일정 기간 동안(연재 당일을 제외한 최소 일주일 이상) 연재 후 신청 가능합니다고 하는데요. 만약에 제가 이번주 수요일에 연재를 시작했으면 다음 주 수요일에 신청이 가능한건가요? 답변 미리 감사합니다.' , now()),
(1, 1, 4, '현대판타지 사이다물 추천 해주세요.', '그냥.. 시원시원한 전개의 사이다 현판 추천 부탁드립니다. 회귀, 재벌 뭐 다 상관없습니다.', now());


-- Question 
insert into question_tb(user_id, title, content, faq_category_id, proceed) values
(1, '제목', '내용', '1', 1 ),
(2, '질문', '질문입니다', '2', 1),
(1, '제목이요', '내용입니다', '3', 0),
(2, '제목이요', '내용입니다', '4', 0);

-- answer
insert into answer_tb(user_id, content,  question_id) values
(1, '답1', 1),
(2, '답2', 2);

INSERT INTO novel_reply_tb (section_id, user_id, content) VALUES 
(1, 1, '너무 재밌어요1'),
(1, 2, '그저그래요2'),
(1, 1, '너무 재밌어요3'),
(1, 2, '그저그래요4'),
(1, 1, '너무 재밌어요5'),
(1, 2, '그저그래요6'),
(1, 1, '너무 재밌어요7'),
(1, 2, '그저그래요8'),
(1, 1, '너무 재밌어요9'),
(1, 2, '그저그래요10'),
(1, 1, '너무 재밌어요11'),
(1, 2, '그저그래요12'),
(1, 1, '너무 재밌어요13'),
(1, 2, '그저그래요14'),
(1, 1, '너무 재밌어요15'),
(1, 2, '그저그래요16'),
(1, 1, '너무 재밌어요'),
(1, 2, '그저그래요18'),
(1, 1, '너무 재밌어요'),
(1, 2, '그저그래요20'),
(1, 1, '너무 재밌어요'),
(1, 2, '그저그래요22'),
(1, 1, '너무 재밌어요'),
(1, 2, '그저그래요24'),
(1, 1, '너무 재밌어요'),
(1, 2, '그저그래요26'),
(1, 1, '너무 재밌어요'),
(1, 2, '그저그래요28'),
(1, 1, '너무 재밌어요'),
(1, 2, '그저그래요30'),
(1, 1, '너무 재밌어요'),
(1, 2, '그저그래요32'),
(1, 1, '너무 재밌어요'),
(1, 1, '너무 재밌어요1'),
(1, 2, '그저그래요2'),
(1, 1, '너무 재밌어요3'),
(1, 2, '그저그래요4'),
(1, 1, '너무 재밌어요5'),
(1, 2, '그저그래요6'),
(1, 1, '너무 재밌어요7'),
(1, 2, '그저그래요8'),
(1, 1, '너무 재밌어요9'),
(1, 2, '그저그래요10'),
(1, 1, '너무 재밌어요11'),
(1, 2, '그저그래요12'),
(1, 1, '너무 재밌어요13'),
(1, 2, '그저그래요14'),
(1, 1, '너무 재밌어요15'),
(1, 2, '그저그래요16'),
(1, 1, '너무 재밌어요'),
(1, 2, '그저그래요18'),
(1, 1, '너무 재밌어요'),
(1, 2, '그저그래요20'),
(1, 1, '너무 재밌어요'),
(1, 2, '그저그래요22'),
(1, 1, '너무 재밌어요'),
(1, 2, '그저그래요24'),
(1, 1, '너무 재밌어요'),
(1, 2, '그저그래요26'),
(1, 1, '너무 재밌어요'),
(1, 2, '그저그래요28'),
(1, 1, '너무 재밌어요'),
(1, 2, '그저그래요30'),
(1, 1, '너무 재밌어요'),
(1, 2, '그저그래요32'),
(1, 1, '너무 재밌어요'),
(1, 2, '그저그래요34');

-- 소설 조회 기록
INSERT INTO user_novel_record_tb(user_id,novel_id,section_id,created_at) VALUES
(1,1,1,'2023-05-16'),
(1,3,2,'2023-05-17'),
(1,3,3,'2023-05-18');

-- 연재문의
insert into application_tb (user_id, tel, title, content, origin_filename , upload_filename) values
(1, '01022658611', '연재하고싶어요', '재밌어요', '서비스', '서비스'),
(2, '010', '연재', '원해요','연재', '연재');


INSERT INTO novel_section_tb (novel_id, title, content, list_price, current_price)
VALUES 
(1, '11화 세조의 슬픔', '세조는 반역을 계획중이다. 하지만 단종이 너무 강하다는 것을 알게되었다.', 100, 100),
(1, '2프롤로그', '거실 조명은 꺼짐', 100, 100),
(2, '3영약 광산의 주인', '나는 형이 운전하는 차의 보조석에 앉아', 100, 100),
(4, '4내 집에 영약 광산이 열렸다', '내 눈이 커다랗게 떠졌다.', 100, 100),
(5, '5각성 측정 검사', '나는 에너지초를 가져다 착즙기에 넣어', 100, 100),
(1, '6영약 거래', '늦은 오후, 나는 관리국을 나와 윤재의 차에 올라탔다.', 100, 100),
(2, '7회복', '나는 영약 광산 안으로 들어섰다.', 100, 100),
(4, '8설욕의 시간', '윤재는 나를 붙든 채 물었다.', 100, 100),
(5, '9진화석의 쓰임새', '영상 속의 나는 기자의 질문에 답했었다.', 100, 100),
(7, '0약팔이', '나는 형이 운전하는 차의 보조석에 앉아라', 100, 100),
(1, '12화 세조의 슬픔', '세조는 반역을 계획중이다. 하지만 단종이 너무 강하다는 것을 알게되었다.', 100, 100),
(1, '2프롤로그', '거실 조명은 꺼짐', 100, 100),
(2, '2영약 광산의 주인', '나는 형이 운전하는 차의 보조석에 앉아', 100, 100),
(4, '2내 집에 영약 광산이 열렸다', '내 눈이 커다랗게 떠졌다.', 100, 100),
(5, '2각성 측정 검사', '나는 에너지초를 가져다 착즙기에 넣어', 100, 100),
(1, '2영약 거래', '늦은 오후, 나는 관리국을 나와 윤재의 차에 올라탔다.', 100, 100),
(2, '2회복', '나는 영약 광산 안으로 들어섰다.', 100, 100),
(4, '2설욕의 시간', '윤재는 나를 붙든 채 물었다.', 100, 100),
(5, '2진화석의 쓰임새', '영상 속의 나는 기자의 질문에 답했었다.', 100, 100),
(4, '2약팔이', '나는 형이 운전하는 차의 보조석에 앉아라', 100, 100);

INSERT INTO user_favorite_tb VALUES
(1, 1),
(1, 2),
(1, 4),
(1, 5),
(1, 7),
(1, 8),
(1, 10),
(1, 11),
(1, 13),
(1, 14),
(2, 1),
(2, 2),
(2, 4),
(2, 5),
(2, 7),
(2, 8),
(2, 11),
(2, 13),
(2, 14),
(3, 1),
(3, 2),
(3, 7),
(3, 8),
(3, 10),
(3, 11),
(3, 13),
(3, 14);

INSERT INTO score_tb VALUES
(1, 1, 5),
(1, 11, 5),
(1, 12, 4),
(1, 13, 3),
(1, 14, 2),
(1, 15, 1),
(1, 16, 2),
(1, 17, 3),
(1, 18, 4),
(1, 19, 5),
(1, 20, 5),
(1, 21, 5),
(1, 22, 4),
(1, 23, 3),
(1, 24, 2),
(1, 25, 1),
(1, 26, 2),
(1, 27, 3),
(1, 28, 4),
(1, 29, 5),
(1, 30, 5);
-- 신고 카테고리
insert into report_category_tb (category_name) values
('욕설/비방'),
('도배'),
('광고/상업성'),
('기타');

-- 신고 기록
insert into report_tb (user_id, board_id, content, category_id, created_at) values
(2, 1, '도배해서 신고함', 2, now()),
(2, 10, '맘에 안들어서 신고함', 4, '2023-05-23');

-- 유저 골드 정보 
INSERT INTO user_gold_tb(user_id,gold) VALUES
(1,1000),
(2,1000),
(3,5000);

-- 유저 결제 회차 기록(삭제 예정)
INSERT INTO user_library_tb(user_id,section_id) VALUES
(1,1);

-- 유저 결제 소설 기록
INSERT INTO user_purchase_tb(user_id,section_id,price) VALUES
(1,1,100),
(1,2,100),
(1,3,100),
(1,4,100);

-- 유저 대여 소설 기록
INSERT INTO user_rental_tb(user_id,section_id,price,end_rental) VALUES
(1,11,100,now()),
(1,4,100,now()+3),
(1,5,100,now()+3),
(1,6,100,now()+3);

