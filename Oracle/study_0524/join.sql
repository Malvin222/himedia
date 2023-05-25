--회원기본정보 - 아이디,암호,이름,출생일,성별
--회원상세정보 - 아이디,핸드폰,주소,구매상품정보
--학생회원정보 - 아이디,영어점수,국어점수

--1.equal join 
--사원번호,사원이름,부서이름
select empno,
       ename,
       dname,
       emp.deptno 
    from emp,dept 
    where 
    emp.deptno=dept.deptno;
--as 사용 (현업에서 거의 무조건 사용 as 생략가능)
select e.empno as empno,
       e.ename ename,
       d.dname dname,
       e.deptno deptno 
    from emp e,dept d 
    where e.deptno = d.deptno;

--2.non-equal join 
--사원번호,사원이름,급여,등급
select e.empno,
       e.ename,
       e.sal,
       s.grade ||'등급' grade
    from emp e,salgrade s 
 where e.sal between s.losal and s.hisal;
--3.outer join: 부족한 데이터를 null값으로 출력해서 행의 갯수가 달라도(매칭이 되지 않아도) 출력가능
--사원번호,사원이름,부서이름 (king deptno 데이터를 10-> 70으로 변경)
select e.empno empno,
       e.ename ename,
       d.dname dname,
       e.deptno deptno
    from emp e,dept d 
    where e.deptno = d.deptno (+);
--4. self join
--사원번호,사원이름,매니저번호,매니저이름
select   a.empno,
         a.ename,
         a.mgr,
         b. ename mgrname
       from emp a,emp b 
       where a.mgr = b.empno;