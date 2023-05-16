-- sample data

insert into test_tb values
(1);

insert into user_tb(username, password, user_role) values
('qwe', '$2a$10$W4axy9AFhjle0fvi1Hh9aucyDv.lV9Ouq8swDKUae6b5qwNIldBy.', 'user');

-- 게시판 종류 sample data
insert into board_type_tb(board_name) values
('자유'),
('추천'),
('홍보'),
('팬아트');

-- 게시판 카테고리 sample data
insert into board_category_tb(board_type_id ,category_name) values
('1', '잡담'),
('1', '공지'),
('1', '정보'),
('1', '질문'),
('1', '토론'),
('2', '공지'),
('2', '추천'),
('3', '공지'),
('3', '홍보'),
('4', '일러스트'),
('4', '카툰'),
('4', '기타');