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

INSERT INTO contest_tb (user_id,begin_created_at,end_created_at,title,content) 
values 
(2,'2023-05-16', '2023-05-25', '2023 지상최대 웹소설 공모전5', '엄청난 공모전5'),
(2,'2023-05-16', '2023-05-20', '2023 지상최대 웹소설 공모전4', '엄청난 공모전4'),
(2,'2023-04-16', '2023-04-20', '2023 지상최대 웹소설 공모전3', '엄청난 공모전3'),
(2,'2023-03-16', '2023-03-20', '2023 지상최대 웹소설 공모전2', '엄청난 공모전2'),
(2,'2023-02-16', '2023-02-20', '2023 지상최대 웹소설 공모전1', '엄청난 공모전1');

INSERT INTO novel_tb (user_id, genre_id, service_type_id, title, overview, serial_cycle)
		VALUES
		(1, 5, 1, '단종이 너무강함', '단종이 너무 강해서 막을수가 없다?!', '월'),
        (2, 1, 1, '회귀수선전', '회귀해서 수선하는 소설', '일'),
        (1, 2, 3, '내 집에 영약 광산이 열렸다', '어느 날 탑 100층과 내 집의 거실이 연결되었다.', '일');
        
INSERT INTO contest_novel_tb (novel_id,contest_id)
VALUES (3,1);
        
INSERT INTO novel_section_tb (novel_id, title, content, list_price, current_price)
VALUES 
(1, '프롤로그', '단종은 너무 강했다. 거기서 부터 시작하는 이야기', 100, 100),
(1, '1화 세조의 슬픔', '세조는 반역을 계획중이다.', 100, 100),
(3, '프롤로그', '거실 조명은 꺼짐', 100, 100),
(3, '영약 광산의 주인', '나는 형이 운전하는 차의 보조석에 앉아', 100, 100);

