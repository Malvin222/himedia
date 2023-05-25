--decode
--decode(커럼명,비교값1,치환값1,비교값2,치환값2,....) -- 비교값이 없으면 else와 비슷

select      deptno
            ,dname
            ,decode(deptno,10,'회계',20,'조사',30,'영업',40,'기획') dname2
       from dept;
       
select deptno
       ,dname
       ,decode(deptno,10,'회계',20,'조사',30,'영업',40,'기획','몰라') dname3
     from dept;
     
select ename
       ,sal
       ,deptno
       ,decode(deptno,10,sal*1.1,sal) 인상급여
    from emp;     

--풀어보기1
select ename
       ,deptno
       ,sal
       ,decode(deptno,10,sal*1.1,20,sal*1.2,sal*1.3) 인상급여 
       from emp;

--풀어보기2
select empno
      ,ename
      ,job
      ,decode (job,'ANALYST','분석가'
                ,'CLERK','점원'
                ,'MANAGER','관리자'
                ,'SALESMAN','영업사원'
                ,'PRESIDENT','사장님') jobkor
    from emp;

--풀어보기3
select e.empno
      ,e.ename
      ,e.sal
      ,decode(s.grade,4,'상',5,'상','하') 급여수준
    from emp e,salgrade s
    where
        e.sal between s.losal and s.hisal
    order by 급여수준 asc ;

select empno
       ,ename
       ,sal
       ,case when sal>2000 then '상'
       else '하' end 급여수준
    from emp;
--풀어보기4
select empno
      ,ename
      ,job
      ,sal
      ,decode(job,'ANALYST',sal*1.10
                 ,'CLERK',sal*1.15
                 ,'MANAGER',sal*1.20,sal) 인상급여
      from emp;
--풀어보기5
select count(*)from(
select 
       ename
       ,hiredate
       ,decode(to_char(hiredate,'mm'),01,'입사'
              ,02,'입사'
              ,03,'입사'
              ,04,'입사'
              ,05,'입사'
              ,06,'입사' 
                ) hire
    from emp)
    where hire is not null;

select count(*)from(
    select  ename
        ,hiredate
        ,case when to_char(hiredate,'mm')<=6 then '입사' 
        else '' end hire
        from emp )
        where hire is not null;
