--id, name, password,ssn,regdate
DROP TABLE Board;
DROP SEQUENCE article_seq;

CREATE SEQUENCE article_seq
 START WITH     1000
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;



CREATE TABLE Member(
	id VARCHAR2(10),
	name VARCHAR2(20),
	password VARCHAR2(10),
	ssn VARCHAR2(20),
	regdate DATE,
	PRIMARY KEY(id)
);

CREATE TABLE Board(
	article_seq NUMBER,
	id VARCHAR2(10),
	title VARCHAR2(20),
	content VARCHAR2(100),
	regdate DATE,
	hitcount NUMBER,
	PRIMARY KEY (article_seq),
	FOREIGN KEY (id) REFERENCES  Member(id)	ON DELETE CASCADE
);

