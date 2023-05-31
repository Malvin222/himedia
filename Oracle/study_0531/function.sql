--[함수]--
----------[예제1]----------매개변수의 합계를 구한다
--펑션명(매개변수명 in 타입)
--return number -> 리턴타입을 넘버로 받음
-- is  사용할 변수를 셋팅  begin 프로그램 코딩
create or replace function fn_mysum
    (v_num1 in number,v_num2 in number)
return number
is 
    v_sum number;
begin
    v_sum:=v_num1+v_num2;
    return v_sum;
end;
/
select fn_mysum(50,70) from dual;

----------[예제2]----------
--부서번호를 입력 받아 해당 부서의 급여 합계를 구하는 함수
create function fn_dept_sal_sum 
        (v_deptno in dept.deptno%type) 
return number
is  
    v_sum number;
begin
    select sum(sal) into v_sum from emp
    where deptno= v_deptno;
    return v_sum;
end;
/
select fn_dept_sal_sum(10) from dual;
----------[풀어보기1]-----------
--입력한 v_empno가 empno 일때 select 뒤에 있는 
--emp 테이블안에있는 sal+comm 값의 연산을 v_sal 변수에 삽입
--v_sal을 return으로 값을 출력

create function fn_emp_sal
            (v_empno in emp.empno%type)
return number
is 
    v_sal number:=0;
begin
    select nvl(sal,0)+nvl(comm,0) into v_sal from emp
    where empno = v_empno;
    return v_sal;
end;
/
select fn_emp_sal(7788) from dual;
----------[풀어보기2]-----------
--직원명을 입력받아 부서명을 검색하는 함수를 작성
-- 첫번째 select문에서 deptno값을 얻어오고 : 
--입력한 v_ename의 값의 emp 안에있는 deptno 값을 v_deptno로 삽입
-- 두번째 select문에서 dname을 얻어옴 : 
--얻어온 v_deptno의 값의 dept테이블 안에있는 dname 을 얻어와서 v_dname에 삽입후 v_dname 출력
create function fn_dept_name
        (v_ename emp.ename%type)
return varchar2
is
    v_deptno number;
    v_dname dept.dname%type;
begin
    select deptno into v_deptno from emp
        where ename=v_ename;
    select dname into v_dname from dept
    where deptno =v_deptno;
    return v_dname;
end;
/
select fn_dept_name('SCOTT') from dual; 
---[풀어보기2] join문---
--입력한 v_ename 이 ename으로 받고 emp,dept테이블에 있는 dname(join문으로 받아옴)을 v_dname에 적용
-- v_dname return
create function fn_dept_name_join
        (v_ename emp.ename%type)
return varchar2
is
    v_deptno number;
    v_dname dept.dname%type;
begin
    select 
        d.dname into v_dname from emp e, dept d
    where 
        e.deptno =d.deptno
        and e.ename = v_ename;
    return v_dname;
end;
/
select fn_dept_name_join('SCOTT') from dual;
-----------[예제3]-------------
--직원명을 입력받아 부서번호,부서명,위치 정보를 리턴하는 함수를 작성
create function fn_dept_info
        (v_ename emp.ename%type)
        return varchar2
is
    v_deptno number;
    v_dname varchar2(50);
    v_loc dept.loc%type;
    str varchar2(100);
begin 
    select deptno into v_deptno from emp where ename = upper(v_ename);
    select dname,loc into v_dname,v_loc from dept where deptno=v_deptno;
    str := '부서번호 : '||v_deptno||' 부서이름 : '||v_dname||' 위치정보 : '||v_loc;
    return str;
end;
/
select fn_dept_info('scott') from dual;
-----------[예제4]-------------
--emp 테이블의 전체 데이터 개수와 총 페이지 개수를 리턴한다.
-- 게시판 -> 한화면에 5개씩 출력 (ex:16개/4page ->17,3)
--unit 사용자 설정 개수 , tcnt: 토탈개수,tpage:토탈페이지
--첫번째 select문 emp테이블에서의 토탈 데이터 개수를 뽑아옴
--두번째 select문 총 데이터 개수를 입력한 unit 개수로 나눔(올림함수) ->토탈페이지를 가져옴(into)
create function fn_empPageCnt (unit number)
    return varchar2 
is
    tcnt number;
    tpage number;
    str varchar2(100);
begin 
    select count(1) into tcnt from emp;
    select ceil(tcnt/unit) into tpage from dual;
    str := tcnt||','||tpage;
    return str;
end;
/
select fn_emppagecnt(5) from dual;

-----------[Count(1)]---------
--(1) 데이터 칸 하나만 셈 *보다 살짝 빠름
select count(1) from emp; --16
--(2) *: 모든 컬럼을 세서 (행별로 셈) 가장 많은 컬럼(max return)을 가져옴   --속도가 느림
select count(*) from emp;   --16
--(3)
select count(comm) from emp; --null값 제외
--(4) 전체를 채우고 있는 컬럼 셋팅  -- 전체를 채우고있는 컬럼 하나만 셈 속도가 가장 빠름
select count(empno) from emp; -- 16
----------[풀어보기3]-----------
--사원번호를 입력 받아 입사년차를 얻는다.
--select fn_periodYear(7788) from emp;
create or replace function fn_emp_periodYear
                    (v_empno in number)
return number
is
    v_year number;
begin
    select to_char(sysdate,'yyyy') - to_char(hiredate,'yyyy') 
        into v_year
        from emp
        where empno = v_empno;
    return v_year;
end;
/
select fn_emp_periodYear(7900) from dual;
----------[풀어보기4]-----------
--첫번째 select 입력한 v_empno를 empno로 받아서 mgr(매니저번호)추출후 v_mgr 대입
--두번째 select 첫번째 select에서 가져온 v_mgr(mgr넘버)를 empno로 받아서 ename을 가져오고
-- v_ename에 대입 후 리턴
create or replace function fn_emp_mgrname
            (v_empno in number)
return varchar2
is
    v_ename varchar2(50);
    v_mgr number;
begin
    select mgr  into v_mgr from emp
        where empno =v_empno;
    select  ename into v_ename from emp
        where empno = v_mgr;
    return v_ename;
end;
/
select fn_emp_mgrname(7900) from dual;

----------[풀어보기4.1]-----------
-- 7788 -> 매니저 이름 출력
--(1)sub select
select (select ename from emp where empno=e.mgr) as mgrname
    from emp e
        where empno='7788';
        
--(2)내부조인
-- e1.ename의 값의 결과의 mgr 값이 e2.empno로 넘어간후 e2.ename 추출
--e1.ename = '7788' -> 7788의 mgr =7566 (e1)-> 7566의 empno =7566(e2) ->empno 7566의 ename(e2)
select  e2.ename
    from emp e1, emp e2
where e1.mgr = e2.empno
    and e1.empno ='7788';

--------e1(사원데이터)------e2(매니저데이터)---
mgr,empno,ename .. =  empno,ename,mgr ..
7566,7788,SCOTT    =  7566  JONES 7839
7788,7876,ADAMS    =  7788  SCOTT 7566
7839,7566,JONES    =  7839  KING  null
7902,7369,SMITH    =  7902  FORD  7566
7788,8010,ABC      =  7788  SCOTT 7566