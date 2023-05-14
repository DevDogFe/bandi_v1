-- sample data

insert into test_tb values
(1);

insert into user_tb(username, password, user_role) values
('qwe', '$2a$10$W4axy9AFhjle0fvi1Hh9aucyDv.lV9Ouq8swDKUae6b5qwNIldBy.', 'user');

insert into genre_tb(name) values
('무협'), ('판타지'), ('로맨스'), ('SF');

insert into service_type_tb(name) values
('유료'), ('무료'), ('공모전');