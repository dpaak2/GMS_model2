SELECT * FROM MEMBER;
SELECT * FROM MEMBER;
SELECT COUNT(*) as member_count FROM MEMBER; 

SELECT * FROM Board;
SELECT COUNT(*) as article_count FROM Board; 
SELECT * FROM Board WHERE article_seq='1001';
SELECT * FROM Board WHERE id LIKE '%hong%';
SELECT *FROM Board;

select * from Stu;
select * from member;
select * from MAJOR;



-dept/professor/sutd/salgrade
--전공/교수/학생/
--공과대학의 과목 : 컴공/멀티미디어/전자공학/기계공학/정보미디어/메카)

--공과대학 테이블 이름
SELECT * FROM tab;

--공과대학 교수 테이블 구조
DESC professor;     /*data dictionary*/

--공과대학 부서번호와 이름 [NO.부서명]
SELECT deptno "NO.", dname "부서 명" FROM Dept ORDER BY deptno ASC;

-- 4 멀티미디어 학과의 교수
SELECT d.dname "부서 명", concat(p.name, '교수님') "교수이름" FROM dept d JOIN Professor P ON d.dname like '멀티미디어' AND d.deptno like p.deptno;

--5 현재 학생이 등록된 학과들
SELECT DISTINCT d.dname "학생 등록 부서" FROM stu s JOIN dept d ON s.deptno = d.deptno;

--6 공과대학 교수진
SELECT concat(concat(p.name,'직급:'),p.position) "공과대학 교수진" FROM Professor p;

--7 공과대학 교수 급여와 연봉(연봉은 총 급여 + 보너스 100만원 추가)
select name, sal from professor;
select name "이름",concat(sal+100,'만원') "급여" 
from professor;


/*008 공과대학 1학년 학생 목록*/
select d.dname "학과", s.stuno "학번",s.grade "학년",s.name "이름"
from Stu s
join dept d
on s.deptno=d.deptno where grade=1;

/*009 공과대학 2,3,4학년 학생 목록 (학과면,학번 오름차순)*/
select d.dname "학과", s.stuno "학번",s.grade "학년",s.name "이름"
from Stu s
join dept d
on s.deptno=d.deptno where s.grade != 1 order by s.stuno,d.dname asc;


/*010 공과대학 4학년 메카학과 학생 목록 (학과명, 학번 오름차순)*/

select d.dname "학과", s.stuno "학번", s.grade||'학년' "학년",s.name "이름"
from Stu s
join dept d
on s.deptno=d.deptno where s.grade = 4 and d.dname ='메카' order by s.stuno asc;

/*011 공과 대학생 중 키가 160-170 사이의 학생 목록 *between A and B 연사자 사용할것 */
select s.grade||'학년' "학년",d.dname "학과", s.stuno "학번",s.name "이름",s.height "키"
from Stu s
join dept d
on s.deptno=d.deptno
where s.height between '160' and '180';


/*012 컴공,메카학과 학생 리스트  in(a,b) 사용할것, a와b 는 subquery로 처리*/
select count (*) as "학생수" from (select s.grade||'학년' "학년",d.dname "학과", s.stuno "학번",s.name "이름"
from Stu s
join dept d
on s.deptno=d.deptno
where d.dname in (
(select d.dname
from dept d 
where d.dname='컴공'),
(select d.dname
from dept d 
where d.dname='메카'
)
)order by s.grade)
;

select count (*) "학생수" from (select s.grade "학년",d.dname "학과",s.stuno "학번",s.name "이름"
from stu s,dept d
where d.deptno
in (select deptno from dept where dname='컴공' or dname='메카'));   /*카티전프로덕트가 생긴다 82명이 나옴*/

select count(*)
from stu s, dept d
where d.dptno
in (select deptno from dept where dname='메카' or dname='컴공')
and s.deptno=d.deptno;
 /*012 scalar */
select rownum no, t.* 
from (select s.grade "학년",
	 (select dname from dept d where d.dptno=s.deptno) "학과",
	 s.stuno "학번",
	 s.name "이름"
    from stu s
    where deptno
	in (select deptno from dept where dname='메카' or dname='컴공')
	order by s.grade)t
;

select ROWNUM no, m.member_id 아이디, m.name 이름, m.ssn,m.phone,m.email,m.regdate
from Member m
join Major mj on  m.member_id=mj.member_id;


/*013 공과대학 학생 중 김씨 리스트 (like 사용)*/

select s.grade "학년",d.dname "학과", s.stuno "학번",s.name "이름"
from Stu s
join dept d
on s.deptno=d.deptno
where s.name like '김%';

/*014 공과대생 중에서 정?정 으로 끝나는 학생 정보(wildcard 사용)*/

select s.grade "학년",d.dname "학과", s.stuno "학번",s.name "이름"
from Stu s
join dept d
on s.deptno=d.deptno
where s.name like '정_정';

/*015 공과대 교수진 커미션이 없는 교수들*/
select* from professor;
update professor set comm=null where userid='hong';
update professor set comm=null where userid='lee';

select p.userid "아이디",p.name "이름", p.position "학번",p.comm "커미션"
from professor p
where p.comm is null;

/*016 메카학과 교수와 학생 목록 (교수를 먼저 상단에 위치 시킬것 )  (union 연산자 사용 할것 )*/
/*select를 두개를 하고 묶어서 order by 해야 한다*/

((select d.dname"학과", p.profno "NO.", p.name ||'교수' "이름" 
from professor p
join dept d on p.deptno=d.deptno
where d.dname like '메카'
)
union
(select d.dname"학과", s.stuno "NO.", s.name ||'학생' "이름" 
from stu s
join dept d on s.deptno like d.deptno
where d.dname like '메카'
))order by "NO." desc;


select "학과" ,"NO","이름" from((select t.dname "학과", t.stuno "NO",t.name "이름",1 sort
from (select * from stu s join dept d on )))

/*017 intersect 교집합  학생 두명의 이름을 통해 같은 학과인지 여부 판별 (intersect 연산자 사용) 
 * 송중기와 박보검이 같은 학과?
 * 송중기와 심석훈이 같은 학과? 
 * null값 추출*/

--is null 

((select d.dname "학과"
from stu s
join dept d on s.deptno= d.deptno
 where s.name like '박보검')
 intersect 
(select d.dname "학과"
from stu s
join dept d on s.deptno= d.deptno
where s.name like '송중기'));


(select d.dname "학과"
from stu s
join dept d on s.deptno= d.deptno
where s.name like '송중기')
intersect
(select d.dname "학과"
from dept d, stu s where s.deptno like d.deptno
where s.name like '이석훈');

select d.dname "학과"
from (select deptno from stu where name like '송중기')
intersect 
select deptno from stu where name like '박보검')t
join dept d on de.deptno like t.deptno;

sing_row_fx
multi _row_fx


/*018 교수진중 정교수가 되지 못한 교수진 목록 (minus연산자 써야 함- 차 집합을 뽑는것 )*/
select name "이름" from professor 
minus (select name "이름" from professor where position like '교수');


/*019   전체 학생들의 학번과 이름은 성만 표기된 상태 (보안)로 목록 rpad() 과 substr() 내장함수 사용*/
/*SELECT LPAD('Page 1',15,'*.') "LPAD example"
   FROM DUAL;
*/

--19. 전체 학생들의 학번과 이름은 성만 표기된 상태(보안)로 목록 rpad()과 substr() 내장함수 사용   / family name 뽑는 query
-- 학번, 이름

select stuno, rpad(substr(name,1,1),length(name)+1,'*') "이름" 
from stu;

--20. 전체 학생들의 학번과 이름, 생년이 표기된 목록 instr()과 substr() 내장함수 사용 
-- 학번, 이름, 생년
select stuno, name, substr(birthdate,1,instr(birthdate,'-')-1) "생년"
from stu;



select to_char(sysdate,'yyyy/mm/dd') from dual;
select to_char(sysdate,'mm') from dual; --> minute 이 추출된다
select to_char(sysdate,'MM') from dual; --> month 가  추출된다
select to_date(sysdate) from dual;
select floor (months_between(sysdate,to_date('19840213','YYYYMMDD'))/12)  나이 from daul;



/*021 공과대학 학생 들의 학번, 이름, 나이 */
select s.stuno 학번, s.name 이름, floor (months_between(sysdate,to_date(s.birthdate))/12)+1 나이 from stu s;

/*022 전체 교수들의 이름,직급,월급 , 커미션, 합계가 표기된 목록*/
select name NAME,position POS,sal SALARY,NVL(comm/100, 0) COMMISSION, NVL(sal*comm/100+sal,sal) TOTAL from professor;/*if else*/
select name NAME,position POS,sal SALARY,NVL(comm/100, 0) COMMISSION, NVL2(SAL*COMM/100+SAL, SAL*COMM/100+SAL,sal) TOTAL from professor;/*3항*/
select name NAME,position POS,sal SALARY,NVL(comm/100, 0) COMMISSION, DECODE(SAL*COMM/100+SAL, NULL, sal, SAL*COMM/100+SAL) TOTAL
from professor;


SELECT
DECODE(SAL*COMM/100+SAL, NULL, sal, SAL*COMM/100+SAL) TOTAL
FROM professor;


/*023 교수들의 부서를 학과와 학부로 나누 어서 표기 decode() 사용*/

select * from professor;
select * from dept;

SELECT p.name 교수, d.deptno 학과번호, d.dname 부서명, decode(d.deptno,101,'학과',102,'학과',201,'학과',202,'학과',10,'학과',100,'학부',200,'학부')
from professor p
join dept d on p.deptno=d.deptno; 

SELECT p.name 교수, d.deptno 학과번호, d.dname 부서명, decode(mod(d.deptno,100),0,'학부','학과')부서
from professor p
join dept d on p.deptno=d.deptno; 


/*024 학생들 키를 기준으로 A-D등급으로 분류  case를 사용*/

SELECT STUNO 학번, NAME 이름, HEIGHT 키 ,
CASE WHEN height<160 THEN 'D'
	WHEN height BETWEEN 160 AND 169 THEN 'C' 
	WHEN height BETWEEN 170 AND 179 THEN 'B'
	WHEN height BETWEEN 180 AND 199 THEN'A' END
 HEIGHT_GRADE
FROM stu; 

/*025부서별 학생 평균키*/
select d.deptno "NO",d.dname 부서
select * from dept;

select s.deptno 부서번호, d.dname 부서,floor(avg(s.height))||'cm' 평균키
from stu s 
join dept d on s.deptno like d.deptno group by s.deptno,d.dname; 

/*final*/
select d.dname 부서명 ,s.*
from (select deptno "NO",floor(avg(height))|| 'cm' 평균키 
from stu
group by deptno)s
join dept d on d.deptno=s."NO";




/*026 학과별 전체 교수수와 커미션 받는 교수수*/

select deptno 부서번호, count(deptno) 교수수, count(comm) "커미션 받을 교수 수"
from professor group by deptno; 

/*027 학과별, 학년별 인원수와 평균키*/
select rownum "NO", d.dname 부서명,temp."학년",temp."평균키",temp."인원" 
from (select grade||'학년' "학년",floor(avg(height))|| 'cm' 평균키,deptno "deptno",count(grade) "인원"
from stu
group by grade,deptno)temp
join dept d on temp."deptno"=d.deptno order by d.dname,temp."학년", "NO";


/*028 3학년 학생들만을 학과별, 학년별 인원수와 평균키를 번호별로 정렬*/
--groupby & having !!!!!! group by 와 having 은 짝꿍이다! 

select rownum "NO", d.dname 부서명,temp."학년",temp."평균키",temp."인원" 
from (select grade||'학년' "학년",floor(avg(height))|| 'cm' 평균키,deptno "deptno",count(grade) "인원"
from stu
group by grade,deptno 
having grade >=3
)temp
join dept d on temp."deptno"=d.deptno order by d.dname,temp."학년", "NO";


/*029 학과별 평균키값 중 최대 평균 키는 얼마인가?*/
--ㅡmax
select max(floor(avg(height)))||'cm' 최대평균키 
from stu
group by deptno;

/*030 각 학과당 학년별 학생수와 전체 학생수 rollup() 사용 */
select deptno 부서번호 ,grade 학년, count(*) 인원수
from stu
group by rollup (deptno,grade)
order by deptno;


select deptno 부서번호 ,grade 학년, count(*) 인원수
from stu
group by cube (deptno,grade)
order by deptno;

/*inner*/
select * 
from stu s

join dept d on d.deptno like s.deptno;


/*natural join*/
--alias 쓰지 않고 공통된것 알아서 찾아서 쓰는것 

select * from stu s inner join dept d 
using (deptno);

/*outer join*/


/*031 */
select s.name 학생, s.grade 학년, p.name 담당교수, p.position 직급
from stu s
full outer join professor p on s.deptno=p.deptno;

select s.name 학생, s.grade 학년, p.name 담당교수, p.position 직급
from stu s right join professor p on s.profno like p.profno
order by p.profno;


/*032 self join 상위대학 여부는 college를 통해 알수 있다. 이를 기반으로 아래와같은 소속 여부를 표기하여라 */
/*조인 대상이 내가 된다 */

select d1.dname ||'>'|| d2.dname "소속"
from dept d1
join dept d2 on d1.deptno like d2.college
order by d1.deptno;


select * from dept;


select d1.dname ||'>'|| d2.dname "소속"
from dept d1,dept d2
where d1.deptno like d2.college
order by d1.deptno;



/*0808 유관순과 동일한 직급인 사람을 고르시오*/

select * from professor;

	select position POSITION 
	from professor
    group by position
    having name like '%유관순%'
	;
	
	from professor p1,professor p2
	where 
	
	
	select position POSITON, name NAME
	from professor
	where position like (select position 
		from professor 
		where name like '%유관순%');
	
	
/*034 김유신과 직급이 같은 사람 목록*/
		select position , name 
		from professor
		where position like (select position
		from professor where name like '%김유신%');
	
/*035 학생 id가 song 인 학생과 같은 학년인 학생들 목록*/
		select *
		from stu
		where grade like (select grade
		from stu
		where userid like 'song');
		
		
/*036 컴공과 학생들의 평균키보다 작은 전교 학생들의 집합은?*/
		
		select *
		from stu
		where height < (select floor(avg(height))
		from stu s
		join dept d on s.deptno like d.deptno
		where d.dname like '컴공')
		;
		
		select floor(avg(height))
		from stu s
		join dept d on s.deptno like d.deptno
		where d.dname like '컴공';
		
		/*natural join*/
		select floor(avg(height))
		from stu
		natural join dept
		where dname like '컴공';
		
		
/*037 정보 미디어 학부 (부서번호 :100)에 소속된 모든 학생의 학번 ,이름 ,학과명*/
		select stuno 학번,name 이름,dname 학과명,deptno 학과번호
		from stu 
		join dept using (deptno)
		where college like '100';
		
		select s.stuno, s.name,d.dname,d.deptno
		from stu s
		join(select deptno, dname from dept where college =100) d
		on s.deptno= d.deptno;
		
		
/*038 4학년 학생 중 최소키 보다 키가 큰 학생 모두 출력 (any) 4학년의 최소키보다 크 사람 키 학번 학년,이름 , 키 출력*/
	select stuno,grade,name,height
	from stu
	where height> any (select height from stu where grade like '4'); 
	/*>any는 최소값을 출력하는것 이다 */
	
	/*039 4학년 중 최대키보다 키가 큰 학생 모두 출력(all)*/
	     select height ,name
	     from stu 
	     where height > all (select height from stu where grade like '4');
	     
	/*040 커미션을 받는 교수가 한명 이라도 있으면, 모든 교수의 정보를 출력 */
	    SELECT *
		FROM professor
		WHERE EXISTS(
	    SELECT profno 
	    FROM professor
	    WHERE comm IS NOT NULL);
	    
	/*041 특정 id가 존재하지 않으면 0을 출력/ table 찾고*/
	
		select 0 id_exist
		from dual
		where NOT EXISTS (SELECT * from stu where userid like '');
		
	
	/*042 학년별 최소 키 각각 출력 (동일한 값이면 모두 출력)*/
		
		SELECT name, grade, height
		FROM stu
		WHERE height IN (
	    SELECT MIN(height)
	    FROM stu
	    GROUP BY grade);
	    
	    
	    /*bug*/
	    SELECT name, grade, height
		FROM stu
		WHERE (height,grade) IN (
	    SELECT grade,MIN(height)
	    FROM stu
	    GROUP BY grade);
	    
	    
	/*043 상호 연관 서브쿼리 -> 전 학년의 평균키보다 큰 학생들 전부 출력 */
	
	select name,grade,height
	from stu 
	where height > all (select avg(height) from stu)
	order by grade;

select avg(height) from stu;

	
	
   /*044 각 부서별 부서 평균키보다 큰 학생들 전부 출력 (상호연관 서브쿼리 )*/
	select deptno,grade,name,height
	from stu s1
	where height > all (select avg(height)
	from stu s2
	where s1.deptno like s2.deptno)
	order by deptno,grade;

	select deptno, name, grade, height
	from stud s
	where height>(select avg(height)
	from stud s1
	where s1.deptno like s.deptno
	)order by deptno,grade;
	
	
	
  /*045 고용일 입력*/
	insert into professor (profno,name,userid,position,sal,hiredate,comm,deptno)
values(9999,'팀','tim','전임강사',260,to_date('2015/01/01','yyyy/mm/dd'),null,101);
	
	insert into professor 
	(profno, name, userid,position,sal,hiredate ,comm,deptno)
	vlaues (9008,'팀','tim','전임강사',260,
	to_date('2005/01/01','yyy/MM/dd'),null,101);
	
	
	/*046 grade 서브 테이블 잘성하고 일괄 값 입력*/
	
	create table grade_one(
	userid varchar2(20) primary key,
	grade number);
	
	create table grade_two(
	userid varchar2(20) primary key,
	grade number);
    create table grade_three(
	userid varchar2(20) primary key,
	grade number);
    create table grade_four(
	userid varchar2(20) primary key,
	grade number);
	
	/*결제 했을때, 돈이 지급되면 진짜 grade에 집어 넣게  */
	/*한번에 많은값을 집어 넣을때*/
	insert all 
	when grade like 4 then
	into grade_four values(stuno,grade)
	when grade like 3 then
	into grade_three values(stuno,grade)
	when grade like 2 then
	into grade_two values(stuno,grade)
	when grade like 1 then
	into grade_one values(stuno,grade)
	select stuno,grade
	from stu 
	where grade <5;
	
	select * from  grade_one;
	
	truncate table grade_one;
	
	ROLLBACK;  /*transaction */   /*rollback 과 commit의 기능을 바꿔야 한다 */
	select * from  professor;
	delete from professor where profno= 9007; 
	
	
	/*047 subquery를 이용해서 update set 하는데 더 좋은 조건으로 바꿔라, 김유시느이 급여와 커미션을 엘리스와 동일하게 수정 */
	
	select * from  professor;
	
	update professor set position = (select position from professor where name like '엘리자베스'), 
	sal = (select sal from professor where name like '엘리자베스')
	where name like '김유신';
	
	
	 update professor set (position ,sal) = (select position,sal from professor where name like '엘리자베스') 
	 where name like '김유신';
	
	
	UPDATE Member SET password='2' WHERE id='jinjin';
	/*048 부서번호 101번의 교수를 전부 삭제 */
	delete from professor 
	where deptno like 
	( select deptno
	 from dept
	 where dname like '컴공'
	);
	rollback;
	select * from professor;
	
	