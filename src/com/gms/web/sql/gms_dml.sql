--C,R,U,D 
--id, name, password,ssn,regdate
--QUERY- select -> search에 해당하는것을 
SELECT * FROM MEMBER;
SELECT COUNT(*) as member_count FROM MEMBER; 

INSERT INTO MEMBER(id, name, password,ssn,regdate)
VALUES('hong','홍길동','1','800101-123456',SYSDATE);
INSERT INTO Member(id, name, password,ssn,regdate) VALUES('kim','김유신','1','810102-123456',SYSDATE);
INSERT INTO Member(id, name, password,ssn,regdate) VALUES('yoo','유관순','1','930701-222222',SYSDATE);
INSERT INTO Member(id, name, password,ssn,regdate) VALUES('han','한채아','1','940506-212324',SYSDATE);
INSERT INTO Member(id, name, password,ssn,regdate) VALUES('myoo','유재석','1','800901-123456',SYSDATE);
INSERT INTO Member(id, name, password,ssn,regdate) VALUES('byeon','변용주','1','861014-123456',SYSDATE);
INSERT INTO Member(id, name, password,ssn,regdate) VALUES('choi','조봉기','1','871010-123456',SYSDATE);
INSERT INTO Member(id, name, password,ssn,regdate) VALUES('hkim','김한슬','1','900117-212345',SYSDATE);
INSERT INTO Member(id, name, password,ssn,regdate) VALUES('pjk','박정관','1','990101-123456',SYSDATE);
INSERT INTO Member(id, name, password,ssn,regdate) VALUES('ykim','김유신','1','840604-123456',SYSDATE);
INSERT INTO Member(id, name, password,ssn,regdate) VALUES('skim','김유신','1','880604-123456',SYSDATE);
INSERT INTO Member(id, name, password, ssn, regdate) VALUES('jinjin','김진은','1','930929-212345',SYSDATE);

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







