--[풀어보기1]
--부서에 다른 인상급여 출력
--부서번호 10인 사원은 급여에서 1.1, 20인 사원은 1.2 다른부서는 1.3을 인상하여 출력
--사원번호,급여,인상급여
select 
    empno
    ,ename
    ,sal
    ,decode(deptno,10,sal*1.1
                 ,20,sal*1.2
                 ,sal*1.3) as sal2
    from emp; 
--[풀어보기2]
--emp 테이블에서 아래와 같이 설정하여 출력
--job => ANALYST:분석가, CLERK:점원, MANAGER:관리자, SALESMAN:영업사원,PRESIDENT:사장님)
select empno
      ,ename
      ,job
      ,decode(job,'ANALYST','분석가'
                 ,'CLERK','점원'
                 ,'MANAGER','관리자'
                 ,'SALESMAN','영업사원'
                 ,'PRESIDENT','사장','모름') job2
    from emp;
--[풀어보기3]
--(decode) 사원급여가 2000보다 많으면 상, 그렇지 않으면 하
--decode함수 맨 앞에 컬럼명 뿐만아니라 함수 및 계산식도 올 수 있음
select empno
       ,ename
       ,sal
       ,decode(sign(sal-2000),1,'상'
                             ,-1,'하') sal2
    from emp;

--sign :결과값이 양수(1),음수(-1)
select sign(1000) from dual;    --  1
select sign(-199) from dual;    -- -1
       
--[풀어보기4]
--(decode) 업무별 인상급여
--job:'ANALYST:sal*1.10,'CLERK':sal*1.15,'ANAGER':sal*1.20
select empno
       ,ename
       ,sal
       ,decode(job,'ANALYST',sal*1.1
                  ,'CLERK',sal*1.15
                  ,'MANAGER',sal*1.2
                  ,'SALESMAN',sal*1.3
                  ,'PRESIDENT',sal*1.4,sal) job2
        from emp;

--[풀어보기5]
--(decode) 1월~6월까지 년도와 상관없이 해당 월에 입사한 사람 수를 출력하시오.
select count(1) from emp
            where to_char(hiredate,'mm') ='01';
-------------------------------------------------------
select 
    count(decode(to_char(hiredate,'mm'),'01',1)) "1월"
    ,count(decode(to_char(hiredate,'mm'),'02',1)) "2월"
    ,count(decode(to_char(hiredate,'mm'),'03',1)) "3월"
    ,count(decode(to_char(hiredate,'mm'),'04',1)) "4월"
    ,count(decode(to_char(hiredate,'mm'),'05',1)) "5월"
    ,count(decode(to_char(hiredate,'mm'),'06',1)) "6월"
    from emp;
    
select count(*)
      ,count(ename)
      ,count(empno)
    from emp;
    

