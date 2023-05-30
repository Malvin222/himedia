--select (10번 부서 급여평균)  select avg(sal) from emp where deptno='10'
--       ,(20번 부서 급여평균) select avg(sal) from emp where deptno='20'
--       ,(30번 부서 급여평균) select avg(sal) from emp where deptno='30'
--       ,(40번 부서 급여평균) select avg(sal) from emp where deptno='40'
--from 
    --dual;
--Group By
select   (select round(avg(sal),2) from emp where deptno='10') as "10_avg"
       , (select round(avg(sal),2) from emp where deptno='20') as "20_avg"
       , (select round(avg(sal),2) from emp where deptno='30') as "30_avg"
       , (select round(avg(sal),2) from emp where deptno='40') as "40_avg"
from 
    dual;

--(1) 부서별 급여의 합 출력
select round(avg(sal),2) from emp
        group by deptno
                order by deptno asc;

--(2)사원(emp) 테이블에서 부서번호,최고급여,최저급여를 부서별 출력
select deptno,max(sal),min(sal) from emp group by deptno;

--(3)emp 테이블에서 부서번호, 최고급여, 최저급여를 부서별 출력 조건 최저급여가 1000이상
select deptno,max(sal),min(sal) from emp group by deptno
                        having min(sal) >=1000;

--(4) 직무별(job) 평균 급여 출력 -> job,svg(sal)
select job,to_char(round(avg(sal)),'999,999') as avg
        from emp group by job;
        
--(5) 직무별(job) 최고 급여 출력
select job,max(sal) from emp  group by job;

--(6) 부서별 부서번호와 평균급여(조건: 평균급여가 2000이상인 부서)
select deptno,round(avg(sal),2) from emp 
                group by deptno 
                    having avg(sal) >=2000;

--(7) 사원테이블에서 각 부서별 평균 연봉을 구하고 그 중에서 평균 연봉이
-- 가장 적은 부서의 평균연봉보다 적게 받는 직원들의 직원번호,급여 출력
select empno,ename,sal from emp
    where sal < (select min(round(avg(sal))) salAvg from emp group by deptno);
    
--[풀어보기1] 부서별 사원수 조회 --count(*)은 속도가 느림
select deptno,count(empno) from emp group by deptno order by deptno desc;

--[풀어보기2] 아래처럼 출력
select deptno,count(empno) as conut ,
        to_char(round(avg(sal)),'999,999,999') as salAvg,
        to_char(sum(sal),'999,999,999') as salSum from emp
                group by deptno order by deptno desc;
 
--[풀어보기3] 사원수가 5명이 넘는 부서와 사원수 조회
select d.dname,count(e.empno) as count from emp e,dept d
                where e.deptno=d.deptno 
                    group by d.dname
                having count(e.empno)>=5;