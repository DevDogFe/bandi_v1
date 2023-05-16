-- sample data

insert into test_tb values
(1);

insert into user_tb(username, password, user_role) values
('qwe', '$2a$10$W4axy9AFhjle0fvi1Hh9aucyDv.lV9Ouq8swDKUae6b5qwNIldBy.', 'user'),
('asd', '$2a$10$W4axy9AFhjle0fvi1Hh9aucyDv.lV9Ouq8swDKUae6b5qwNIldBy.', 'user');

insert into genre_tb(name) values
('무협'), ('판타지'), ('로맨스'), ('SF'), ('대체역사');

insert into service_type_tb(name) values
('유료'), ('무료'), ('공모전');

INSERT INTO novel_tb (user_id, genre_id, service_type_id, title, overview, serial_cycle)
		VALUES
		(1, 5, 1, '단종이 너무강함', '단종이 너무 강해서 막을수가 없다?!', '월'),
        (2, 1, 1, '회귀수선전', '회귀해서 수선하는 소설', '일');
        
INSERT INTO novel_section_tb (novel_id, title, content, list_price, current_price)
VALUES 
(1, '프롤로그', '단종은 너무 강했다. 거기서 부터 시작하는 이야기', 100, 100),
(1, '1화 세조의 슬픔', '세조는 반역을 계획중이다.', 100, 100);

insert into faq_category_tb(category_name)
values('고객'), 
	  ('작가'),
	  ('포인트'),
	  ('이벤트'),
	  ('공모전'),
	  ('기타' );
	  
insert into faq_tb(faq_category_id, question, answer)
values (1, '고객', '무료'),	
	   (2, '작가될래요', '신청하세요'),	  
	   (3, '공짜는 없나요', '무료'),	  
	   (4, '이벤트언제합니까', '내일'),
	   (5, '공모전언제합니까', '내일') ,
	   (6, '기타기타', '내일');	  
	  
