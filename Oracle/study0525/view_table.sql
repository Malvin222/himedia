--cmd환경에서 관리자모드 접근 (권한부여)
--c:\sqlplus sys/1234 as sysdba
--sql>grant create view to c##java;
--sql>exit

--view테이블
--가상테이블 (물리적 공간 차지하지 않음)
--조회만가능 (데이터 수정/삭제 불가)
--원본데이터 변경시 같이변경

--뷰 테이블 생성(뷰테이블은 보통 v_를 앞에 붙임) creat view 뷰테이블 명 as (가져올)select문
create view v_emp_copy as select *from emp;
select *from v_emp_copy;

create view v_emp_sal_desc as
select b.*from(
    select rownum rn,a.*from(
        select empno,ename,job,sal from emp order by sal desc) a )b;

select *from v_emp_sal_desc where rn>= 6 and rn<=10;

--view 테이블은 업데이트 할 수 없음
update v_emp_sal_desc 
        set sal = 6000 
            where ename=upper('king');

update emp set sal = 6000 where ename=upper('king');

--풀어보기(2)
create view v_research as 
        select 
            d.deptno,d.dname,e.empno,e.ename 
        from 
            dept d, emp e 
        where 
            e.deptno =d.deptno 
        and 
            d.dname=upper('research');