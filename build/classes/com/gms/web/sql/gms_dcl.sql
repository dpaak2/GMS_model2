SELECT * FROM MEMBER;
SELECT * FROM MEMBER;
SELECT COUNT(*) as member_count FROM MEMBER; 

SELECT * FROM Board;
SELECT COUNT(*) as article_count FROM Board; 
SELECT * FROM Board WHERE article_seq='1001';
SELECT * FROM Board WHERE id LIKE '%hong%';
SELECT *FROM Board;

select * from Stu;

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

--19. 전체 학생들의 학번과 이름은 성만 표기된 상태(보안)로 목록 rpad()과 substr() 내장함수 사용
-- 학번, 이름

select stuno, rpad(substr(name,1,1),length(name)+1,'*') "이름"
from stud;

--20. 전체 학생들의 학번과 이름, 생년이 표기된 목록 instr()과 substr() 내장함수 사용 
-- 학번, 이름, 생년
select stuno, name, substr(birthdate,1,instr(birthdate,'-')-1) "생년"
from stu
