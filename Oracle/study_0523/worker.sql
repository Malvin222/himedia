CREATE TABLE  DEPT
(
  DEPTNO  NUMBER(2),     -- 부서번호
  DNAME   VARCHAR2(14),  -- 부서이름
  LOC     VARCHAR2(13)    -- 부서위치
);

insert into dept values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept values(20, 'RESEARCH', 'DALLAS');
insert into dept values(30, 'SALES', 'CHICAGO');
insert into dept values(40, 'OPERATIONS', 'BOSTON');
  

CREATE TABLE  EMP
(
  EMPNO     NUMBER(4),      -- 사원번호
  ENAME     VARCHAR2(10),   -- 사원이름 
  JOB       VARCHAR2(9),     -- 업무 
  MGR       NUMBER(4),      -- 매니저
  HIREDATE  DATE,           -- 입사일
  SAL       NUMBER(7,2),     -- 급여
  COMM      NUMBER(7,2),    -- 추가급여
  DEPTNO    NUMBER(2)      -- 부서번호
);

insert into emp values( 7839, 'KING', 'PRESIDENT', null, to_date('1996-11-17','yyyy-mm-dd'), 5000, null, 10);
insert into emp values( 7698, 'BLAKE', 'MANAGER', 7839, to_date('1991-1-05','yyyy-mm-dd'), 2850, null, 30);
insert into emp values( 7782, 'CLARK', 'MANAGER', 7839, to_date('1999-9-06','yyyy-mm-dd'), 2450, null, 10);
insert into emp values( 7566, 'JONES', 'MANAGER', 7839, to_date('2001-02-04','yyyy-mm-dd'), 2975, null, 20);
insert into emp values( 7788, 'SCOTT', 'ANALYST', 7566, to_date('2003-06-17','yyyy-mm-dd'), 3000, null, 20);
insert into emp values( 7902, 'FORD', 'ANALYST', 7566, to_date('1981-03-12','yyyy-mm-dd'), 3000, null, 20);
insert into emp values( 7369, 'SMITH', 'CLERK', 7902, to_date('2007-12-1','yyyy-mm-dd'), 800, null, 20);
insert into emp values( 7499, 'ALLEN', 'SALESMAN', 7698, to_date('20-2-1981','dd-mm-yyyy'), 1600, 300, 30);
insert into emp values( 7521, 'WARD', 'SALESMAN', 7698, to_date('22-2-1981','dd-mm-yyyy'), 1250, 500, 30);
insert into emp values( 7654, 'MARTIN', 'SALESMAN', 7698, to_date('28-9-1981','dd-mm-yyyy'), 1250, 1400, 30);
insert into emp values( 7844, 'TURNER', 'SALESMAN', 7698, to_date('8-9-1981','mm-dd-yyyy'), 1500, 0, 30);
insert into emp values( 7876, 'ADAMS', 'CLERK', 7788, to_date('13-7-87', 'dd-mm-yy') - 51, 1100, null, 20);
insert into emp values( 7900, 'JAMES', 'CLERK', 7698, to_date('3-12-1981','mm-dd-yyyy'), 950, null, 30);
insert into emp values( 7934, 'MILLER', 'CLERK', 7782, to_date('2003-1-23','yyyy-mm-dd'), 1300, null, 10);
  
CREATE TABLE salgrade (
grade number,    -- 등급
losal number,     -- 최저급여
hisal number );   -- 최고급여

insert into salgrade values (1, 700, 1200);
insert into salgrade values (2, 1201, 1400);
insert into salgrade values (3, 1401, 2000);
insert into salgrade values (4, 2001, 3000);
insert into salgrade values (5, 3001, 9999);

--(1)
desc DEPT;
desc emp;
desc salgrade;
--(2)
select *from dept;
select* from emp;
select*from salgrade;

select *from emp where deptno='10'; --(3)
select*from emp where sal>=1500; --(4)
select '1500은 '||grade||'등급입니다' as str  --(5)
from salgrade where losal<=1500 and hisal>=1500; --로우샐과 하이샐의 범위안
select *from emp where mgr is null and job!='PRESIDENT'; --(6)
SELECT *FROM emp WHERE job = upper('president'); --문자열은 대소문자구문: upper를 이용하여 대문자로 입력
select substr(ename,1,2)||'***' from emp;   --(7)  substr(문자열,시작번호,출력개수)
select rpad(substr(ename,1,2),length(ename),'*') as name from emp; --rpad (문자열,출력길이,출력문자)
--rownum(사원 테이블에 행번호를 붙여 출력)
select rownum,empno,ename from emp; --모든테이블에서 사용할수 있는 내장 컬럼(행번호가 자옫으로 붙음)
select *from emp where rownum<=5;    --5개만 출력
select rownum,emp.* from emp where rownum<=10 ; 

--[자주쓰이는 함수 적용]--
--(1) 최고/최저 급여 출력하기
select max(sal) from emp;
select min(sal) from emp;
--(2)급여합계/급여평균 출력
select sum(sal)from emp;
select avg(sal) from emp;
--(3)반올림으로 출력 -급여평균
select round(avg(sal)) from emp; --정수표현
select round(avg(sal),2) from emp; --소수점2자리까지 표현(마지막은 반올림)
--(4)올림함수/내림함수 적용하여 출력
select ceil(avg(sal)) from emp;
select floor(avg(sal)) from emp;
--(5)커미션 핋드 데이터들을 이용하여 합계와 평균을 출력
select sum(comm) from emp; --null값을 제외한 합계
select 1400+500+300 from dual;
select avg(comm)from emp; --ull값을 제외한 평균
select (1400+500+300)/4 from dual;
--(6)전체 사원수 출력하기
select count(*) from emp;
--(7)업무종류 출력하기
select distinct(job) from emp;

--[풀어보기]--
select max(sal) from emp where deptno='10'; --(1)
-- 10번 부서에서 근무하는 사람들 중 최고 급여자의 이름과 급여를 출력;
select ename,sal from emp where deptno='10' 
    and sal=(select max(sal) from emp where deptno='10');

select *from emp where sal<=2000 and sal>=1000; --(2)
select *from emp where deptno=10 or deptno=20; --(3)
select count(*)from emp where mgr=7566;--(4)
select count(*)from emp where job=upper('ANALYST');--(5)

select ename,hiredate from emp;--(6)
select ename,to_char(hiredate,'yyyy-mm-dd')as hiredate from emp;

select ename,hiredate from emp where to_char(hiredate,'yyyy')>=2000--(7)
    and to_char(hiredate,'yyyy')<=to_char(sysdate,'yyyy');--아담이 미래에서 옴
--[연결 연산자]--
select ename||','||job as 사원별업무 from emp;
select ename||','||job as 사원별업무 from emp where rownum<10;
--[IN함수]--
select ename,deptno from emp where deptno=10 or deptno=20;
select ename,deptno from emp where deptno in(10,20);
select ename,sal,deptno from emp where ename in(upper('adams'),upper('ford'));
--[between]--
select deptno,ename from emp where deptno>=10 and deptno<=20;
select deptno,ename from emp where deptno between 10 and 20;
select ename,sal,deptno from emp where sal between 1000 and 1500;

commit;