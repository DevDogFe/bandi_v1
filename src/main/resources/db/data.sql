-- sample data

insert into test_tb values
(1);

insert into user_tb(username, password, user_role) values
('qwe', '$2a$10$W4axy9AFhjle0fvi1Hh9aucyDv.lV9Ouq8swDKUae6b5qwNIldBy.', 'user');

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
	  