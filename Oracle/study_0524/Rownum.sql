--1.emp --사원정보
--2.dept --부서정보
--3.salgrade --급여정보

--[실습]
--1. 직원번호,직원이름 출력
select empno,ename,job from emp;
--2. 직원번호,직원이름 rownum적용
select rownum,empno, ename, job from emp;
--3. 구조 출력
desc emp;
--4. 부서명,부서이름 출력
select rownum,deptno,dname from dept;
--5. 직원번호 직원이름 rownum 범위 출력
select rownum,empno,ename,job from emp where rownum<6;  --5개 출력
select rownum,empno,ename,job from emp where rownum>=6; --출력안됨 (지원하지 않음)
--6. 직원번호 직원이름 rownum 1부터가 아닌 범위출력 
select a.*from(select rownum as rn,empno,ename,job from emp) a;-- a: 구조물 테이블 별칭 as로 rn 컬럼이름지정
select a.*from(select rownum as rn,empno,ename,job from emp) a where rn>=6;
select a.*from(select rownum as rn,empno,ename,job from emp)a where rn>=3 and rn<=7;
select a.*from(select rownum as rn,empno,ename,job from emp)a where rn>=6 and rn<=10;
--7. 직원번호,직원이름 rownum 11부터 14까지 추출후 rownum 적용
select rownum,a.*from(select rownum as rn,empno,ename,job from emp)a where rn>=11 and rn<=15;

--8. order by 컬럼명(asc 또는 desc 은 생략가능)
select empno,ename,job from emp order by empno asc;
select rownum,empno,ename,job from emp order by empno asc; --order by가 맨 마지막실행
-- 정렬한 데이터에 rownum적용
select rownum,a.*from(select empno,ename,job from emp order by empno asc)a; --
--9.정렬한 데이터에 rownum적용후 rownum 사용
select b.*from
(select rownum as rn,a.*from
(select empno,ename,job from emp order by empno asc) a) b; --rownum은 컬렴명으로 사용할수 없어서 as rn 으로 변경

--10.급여기준으로 상위 1등~5등
select b.*from(
select rownum as rn,a.*from 
(select empno,ename,job,sal from emp order by sal desc)a)b where rn>=1 and rn<=5;
--급여기준으로 상위 6~10
select b.*from(
select rownum as rn,a.*from
(select empno,ename,job,sal from emp order by sal desc)a)b where rn>=6 and rn<=10;
--11. between 사용
select b.*from(
select rownum as rn,a.*from
(select empno,ename,job,sal from emp order by sal desc)a)b where rn between 6 and 10; --비트윈보다 기호가 더 속도가 빠르다는 말이 있음
--12. IN 함수(OR 연산자와 동일한기능)
--(1) 부서번호 10번, 20번 부서 직원들 출력
select empno,ename,deptno from emp where deptno= 10 or deptno=20;   --속도가 빠르지만 프로그래밍적으로 사용하기 힘들다
select empno,ename,deptno from emp where deptno in(10,20);
select empno,ename,deptno,job from emp 
        where job in(upper('clerk'),upper('analyst'),upper('president'));