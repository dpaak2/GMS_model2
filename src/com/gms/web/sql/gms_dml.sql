--id, name, password,ssn,regdate
DROP TABLE Board;

DROP SEQUENCE seq;

CREATE SEQUENCE seq
 START WITH     2000
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
 -- [7]BOARD_TAB
 -- **************************

 select * from MEMBER;
 select * from MAJOR;
 
 /* -- [1]MAJOR_TAB*/
 --DDL
CREATE TABLE MAJOR(
	major_id varchar2(10),
	title varchar2(10),
	primary key (major_id)
);
alter table major add member_id varchar2(10);
alter table major add subj_id varchar2(10);

select * from MAJOR;
 --DML
INSERT INTO Major () VALUES ();


 -- [2]SUBJECT_TAB
 CREATE TABLE Subject(
	subj_id varchar2(10),
	title varchar2(10),
	major_id vachar2(10),
	primary key (subj_id),
	FOREIGN KEY (major_id) REFERENCES  Major(major_id)	ON DELETE CASCADE
);

 --DML
INSERT INTO Subject () VALUES ();

/*******************
 * 
 *  -- [3]MEMBER_TAB
 * */
SELECT * FROM MEMBER;

CREATE TABLE Member(
	member_id VARCHAR2(10),
	name VARCHAR2(20),
	password VARCHAR2(10),
	ssn VARCHAR2(20),
	regdate DATE,
	major_id VARCHAR2(10),
	phone varchar2(20),
	email varchar2(20),
	profile varchar2(20),
	PRIMARY KEY(member_id),
	FOREIGN KEY (major_id) REFERENCES  Major(major_id)	ON DELETE CASCADE
);

--DML
INSERT INTO Member () VALUES ();
SELECT * FROM MEMBER;



/*******************
 *  -- [4]PROF_TAB
 * */

CREATE TABLE Prof (
	member_id varchar2(10),
	salary varchar2(10),
	PRIMARY KEY (member_id),
	FOREIGN KEY (member_id) REFERENCES Member(member_id) ON DELETE CASCADE
);

--DML
INSERT INTO Prof (member_id,salary) VALUES ('james','10000');

/*************************
 *  -- [5]STUDENT_TAB
 * */
--DDL
CREATE TABLE Student (
	member_id varchar2(10),
	stu_no varchar2(8),
	PRIMARY KEY (member_id),
	FOREIGN KEY (member_id) REFERENCES Member(member_id) ON DELETE CASCADE
);


--DML /
INSERT INTO  (member_id,stu_no) VALUES ('han','20110111');
INSERT INTO  (member_id,stu_no) VALUES ('kim','20110112');
INSERT INTO  (member_id,stu_no) VALUES ('yoo','20110113');


/*******************
 *  -- [6]GRADE_TAB
 * ******************/
CREATE TABLE Grade (
	grade_seq NUMBER,
	score varchar2(3),
	exam_date varchar2(13),
	member_id varchar2(10),
	subj_id varchar2(10),
	PRIMARY KEY (grade_seq),
	FOREIGN KEY (member_id) REFERENCES Member(member_id) ON DELETE CASCADE,
	FOREIGN KEY (subj_id) REFERENCES Subject(subj_id) ON DELETE CASCADE
);

ALTER table id TO member_id;
DROP TABLE Grade;
select * from tab;

--DML /gRADE
INSERT INTO Grade(grade_seq,score,exam_date,member_id,subj_id) VALUES(seq.nextval,'90','2017-03','yoo','java');
INSERT INTO Grade(grade_seq,score,exam_date,member_id,subj_id) VALUES(seq.nextval,'70','2017-04','yoo','java');
INSERT INTO Grade(grade_seq,score,exam_date,member_id,subj_id) VALUES(seq.nextval,'66','2017-05','yoo','java');
INSERT INTO Grade(grade_seq,score,exam_date,member_id,subj_id) VALUES(seq.nextval,'57','2017-06','yoo','java');


INSERT INTO Grade(grade_seq,score,exam_date,member_id,subj_id) VALUES(seq.nextval,'90','2017-03','kim','java');
INSERT INTO Grade(grade_seq,score,exam_date,member_id,subj_id) VALUES(seq.nextval,'100','2017-04','kim','java');
INSERT INTO Grade(grade_seq,score,exam_date,member_id,subj_id) VALUES(seq.nextval,'88','2017-05','kim','java');
INSERT INTO Grade(grade_seq,score,exam_date,member_id,subj_id) VALUES(seq.nextval,'96','2017-06','kim','java');


INSERT INTO Grade(grade_seq,score,exam_date,member_id,subj_id) VALUES(seq.nextval,'90','2017-03','han','java');
INSERT INTO Grade(grade_seq,score,exam_date,member_id,subj_id) VALUES(seq.nextval,'88','2017-04','han','java');
INSERT INTO Grade(grade_seq,score,exam_date,member_id,subj_id) VALUES(seq.nextval,'77','2017-05','han','java');
INSERT INTO Grade(grade_seq,score,exam_date,member_id,subj_id) VALUES(seq.nextval,'45','2017-06','han','java');


select * from Subject;
select * from Member;
select * from Prof;
select * from Grade;
DELETE FROM Prof WHERE member_id='hong';


/*******************
 *  -- [7]BOARD_TAB
 * ******************/
CREATE TABLE Board(
	article_seq NUMBER,
	member_id VARCHAR2(10),
	title VARCHAR2(20),
	content VARCHAR2(100),
	regdate DATE,
	hitcount NUMBER,
	PRIMARY KEY (article_seq),
	FOREIGN KEY (member_id) REFERENCES Member(member_id) ON DELETE CASCADE
);



select * from tab;



select * from tab;

/*column 이름 바꿀때*/
ALTER TABLE Member RENAME COLUMN id TO member_id; 
ALTER TABLE Board RENAME C
OLUMN id TO member_id; 
ALTER TABLE Grade RENAME COLUMN id TO member_id; 
select * from Member;
select * from Board;
select * from Grade;

DROP SEQUENCE seq;

CREATE SEQUENCE seq
 START WITH 2000
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;

/*5중 join*/
select distinct m.member_id, m.name, mj.title as major, g.score, sj.title as subject
from member m, Student s,grade g,subject sj, major mj 
where m.member_id =s.member_id
and m.member_id=g.member_id
and sj.major_id=mj.major_id
and sj.subj_id=g.subj_id;  

select * from tab;

/*member id를 입력하면 평균점수를 반환하는 sql*/
SELECT avg(score) 
FROM (select distinct
m.member_id AS id, m.name, mj.title  as major ,g.score, sj.title as subject
from member m,Student s,grade g,subject sj, major mj 
where m.member_id =s.member_id
		and m.member_id=g.member_id
		and sj.major_id=mj.major_id
		and sj.subj_id=g.subj_id) t
		WHERE t.id='han';
		
		
/*inner join*/
SELECT *
FROM (select 
	 m.member_id id, m.name, g.score score, g.exam_date exam_date
 from Board b
	 join Subject s on g.subj_id = s.subj_id
	 join Member m on m.member_id = g.member_id
	 ) t
WHERE t.id='yoo';
	 
/*Board와 Member 에서 member_id */
SELECT * FROM board b, Member m
where b.member_id = m.member_id;

/*Board와 Member 에서 member_id */


select * 
from Board b inner join member m 
on b.member_id = m.member_id
where m.member_id ='yoo';


/*************************************/
select * from Member;
select * from Student;
select * from Board;


 -- ***************************
 -- 2017.08.02

 -- **************************




--C,R,U,D 
--QUERY- select -> search에 해당하는것을 
SELECT * FROM MEMBER;
SELECT COUNT(*) as member_count FROM MEMBER; 

/*mile stone*/
 -- ***************************
 -- MEBMER TABLE
 -- 2017.08.02
 -- 회원 관리 테이블
 -- member_id, name, password,ssn,regdate,major_id,phone,email,profile
 -- ****************************
INSERT INTO MEMBER(id, name, password,ssn,regdate)
VALUES('hong','홍길동','1','800101-123456',SYSDATE);
INSERT INTO Member(member_id, name, password,ssn,regdate,major_id,phone,email,profile) VALUES('kim','김유신','1','810102-123456',SYSDATE);
INSERT INTO Member(member_id, name, password,ssn,regdate) VALUES('yoo','유관순','1','930701-222222',SYSDATE);
INSERT INTO Member(member_id, name, password,ssn,regdate) VALUES('han','한채아','1','940506-212324',SYSDATE);
INSERT INTO Member(member_id, name, password,ssn,regdate) VALUES('myoo','유재석','1','800901-123456',SYSDATE);
INSERT INTO Member(member_id, name, password,ssn,regdate) VALUES('byeon','변용주','1','861014-123456',SYSDATE);
INSERT INTO Member(member_id, name, password,ssn,regdate) VALUES('choi','조봉기','1','871010-123456',SYSDATE);
INSERT INTO Member(member_id, name, password,ssn,regdate) VALUES('hkim','김한슬','1','900117-212345',SYSDATE);
INSERT INTO Member(member_id, name, password,ssn,regdate) VALUES('pjk','박정관','1','990101-123456',SYSDATE);
INSERT INTO Member(member_id, name, password,ssn,regdate) VALUES('ykim','김유신','1','840604-123456',SYSDATE);
INSERT INTO Member(member_id, name, password,ssn,regdate) VALUES('skim','김유신','1','880604-123456',SYSDATE);
INSERT INTO Member(member_id, name, password, ssn, regdate) VALUES('jinjin','김진은','1','930929-212345',SYSDATE);

/*교수 insert*/
INSERT INTO Member(member_id, name, password,ssn,regdate,major_id,phone,email,profile) VALUES('mankiew','맨큐','1','700102-123456',SYSDATE,'econimics','010-1234-1234','mankiew@test.com','defaultimg.jpg');
INSERT INTO Member(member_id, name, password,ssn,regdate,major_id,phone,email,profile) VALUES('james','제임스','1','550519-123456',SYSDATE,'computer','010-1111-1111','james@test.com','defaultimg.jpg');
INSERT INTO Member (member_id, name, password,ssn,regdate,major_id,phone,email,profile) VALUES('bare','베어','1','830105-123456',SYSDATE,'tourism','010-1234-5555','bare@test.com','defaultimg.jpg'); 
INSERT INTO Member (member_id, name, password,ssn,regdate,major_id,phone,email,profile) VALUES('gogh','고흐','1','530105-123456',SYSDATE,'art','010-1234-6666','gogh@test.com','defaultimg.jpg');


SELECT * FROM Member WHERE name='';
DELETE FROM MEMBER WHERE id='null';
SELECT * FROM MEMBER WHERE name LIKE '%나경신%';


SELECT * FROM Board;
SELECT COUNT(*) as article_count FROM Board; 
 INSERT INTO Board (article_seq,id,title,content,hitcount,regdate) VALUES (article_seq.nextval,'hong','길동이의 길','길동이가 아버지를 찾아 길을 떠났습니다.',1,SYSDATE);
 INSERT INTO Board (article_seq,id,title,content,hitcount,regdate) VALUES (article_seq.nextval,'hong','호부호형(呼父呼兄) ','호부호형(呼父呼兄) : 아버지라 부르고 형이라 부름.',0,SYSDATE);
 INSERT INTO Board (article_seq,id,title,content,hitcount,regdate)
 VALUES (article_seq.nextval,'hong','절언대지(絶言大地)','말을 못할 정도로 좋은 경치나, 땅이나, 풍경 이런 뜻이 아닐까 생각됩니다.',0,SYSDATE);
 INSERT INTO Board (article_seq,id,title,content,hitcount,regdate) VALUES (article_seq.nextval,'hong','길동이 전','홍길동은 조선조 세종 때 서울에 사는 홍판서의 시비 춘섬의 소생인 서자다.',0,SYSDATE);
 INSERT INTO Board (article_seq,id,title,content,hitcount,regdate) VALUES (article_seq.nextval,'yoo','관순이 일기','내 손톱이 빠져 나가고 내 귀와 코가 잘리고 ',0,SYSDATE);
 INSERT INTO Board (article_seq,id,title,content,hitcount,regdate) VALUES (article_seq.nextval,'yoo','유관순 열사','나라를 잃어버린 그 고통만은 견딜 수가 없습니다.',0,SYSDATE);
 INSERT INTO Board (article_seq,id,title,content,hitcount,regdate) VALUES (article_seq.nextval,'pjk','자바란','자바를 공부하세요, 인생이 편해집니다.',0,SYSDATE);
 INSERT INTO Board (article_seq,id,title,content,hitcount,regdate) VALUES (article_seq.nextval,'skim','김유신의 시','보이는 같지 꽃이 원대하고, 쓸쓸하랴? ',0,SYSDATE);
 INSERT INTO Board (article_seq,id,title,content,hitcount,regdate) VALUES (article_seq.nextval,'byeon','롤 하러 가자','생생하며, 가는 너의 끓는 석가는 피어나기 칼이다.',0,SYSDATE);
 INSERT INTO Board (article_seq,id,title,content,hitcount,regdate) VALUES (article_seq.nextval,'choi','봉기봉기','피는 얼음에 속에서 생명을 아니다.',0,SYSDATE);
 INSERT INTO Board (article_seq,id,title,content,hitcount,regdate) VALUES (article_seq.nextval,'han','원질이',' 원질이 일월과 간에 듣기만 영락과 대고, 아름다우냐?',0,SYSDATE);
 INSERT INTO Board (article_seq,id,title,content,hitcount,regdate) VALUES (article_seq.nextval,'skim','꽃이란','싶이 구할 가는 사막이다. 곳으로 꽃 이 구하기 ',0,SYSDATE);
 INSERT INTO Board (article_seq,id,title,content,hitcount,regdate) VALUES (article_seq.nextval,'myoo','여름이다','고 재석 고재석 ㅋ',0,SYSDATE);
 INSERT INTO Board (article_seq,id,title,content,hitcount,regdate) VALUES (article_seq.nextval,'jinjin','그들의 사랑','그들에게 사랑의 없으면, 그들은 같이 인생의 얼마나 봄날의 이것이다.',0,SYSDATE);
 INSERT INTO Board (article_seq,id,title,content,hitcount,regdate) VALUES (article_seq.nextval,'jinjin','광야','광야에서 대중을 우는 설레는 청춘의 위하여서',0,SYSDATE);

 
 
 
 UPDATE table SET column1 = expression1,
    column2 = expression2, column_n = expression_n
[WHERE conditions];

SELECT * FROM Board WHERE article_seq='1014';
UPDATE Board SET title='강아지',content='우리집 강아지는 복슬강아지' WHERE article_seq='1014';
UPDATE Member SET password='2' WHERE id='jinjin';
DELETE FROM Board WHERE article_seq='1014';

SELECT password FROM Member WHERE id LIKE '%jin%';
SELECT  id FROM Board WHERE id LIKE '%o%';
SELECT DISTINCT id FROM Board WHERE id LIKE '%o%';

select * from Prof;
SELECT * FROM Member ORDER BY name,ssn;
SELECT * FROM Member ORDER BY name ASC,ssn DESC; /*이름은 오름차순 가나다라순, 주민번호는 역순 (어린사람부터 )*/

SELECT SUM(article_seq) AS resultSum FROM Board;



SELECT * FROM Member, Board; <!-- 옛날것이다 쓰지 마!!!  -->
select * from Grade;

SELECT * FROM Member m, Board b WHERE m.id=b.id ORDER BY b.regdate DESC;

SELECT * FROM Member m, Board b, Grade g WHERE m.id=b.id AND m.id=g.id;

SELECT * FROM Member m, Board b WHERE m.id= b.id AND ROWNUM <= 2; 

/*BOARD와 MEMBER에서 나이가 어린순으로 이름과 SSN 정렬*/
SELECT DISTINCT ssn, name FROM Member m ,Board b WHERE m.id= b.id AND ROWNUM <=2;

SELECT * FROM Member WHERE 








/*test dummy table and datas*/
create table Stu(
    stuno number primary key,
    name varchar2(20),
    userid varchar2(20),
    grade varchar2(20),
    birthdate varchar2(20),
    tel varchar2(20),
    deptno number,
    profno number,
    height number
);


create table Professor(
    profno number primary key,
    name varchar2(20),
    userid varchar2(20),
    position varchar2(20),
    sal number,
    hiredate varchar2(20),
    comm number,
    deptno number
);



create table Dept(
    deptno number primary key,
    dname varchar2(20),
    college number,
    loc varchar2(20)
);

create table Salgrade(
    grade number primary key,
    losal number,
    hisal number
);

/*Dept*/
 insert into Dept (deptno,dname,college,loc)   values (101,'컴공',100,'1호관');
 insert into Dept (deptno,dname,college,loc)   values (102,'멀티미디어',100,'2호관');
 insert into Dept (deptno,dname,college,loc)   values (201,'전자공학',100,'3호관');
 insert into Dept (deptno,dname,college,loc)   values (202,'기계공학',100,'4호관');
 insert into Dept (deptno,dname,college,loc)   values (100,'정보미디어',10,null);
 insert into Dept (deptno,dname,college,loc)   values (200,'메카',10,null);
 insert into Dept (deptno,dname,college,loc)   values (10,'공과대학',0,null);
 
 /*Salgrade*/
 insert into Salgrade (grade,losal,hisal)   values (1,100,300);
 insert into Salgrade (grade,losal,hisal)   values (2,301,400);
 insert into Salgrade (grade,losal,hisal)   values (3,401,500);
 
 /*professor*/
insert into professor values(9001, '김유신', 'kim', '교수', 500, 2014, 20, 101);
insert into professor values(9002, '홍길동', 'hong', '조교수', 320, 2013, 0, 201);
insert into professor values(9003, '이순신', 'lee', '전임강사', 240, 2015, 0, 102);
insert into professor values(9004, '유관순', 'you', '부교수', 400, 2010, 17, 202);
insert into professor values(9005, '엘리자베스', 'eli', '교수', 600, 2012, 18, 200);

insert into professor values(9006, '자만', 'zaman', '전임강사', 400, 2017, 18, 102);
insert into professor values(9007, '빈', 'bean', '부교수', 400, 2017, 18, 202);
/*student*/
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1000,'송중기','song','1','1985-09-19','010-1234-1234','101','9001','178');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1001,'박보검','park','2','1990-01-02','010-1234-1234','101','9001','183');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1002,'공지철','gong','3','1979-07-10','010-1234-1234','101','9001','184');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1003,'강동원','gang','4','1981-01-18','010-1234-1234','101','9001','186');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1004,'하정우','ha','1','1978-03-11','010-1234-1234','101','9001','183');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1005,'김남길','kim','2','1980-01-08','010-1234-1234','101','9001','170');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1006,'서강준','seo','3','1993-01-01','010-1234-1234','101','9001','183');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1007,'장근석','jang','4','1990-01-01','010-1234-1234','101','9001','165');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1008,'전소미','somi','1','2001-03-09','010-1234-1234','101','9001','168');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1009,'김청하','cheng','2','1995-06-05','010-1234-1234','101','9001','155');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1010,'김도연','doyeoun','3','1999-12-04','010-1234-1234','101','9001','160');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1011,'김소혜','sohae','4','1999-10-24','010-1234-1234','101','9001','154');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1012,'전소미','somsom','1','2001-03-09','010-1234-1234','101','9001','170');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1013,'최유정','yoojung','2','1993-07-01','010-1234-1234','101','9001','156');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1014,'김세정','seajung','3','1994-06-14','010-1234-1234','101','9001','163');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1015,'정채연','chae','4','1993-07-02','010-1234-1234','101','9001','165');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1016,'임나영','nayong','1','1990-01-01','010-1234-1234','101','9001','145');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1017,'강미나','mina','2','1990-01-01','010-1234-1234','101','9001','147');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1018,'유연정','yooyeon','3','1990-03-25','010-1234-1234','101','9001','167');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1019,'이승민','min','4','1989-11-02','010-1234-1234','101','9001','187');

insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1020,'이석훈','hun','4','1989-08-11','010-1234-1234','200','9005','174');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1021,'권재승','seong','1','1996-11-25','010-1234-1234','200','9005','166');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1022,'임시환','sisi','2','1993-06-25','010-1234-1234','200','9005','163');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1023,'강승현','hyun','3','1997-04-08','010-1234-1234','200','9005','163');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1024,'한동근','dong','4','1988-06-28','010-1234-1234','200','9005','180');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1025,'남주혁','joo','1','1994-01-29','010-1234-1234','200','9005','194');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1026,'정수정','soo','2','1994-07-01','010-1234-1234','200','9005','165');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1027,'susan','susan','3','1993-12-22','010-1234-1234','200','9005','163');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1028,'james','jamjam','4','1985-05-19','010-1234-1234','200','9005','188');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1029,'sera','sese','1','1988-04-01','010-1234-1234','200','9005','168');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1030,'christine','christy','2','1996-11-21','010-1234-1234','200','9005','167');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1031,'chris','chirissy','3','1990-05-18','010-1234-1234','200','9005','174');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1032,'paul','paully','3','1993-10-13','010-1234-1234','200','9005','172');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1033,'alex','huabun','4','1990-11-11','010-1234-1234','200','9005','189');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1034,'michael','pope','1','1998-01-01','010-1234-1234','200','9005','180');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1035,'dave','daviy','2','1988-12-01','010-1234-1234','200','9005','190');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1036,'shopia','sophie','3','1990-01-01','010-1234-1234','200','9005','157');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1037,'eden','edens','4','1990-01-01','010-1234-1234','200','9005','154');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1038,'chole','choleee','1','1990-01-13','010-1234-1234','200','9005','167');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1039,'장문복','moonb','1','1998-02-14','010-1234-1234','200','9005','167');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1040,'강다니엘','danny','1','1999-08-13','010-1234-1234','200','9005','167');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1040,'강다니엘','danny','1','1999-08-13','010-1234-1234','200','9005','167');

insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1041,'강다니엘','danny','1','1999-08-13','010-1234-1234','200','9005','167');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1042,'줄리엔강','danny','1','1999-08-13','010-1234-1234','200','9005','167');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1043,'','danny','1','1999-08-13','010-1234-1234','200','9005','167');
insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1044,'강다니엘','danny','1','1999-08-13','010-1234-1234','200','9005','167');



insert into Stu (stuno,name,userid,grade,birthdate,tel,deptno,profno,height) values (1040,'강다니엘','danny','1','1999-08-13','010-1234-1234','200','9005','167');


/*=---------------------------------------------------------------------*/

 select rownum no, m.member_id 아이디, m.name 이름, m.ssn 생일,m.phone 전화번호,
 m.email email,to_char(m.regdate,'yyyy-mm-dd') 등록일
 from Member m 
 join  Major mj
 on m.major_id=mj.major_id;
 
 (( select rownum no, m.member_id 아이디, m.name 이름, m.ssn 생일,m.phone 전화번호,m.major_id 수강과목
 m.email email,to_char(m.regdate,'yyyy-mm-dd') 등록일
 from Member m 
 join  Major mj
 on m.major_id=mj.major_id)
 union 
 (select rownum no, m.member_id 아이디, m.name 이름, m.ssn 생일,m.phone 전화번호,mj.major_id 수강과목
 m.email email,to_char(m.regdate,'yyyy-mm-dd') 등록일
 from Member m 
 join  Major mj
 on m.member_id=mj.member_id)) order by no;
 

 select rownum, t.*
from (
    select a.member_id ID, a.name 이름, a.ssn 생년월일, a.phone 전화, a.email 메일, s.title 수강과목 ,to_char(a.regdate,'yyyy-mm-dd') 등록일
    from member a
        left outer join major m on a.member_id = m.member_id
        left join subject s on m.subj_id = s.subj_id
    order by regdate desc
) t
;

select rownum NO, t.* 
from (select substr(m.ssn,1,6) ssn, m.name, listagg(j.subj_id,',') within group(order by j.subj_id)as subj, substr(m.REGDATE,1) regdate
from member m left join major j using(member_id)
group by m.name, ssn, regdate 
order by m.regdate)t 
order by NO desc;

select rownum, t.*
from (select a.member_id, a.name,rpad(substr(a.ssn,1,7),14,'*') ssn,to_char(a.regdate,'yyyy-MM-dd') regdate,
        a.phone,a.email,listagg(s.title,',') within group(order by s.title) 과목
    from member a
        left  join major m on a.member_id like m.member_id
        left join subject s on m.subj_id like s.subj_id
        group by a.member_id, a.name, a.ssn,a.regdate,a.phone,a.email
        order by regdate desc
) t
  order by rownum desc
;


/***************************************** view ***********************************/
drop view student;

create view student(num,id,name,ssn,regdate,phone,email,title)
as
select rownum num, t.*
from (select a.member_id, a.name,rpad(substr(a.ssn,1,7),14,'*') ssn,to_char(a.regdate,'yyyy-MM-dd') regdate,
        a.phone,a.email,listagg(s.title,',') within group(order by s.title) 과목
    from member a
        left  join major m on a.member_id like m.member_id
        left join subject s on m.subj_id like s.subj_id
        group by a.member_id, a.name, a.ssn,a.regdate,a.phone,a.email
        order by regdate 
) t
  order by rownum desc;
 /******************/
  select rownum, t.*
from (
    select a.mem_id, a.name, a.ssn, a.phone, a.email, LISTAGG(s.title, ',') within group (order by s.title) title, to_char(a.regdate,'yyyy-MM-dd') regdate 
    from member a
        left outer join major m on a.mem_id = m.mem_id
        left join subject s on m.subj_id = s.subj_id
    group by a.mem_id, a.name, a.ssn, a.phone, a.email,a.regdate  
    order by regdate 
) t
order by rownum desc;
  
/***************************pagination************************************************/
/*5명만 나오게 하는것*/
SELECT * FROM student
WHERE rownum <= 5;   /*---> rownum이 5보다 큰것이 나오고*/

/*5명만 한페이지에 나오게 하는것 */
SELECT *
FROM (SELECT * FROM student
WHERE num >(SELECT count(*) FROM student)-5);   /*---> 전체의 개수에서 -5 */



/*결과 값이 없고 schema만 존재 */
SELECT rownum, s.*
FROM student s
WHERE rownum BETWEEN 6 AND 10;


/*원하는 결과값이 나온다*/
SELECT t.*
FROM (SELECT rownum rnum, s.*
   FROM student s)t
   WHERE t.rnum BETWEEN 6 AND 10;
   
/*block 을 신경쓰지 않은 개념 */
 select rownum,s.*
 from student s 
 where rownum between 6 and 10;
 
 select t.*
 from (select rownum rnum, s.*
 from student s)t
 where t.rnum between 6 and 10;
  
 select * from student;
 select * from major;
 
 
 /*block 단위를 계산 해서 가지고 오는 query*/
 select t2.*
 from (select rownum seq, t.*
 from( select * 
 from student
 order  by num DESC )t)t2
 where t2.seq between 1 and 5;
 

 
select count(*) as count from student;
 
 
  select t2.*
 from (select rownum seq, t.*
 from( select * 
 from student
 where name like '%김유신%'
 order  by num DESC )t)t2
 where t2.seq between 1 and 5;
 
 select * from student where name like '%전%';
 
 select t2.*  
 from (select rownum seq,t.*
 from (select *  from student 
 where name like '전'  order by num DESC)t)t2 where t2.seq between 1 and 5;

 /*count*/
 select count(*)  from Student
 where name like '%';
 
 
 SELECT COUNT(*) as student_count  FROM Student where name like '%';
 
 
 
 
