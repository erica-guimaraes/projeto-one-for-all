DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos(
plano_id int primary key auto_increment,
nome_plano varchar(20) not null,
valor_plano decimal(3,2) not null
) engine = InnoDB;

CREATE TABLE pessoas_usuarias(
pessoa_usuaria_id int primary key auto_increment,
name_pessoa_usuaria varchar(50) not null,
idade int not null,
data_assinatura date not null,
plano_id int not null,
foreign key(plano_id) references planos(plano_id)
) engine = InnoDB;

CREATE TABLE artistas(
artista_id int primary key auto_increment,
nome_artista varchar(50) not null
) engine = InnoDB;

CREATE TABLE seguidores(
pessoa_usuaria_id int not null,
artista_id int not null,
primary key(pessoa_usuaria_id, artista_id),
foreign key(pessoa_usuaria_id) references pessoas_usuarias(pessoa_usuaria_id),
foreign key(artista_id) references artistas(artista_id)
) engine = InnoDB;

CREATE TABLE albuns(
album_id int primary key auto_increment,
nome_album varchar(50) not null,
artista_id int not null,
ano_lancamento year not null,
foreign key(artista_id) references artistas(artista_id)
) engine = InnoDB;

CREATE TABLE cancoes(
cancao_id int primary key auto_increment,
nome_cancoes varchar(50) not null,
duracao_segundos smallint not null,
album_id int not null,
foreign key(album_id) references albuns(album_id)
) engine = InnoDB;

CREATE TABLE historico_de_reproducao(
data_reproducao datetime not null,
pessoa_usuaria_id int not null,
cancao_id int not null,
primary key(pessoa_usuaria_id, cancao_id),
foreign key(pessoa_usuaria_id) references pessoas_usuarias(pessoa_usuaria_id),
foreign key(cancao_id) references cancoes(cancao_id)
) engine = InnoDB;

INSERT INTO planos (plano_id, nome_plano, valor_plano)
VALUES
(1, 'gratuito', '0'),
(2, 'familiar', '7.99'),
(3, 'universitário', '5.99'),
(4, 'pessoal', '6.99');

INSERT INTO pessoas_usuarias (pessoa_usuaria_id, name_pessoa_usuaria, idade, data_assinatura, plano_id)
VALUES
(1, 'Barbara Liskov', 82, '2019-10-20', 1),
(2, 'Robert Cecil Martin', 58, '2017-01-06', 1),
(3, 'Ada Lovelace', 37, '2017-12-30', 2),
(4, 'Martin Fowler', 46, '2017-01-17', 2),
(5, 'Sandi Metz', 58, '2018-04-29', 2),
(6, 'Paulo Freire', 19, '2018-02-14', 3),
(7, 'Bell Hooks', 26,'2018-01-05', 3),
(8, 'Christopher Alexander', 85, '2019-06-05', 4),
(9, 'Judith Butler', 45, '2020-05-13', 4),
(10, 'Jorge Amado', 58, '2017-02-17', 4);

INSERT INTO artistas (artista_id, nome_artista)
VALUES
(1, 'Beyoncé'),
(2, 'Queen'),
(3, 'Elis Regina'),
(4, 'Baco Exu do Blues'),
(5, 'Blind Guardian'),
(6, 'Nina Simone');

INSERT INTO seguidores (pessoa_usuaria_id, artista_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(4, 4),
(5, 5),
(5, 6),
(6, 6),
(6, 1),
(7, 6),
(9, 3),
(10, 2);

INSERT INTO albuns (album_id, nome_album, artista_id, ano_lancamento)
VALUES
(1, 'Renaissance', 1, '2022'),
(2, 'Jazz', 2, '1978'),
(3, 'Hot Space', 2, '1982'),
(4, 'Falso Brilhante', 3, '1998'),
(5, 'Vento de Maio', 3, '2001'),
(6, 'QVVJFA?', 4, '2003'),
(7, 'Somewhere Far Beyond', 5, '2007'),
(8, 'I Put A Spell On You', 6, '2012');

INSERT INTO cancoes (cancao_id, nome_cancoes, duracao_segundos, album_id)
VALUES
(1, 'BREAK MY SOUL', 279, 1),
(2, 'VIRGOS GROOVE', 369, 1),
(3, 'ALIEN SUPERSTAR', 116, 1),
(4, 'Dont Stop Me Now', 203, 2),
(5, 'Under Pressure', 152, 3),
(6, 'Como Nossos Pais', 105, 4),
(7, 'O Medo de Amar é o Medo de Ser Livre', 207, 5),
(8, 'Samba em Paris', 267, 6),
(9, 'The Bards Song', 244, 7),
(10, 'Feeling Good', 100, 8);

INSERT INTO historico_de_reproducao (pessoa_usuaria_id, cancao_id, data_reproducao)
VALUES
(1, 8, '2022-02-28 10:45:55'),
(1, 2, '2020-05-02 05:30:35'),
(1, 10, '2020-03-06 11:22:33'),
(2, 10, '2022-08-05 08:05:17'),
(2, 7, '2020-01-02 07:40:33'),
(3, 10, '2020-11-13 16:55:13'),
(3, 2, '2020-12-05 18:38:30'),
(4, 8, '2021-08-15 17:10:10'),
(5, 8, '2022-01-09 01:44:33'),
(5, 5, '2020-08-06 15:23:43'),
(6, 7, '2017-01-24 00:31:17'),
(6, 1, '2017-10-12 12:35:20'),
(7, 4, '2011-12-15 22:30:49'),
(8, 4, '2012-03-17 14:56:41'),
(9, 9, '2022-02-24 21:14:22'),
(10, 3, '2015-12-13 08:30:22');