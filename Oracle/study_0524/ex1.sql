--1. 2000년 이후 입사한 사원의 사원번호,사원명,입사일(0000-00-00)출력
select empno,ename,to_char(hiredate,'yyyy-mm-dd') from emp where to_char(hiredate,'yyyy')>2000;
--2. SMITH의 부서명을 출력
select dname from dept where deptno = 
    (select deptno from emp where ename='SMITH');

select (select dname from dept where deptno=emp.deptno) --deptno 가 emp.deptno일때
    from emp where ename=upper('smith'); --emp.deptno는 smith의 deptno
select (select dname from dept where deptno=emp.deptno) from emp where ename=upper('james');
    
--3. 전체 출력 사원번호,사원명 부서명을 출력
select empno,ename,(select dname from dept where deptno=emp.deptno) as dname from emp;

--4. SMITH와 같은 부서 사람들을 출력 ,rownum :smith가 동명이인일경우 오류가 나기때문에 방지차원으로 결과1개가 나오도록 셋팅
select *from emp where deptno =
    (select deptno from emp where ename='SMITH' and rownum=1); 

--5. SMITH가 속해 있는 부서의 평균 급여를 출력
select round(avg(sal),2) as smith_avg from emp where deptno = 
    (select deptno from emp where ename=upper('smith'));

--6. SMITH보다 급여를 많이 받는 직원들을 출력
select empno,ename,sal,deptno from emp where sal >=
    (select sal from emp where ename=upper('smith')and rownum=1)order by sal desc;

--7. 전체 평균 급여보다 많이 받는 직원들을 출력
select empno,ename,sal,deptno,(select round(avg(sal))from emp) as avg from emp where sal >=
    (select avg(sal) from emp) order by sal desc;
    
select empno,ename,sal,deptno,avg(sal) over() as avg from emp where sal >=
    (select avg(sal) from emp) order by sal desc;    
--8.급여를 가장많이 받는 사원의 정보(사원번호,사원명,급여)를 출력
select empno,ename,sal,deptno from emp where sal =
    (select max(sal) from emp where job!=upper('president')); --사장 제외