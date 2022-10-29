DROP DATABASE IF EXISTS SpotifyClone;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS SpotifyClone;
CREATE TABLE IF NOT EXISTS SpotifyClone.plan (
  plan_id INT NOT NULL AUTO_INCREMENT,
  plan VARCHAR(45) NOT NULL,
  value_plan DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (plan_id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.user (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  data_assinatura VARCHAR(100) NOT NULL,
  name_user VARCHAR(100) NOT NULL,
  idade INT NOT NULL,
  plan_id INT NOT NULL,
  PRIMARY KEY (`user_id`),
    FOREIGN KEY (plan_id)
    REFERENCES SpotifyClone.plan (plan_id))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS SpotifyClone.artist (
  artist_id INT NOT NULL AUTO_INCREMENT,
  name_artist VARCHAR(50) NOT NULL,
  PRIMARY KEY (artist_id))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS SpotifyClone.album (
  album_id INT NOT NULL AUTO_INCREMENT,
  name_album VARCHAR(45) NOT NULL,
  year_album YEAR NOT NULL,
  artist_id INT NOT NULL,
  PRIMARY KEY (album_id),
    FOREIGN KEY (artist_id)
    REFERENCES SpotifyClone.artist (artist_id))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS SpotifyClone.song_table (
  song_id INT NOT NULL AUTO_INCREMENT,
  duration_seconds INT NOT NULL,
  name_song VARCHAR(50) NOT NULL,
  album_id INT NOT NULL,
  PRIMARY KEY (song_id),
    FOREIGN KEY (album_id)
    REFERENCES SpotifyClone.album (album_id))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS SpotifyClone.reproduction_hist (
  `user_id` INT NOT NULL,
  song_id INT NOT NULL,
  date_reproduction TIMESTAMP NOT NULL,
  CONSTRAINT PRIMARY KEY (`user_id`, song_id),
    FOREIGN KEY (`user_id`)
    REFERENCES SpotifyClone.user (`user_id`),
    FOREIGN KEY (song_id)
    REFERENCES SpotifyClone.song_table (song_id))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS SpotifyClone.following_artist (
  artist_id INT NOT NULL,
  `user_id` INT NOT NULL,
  CONSTRAINT PRIMARY KEY (artist_id, `user_id`),
    FOREIGN KEY (artist_id)
    REFERENCES artist (artist_id),
    FOREIGN KEY (`user_id`)
    REFERENCES SpotifyClone.user (`user_id`))
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO SpotifyClone.plan (plan, value_plan)
 VALUES
   ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

INSERT INTO SpotifyClone.user (name_user, idade, plan_id, data_assinatura)
  VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 2, '2017-12-30'),
    ('Martin Fowler', 46, 2, '2017-01-17'),
    ('Sandi Metz', 58, 2, '2018-04-29'),
    ('Paulo Freire', 19, 3, '2018-02-14'),
    ('Bell Hooks', 26, 3, '2018-01-05'),
    ('Christopher Alexander', 85, 4, '2019-06-05'),
    ('Judith Butler', 45, 4, '2020-05-13'),
    ('Jorge Amado', 58, 4, '2017-02-17');
INSERT INTO SpotifyClone.artist (name_artist)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');
INSERT INTO SpotifyClone.album (name_album, artist_id, year_album)
  VALUES
    ('Renaissance', '1', 2022),
    ('Jazz', '2', 1978),
    ('Hot Space', '2', 1982),
    ('Falso Brilhante', '3', 1998),
    ('Vento de Maio', '3', 2001),
    ('QVVJFA?', '4', 2003),
    ('Somewhere Far Beyond', '5', 2007),
    ('I Put A Spell On You', '6', 2012);

INSERT INTO SpotifyClone.song_table (name_song, duration_seconds, album_id)
  VALUES
   ('BREAK MY SOUL', 279, 1),
   ('VIRGO’S GROOVE', 369, 1),
   ('ALIEN SUPERSTAR', 116, 1),
   ('Don’t Stop Me Now', 203, 2),
   ('Under Pressure', 152, 3),
   ('Como Nossos Pais', 105, 4),
   ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
   ('Samba em Paris', 267, 6),
   ('The Bard’s Song', 244, 7),
   ('Feeling Good', 100, 8);
INSERT INTO SpotifyClone.reproduction_hist (`user_id`, song_id, date_reproduction)
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

INSERT INTO SpotifyClone.following_artist (`user_id`, artist_id)
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
