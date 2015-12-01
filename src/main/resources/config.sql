CREATE DATABASE bookmark_sharing;

use mysql;

create user 'bookmark'@'localhost' identified by 'gom0119!1';

grant all privileges on bookmark_sharing.* to 'bookmark'@'localhost';

FLUSH PRIVILEGES;

use bookmark_sharing;

CREATE TABLE  IF NOT EXISTS member
(
  id INT AUTO_INCREMENT PRIMARY KEY,
  password VARCHAR (20) NOT NULL ,
  email VARCHAR (30) NOT NULL UNIQUE ,
  nickname VARCHAR (20) NOT NULL
);

CREATE TABLE  IF NOT EXISTS book
(
  id INT AUTO_INCREMENT PRIMARY KEY,
  writer VARCHAR(20) NOT NULL ,
  publisher VARCHAR(20) NOT NULL ,
  introduce VARCHAR(500)
) ENGINE = InnoDB;

CREATE TABLE  IF NOT EXISTS bookmark_card
(
  id        INT AUTO_INCREMENT PRIMARY KEY,
  member_id INT NOT NULL ,
  book_id   INT NOT NULL ,
  tag       VARCHAR(100),
  pharse VARCHAR(1000) NOT NULL ,
  FOREIGN KEY(member_id) REFERENCES member(id)
    ON DELETE CASCADE,
  FOREIGN KEY (book_id) REFERENCES book(id)
    ON DELETE CASCADE
) ENGINE = InnoDB;

CREATE TABLE  IF NOT EXISTS comments
(
  id INT AUTO_INCREMENT PRIMARY KEY,
  bookmark_card_id INT NOT NULL ,
  comment VARCHAR(127) NOT NULL ,
  FOREIGN KEY (bookmark_card_id) REFERENCES bookmark_card(id)
  ON DELETE CASCADE
) ENGINE = InnoDB;

CREATE TABLE  IF NOT EXISTS bookmarker
(
  id INT AUTO_INCREMENT PRIMARY KEY,
  member_id INT NOT NULL ,
  bookmark_card_id INT NOT NULL ,
  FOREIGN KEY(member_id) REFERENCES member(id)
  ON DELETE CASCADE ,
  FOREIGN KEY (bookmark_card_id) REFERENCES bookmark_card(id)
  ON DELETE CASCADE
) ENGINE = InnoDB;