-- ddl

create table test_tb(
	id int primary key
);

-- 회원
CREATE TABLE user_tb(
	id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    user_role VARCHAR(10) NOT NULL DEFAULT 'user',
    nick_name VARCHAR(10) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    birth_date DATE NOT NULL,
    gender VARCHAR(2) NOT NULL,
    external boolean NOT NULL
);

-- 게시판 종류
CREATE TABLE board_type_tb(
	id INT AUTO_INCREMENT PRIMARY KEY,
    board_name VARCHAR(10) NOT NULL UNIQUE
);

-- 게시판 카테고리
CREATE TABLE board_category_tb(
	id INT AUTO_INCREMENT PRIMARY KEY,
    board_type_id INT NOT NULL,
    category_name VARCHAR(10) NOT NULL,
    FOREIGN KEY(board_type_id) REFERENCES board_type_tb(id)
);

-- 게시판
CREATE TABLE board_tb(
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    board_type_id INT NOT NULL,
    category_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    likes INT NOT NULL DEFAULT 0,
    views INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT now(),
    FOREIGN KEY(user_id) REFERENCES user_tb(id) ON DELETE CASCADE,
    FOREIGN KEY(board_type_id) REFERENCES board_type_tb(id) ON DELETE CASCADE,
    FOREIGN KEY(category_id) REFERENCES board_category_tb(id) ON DELETE CASCADE
);

-- 게시판 댓글
CREATE TABLE board_reply_tb(
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    board_id INT NOT NULL,
    content VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT now(),
    FOREIGN KEY(user_id) REFERENCES user_tb(id) ON DELETE CASCADE,
    FOREIGN KEY(board_id) REFERENCES board_tb(id) ON DELETE CASCADE
);

-- 게시판 첨부파일
CREATE TABLE board_file_tb(
	board_id INT NOT NULL,
    raw_file_name VARCHAR(100) NOT NULL,
    encoded_file_name VARCHAR(150) NOT NULL,
    file_type VARCHAR(10) NOT NULL,
    FOREIGN KEY(board_id) REFERENCES board_tb(id) ON DELETE CASCADE
);

-- 신고 카테고리
CREATE TABLE report_category_tb(
	id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(20) NOT NULL UNIQUE
);

-- 신고
CREATE TABLE report_tb(
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    board_id INT NOT NULL,
    content TEXT NOT NULL,
    category_id INT NOT NULL,
    proceed INT NOT NULL DEFAULT 0 COMMENT '운영자가 확인안하면 0 확인하면 1',
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    FOREIGN KEY(user_id) REFERENCES user_tb(id) ON DELETE CASCADE,
    FOREIGN KEY(board_id) REFERENCES board_tb(id) ON DELETE CASCADE,
    FOREIGN KEY(category_id) REFERENCES report_category_tb(id) ON DELETE CASCADE
);


-- 이벤트 공지
CREATE TABLE event_notice_tb(
	id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    content TEXT,
    views INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT now()
);

-- 이벤트 공지 파일
CREATE TABLE event_notice_file_tb(
	event_notice_id INT NOT NULL,
    raw_filename VARCHAR(100) NOT NULL,
    encoded_filename VARCHAR(150) NOT NULL,
    file_type VARCHAR(5) NOT NULL
);

-- 1:1 문의(질문)
CREATE TABLE question_tb(
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    proceed INT NOT NULL DEFAULT 0 COMMENT '답장여부 확인안하면 0 확인하면 1',
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    FOREIGN KEY(user_id) REFERENCES user_tb(id)
);

-- 1:1 문의(답)
CREATE TABLE answer_tb(
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT now(),
	FOREIGN KEY(user_id) REFERENCES user_tb(id)
);

-- faq 카테고리
CREATE TABLE faq_category_tb(
	id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE
);

-- faq
CREATE TABLE faq_tb(
	id INT AUTO_INCREMENT PRIMARY KEY,
    faq_category_id INT NOT NULL,
    question TEXT NOT NULL,
    answer TEXT NOT NULL,
    FOREIGN KEY(faq_category_id) REFERENCES faq_category_tb(id)
);

-- 연재문의
CREATE TABLE application_tb(
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    filename VARCHAR(150) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT now(),
	FOREIGN KEY(user_id) REFERENCES user_tb(id)
);

-- 장르
CREATE TABLE genre_tb(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(10) NOT NULL
);

-- 서비스 타입
CREATE TABLE service_type_tb(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(10) NOT NULL
);

-- 작품
CREATE TABLE novel_tb(
	id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    genre_id INT NOT NULL,
    service_type_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    overview TEXT NOT NULL,
    serial_cycle VARCHAR(1) NOT NULL,
    cover VARCHAR(255) ,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES user_tb(id) ON DELETE CASCADE,
    FOREIGN KEY(genre_id) REFERENCES genre_tb(id) ON DELETE CASCADE,
    FOREIGN KEY(service_type_id) REFERENCES service_type_tb(id) ON DELETE CASCADE
);

-- 소설 각 회차 
CREATE TABLE novel_section_tb(
	id INT PRIMARY KEY AUTO_INCREMENT,
    novel_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    recommend INT DEFAULT 0,
    favorite INT DEFAULT 0,
    views INT DEFAULT 0,
    list_price INT NOT NULL DEFAULT 0 COMMENT '정가',
    current_price INT NOT NULL DEFAULT 0 COMMENT '현재가',
    FOREIGN KEY (novel_id) REFERENCES novel_tb(id) ON DELETE CASCADE
);

-- 회차 댓글
CREATE TABLE  novel_reply_tb(
	id INT PRIMARY KEY AUTO_INCREMENT,
    board_id INT NOT NULL,
    user_id INT NOT NULL,
    content VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(board_id) REFERENCES novel_tb(id) ON DELETE CASCADE,
    FOREIGN KEY(user_id) REFERENCES user_tb(id) ON DELETE CASCADE
);


-- 평점
CREATE TABLE score_tb(
	user_id INT,
	section_id INT,
    service_type_id INT,
    score INT NOT NULL,
    PRIMARY KEY(user_id, section_id),
    FOREIGN KEY(user_id) REFERENCES user_tb(id) ON DELETE CASCADE,
    FOREIGN KEY(section_id) REFERENCES novel_section_tb(id) ON DELETE CASCADE,
    FOREIGN KEY(service_type_id) REFERENCES service_type_tb(id) ON DELETE CASCADE
);


-- 공모전
CREATE TABLE contest_tb(
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    begin_created_at TIMESTAMP DEFAULT NOW(),
    end_created_at TIMESTAMP NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES user_tb(id)
);

-- 공모전 게시판
CREATE TABLE contest_novel_tb(
    id INT PRIMARY KEY AUTO_INCREMENT,
    genre_id INT NOT NULL,
    user_id INT NOT NULL,
    contest_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    recommend INT NOT NULL DEFAULT '0',
    favorite INT NOT NULL DEFAULT '0',
    view INT NOT NULL DEFAULT '0',
    FOREIGN KEY(genre_id) REFERENCES genre_tb(id),
    FOREIGN KEY(user_id) REFERENCES user_tb(id),
    FOREIGN KEY(contest_id) REFERENCES contest_tb(id)
);

-- 즐겨찾기
CREATE TABLE user_favorite_tb(
	user_id INT NOT NULL,
	novel_id INT NOT NULL,
	PRIMARY KEY (user_id, novel_id),
	FOREIGN KEY (user_id) REFERENCES user_tb(id),
	FOREIGN KEY (novel_id) REFERENCES novel_tb(id)
);

-- 유저가 결제한 회차
CREATE TABLE user_library_tb(
	user_id INT NOT NULL,
	section_id INT NOT NULL,
	PRIMARY KEY (user_id, section_id),
	FOREIGN KEY (user_id) REFERENCES user_tb(id),
	FOREIGN KEY (section_id) REFERENCES novel_section_tb(id)
);
