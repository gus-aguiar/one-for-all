DROP DATABASE IF EXISTS SpotifyClone;
  CREATE DATABASE IF NOT EXISTS SpotifyClone;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`planos`
-- -----------------------------------------------------
CREATE TABLE SpotifyClone.planos (
  plano_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  plano VARCHAR(200) NOT NULL,
  valor_plano DECIMAL(6,2) NOT NULL
  )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE SpotifyClone.usuarios (
    usuario_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    usuario_nome VARCHAR(200) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    data_assinatura DATE NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES SpotifyClone.planos(plano_id)     
  )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`artistas`
-- -----------------------------------------------------
CREATE TABLE SpotifyClone.artistas (
  artista_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  artista VARCHAR(200) NULL
  )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`albums`
-- -----------------------------------------------------

CREATE TABLE SpotifyClone.albums(
    album_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    album VARCHAR(200) NOT NULL,
    ano_lancamento YEAR NOT NULL,
    artista_id INT NOT NULL,

    FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)

) engine = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`cancoes`
-- -----------------------------------------------------
CREATE TABLE SpotifyClone.cancoes(
    cancao_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    cancao VARCHAR(200) NOT NULL,
    duracao_segundos INT NOT NULL,
    album_id INT NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albums (album_id),
    FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
) engine = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`reproducoes`
-- -----------------------------------------------------
CREATE TABLE SpotifyClone.reproducoes(
    cancao_id INT NOT NULL,
    data_reproducao DATETIME NOT NULL,
    usuario_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (cancao_id, data_reproducao, usuario_id),
    FOREIGN KEY (cancao_id ) REFERENCES cancoes (cancao_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id)
) engine = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`seguidores`
-- -----------------------------------------------------
CREATE TABLE SpotifyClone.seguidores(
    usuario_id INT NOT NULL,
    artista_id INT NOT NULL,

    CONSTRAINT PRIMARY KEY (usuario_id, artista_id),

    FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
    FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
) engine = InnoDB;

-- -----------------------------------------------------
-- Inserts
-- -----------------------------------------------------

INSERT INTO SpotifyClone.planos (plano, valor_plano) VALUES
    ('gratuito', 0),
	('universitário', 5.99),
	('pessoal', 6.99),
	('familiar', 7.99);

INSERT INTO SpotifyClone.artistas (artista) VALUES
	('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');

INSERT INTO SpotifyClone.usuarios (usuario_nome, idade, plano_id, data_assinatura) VALUES
	('Barbara Liskov', 82, 1, '2019-10-20'),
	('Robert Cecil Martin', 58, 1, '2017-01-06'),
	('Ada Lovelace', 37, 4, '2017-12-30'),
	('Martin Fowler', 46, 4, '2017-01-17'),
	('Sandi Metz', 58, 4, '2018-04-29'),
	('Paulo Freire', 19, 2, '2018-02-14'),
	('Bell Hooks', 26, 2, '2018-01-05'),
	('Christopher Alexander', 85, 3, '2019-06-05'),
	('Judith Butler', 45, 3, '2020-05-13'),
	('Jorge Amado', 58, 3, '2017-02-17');

INSERT INTO SpotifyClone.albums (album, artista_id, ano_lancamento) VALUES
    ("Renaissance", 1, 2022),
    ("Jazz", 2, 1978),
    ("Hot Space", 2, 1982),
    ("Falso Brilhante", 3, 1998),
    ("Vento de Maio", 3, 2001),
    ("QVVJFA?", 4, 2003),
    ("Somewhere Far Beyond", 5, 2007),
    ("I Put A Spell On You", 6, 2012);

INSERT INTO SpotifyClone.cancoes (cancao, duracao_segundos, album_id, artista_id) VALUES
    ("BREAK MY SOUL", 279, 1, 1),
    ("VIRGO'S GROOVE", 369, 1, 1),
    ("ALIEN SUPERSTAR", 116, 1, 1),
    ("Don't Stop Me Now", 203, 2, 2),
    ("Under Pressure", 152, 3, 2),
    ("Como Nossos Pais", 105, 4, 3),
    ("O Medo de Amar é o Medo de Ser Livre", 207, 5, 3),
    ("Samba em Paris", 267, 6, 4),
    ("The Bard's Song", 244, 7, 5),
    ("Feeling Good", 100, 8, 6);

INSERT INTO SpotifyClone.reproducoes (usuario_id, cancao_id, data_reproducao) VALUES
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
  
  INSERT INTO SpotifyClone.seguidores (usuario_id, artista_id) VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 1),
    (6, 6),
    (7, 6),
    (9, 3),
    (10, 2);