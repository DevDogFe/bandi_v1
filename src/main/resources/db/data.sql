-- sample data

insert into test_tb values
(1);

insert into user_tb(username, password, user_role, nick_name, email, birth_date, gender, external) values
('qwe', '$2a$10$W4axy9AFhjle0fvi1Hh9aucyDv.lV9Ouq8swDKUae6b5qwNIldBy.', 'admin', '현우씨', 'aa@sample.com', '1997-01-11', '남성', false),
('asd', '$2a$10$W4axy9AFhjle0fvi1Hh9aucyDv.lV9Ouq8swDKUae6b5qwNIldBy.', 'user', '민우씨', 'user@sample.com', '1992-12-12', '여성', false);

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
