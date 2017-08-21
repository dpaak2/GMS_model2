--id, name, password,ssn,regdate
DROP TABLE Board;
DROP SEQUENCE article_seq;

CREATE SEQUENCE article_seq
 START WITH     1000
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

/*mile stone*/
 -- ***************************
 -- 2017.08.02
 -- [1]MAJOR_TAB
 -- [2]SUBJECT_TAB
 -- [3]MEMBER_TAB
 -- [4]PROF_TAB
 -- [5]STUDENT_TAB
 -- [6]GRADE_TAB
 -- [6]BOARD_TAB
 -- **************************

 
 /* -- [1]MAJOR_TAB*/
CREATE TABLE Member(
	member_id VARCHAR2(10),
	name VARCHAR2(20),
	password VARCHAR2(10),
	ssn VARCHAR2(20),
	regdate DATE,
	PRIMARY KEY(id)
);



/* -- [6]BOARD_TAB*/
CREATE TABLE Board(
	article_seq NUMBER,
	id VARCHAR2(10),
	title VARCHAR2(20),
	content VARCHAR2(100),
	regdate DATE,
	hitcount NUMBER,
	PRIMARY KEY (article_seq),
	FOREIGN KEY (member_id) REFERENCES  Member(member_id)	ON DELETE CASCADE
);

select * from tab;

CREATE TABLE Student (
	member_id varchar2(10),
	stu_no varchar2(8),
	PRIMARY KEY (member_id),
	FOREIGN KEY (member_id) REFERENCES Member(member_id) ON DELETE CASCADE
);

CREATE TABLE Prof (
	member_id varchar2(10),
	salary varchar2(10),
	PRIMARY KEY (member_id),
	FOREIGN KEY (member_id) REFERENCES Member(member_id) ON DELETE CASCADE
);

select * from tab;

/*column 이름 바꿀때*/
ALTER TABLE Member RENAME COLUMN id TO member_id; 
ALTER TABLE Board RENAME C
OLUMN id TO member_id; 
ALTER TABLE Grade RENAME COLUMN id TO member_id; 
select * from Member;
select * from Board;
select * from Grade;

DROP SEQUENCE article_seq;

CREATE SEQUENCE seq
START WITH 2000
INCREMENT BY 1
NOCACHE
NOCYCLE;


--DDL
CREATE TABLE MAJOR(
	major_id varchar2(10),
	title varchar2(10),
	primary key (major_id)
);

--DML
INSERT INTO Major () VALUES 




