--[프로시저]
--(1)사원번호를 입력받아 급여를 출력하는 프로시저
-- set serveroutput on; -> sql developer에서 dbms 출력할때 먼저 실행시켜서 on 해줘야함
--프로시저는 return이 없음 ->프로그램을 내부적으로 실행하는 역할(ex:업데이트,삭제)
--함수는 리턴값이 있어야하기 때문에 업데이트 및 삭제 등 기능수행을 하기가 불편함 대신 출력문은 편함
--create or replace ->생성하고 추후에 프로그래밍 내용 변경 가능
--죄측 프로시저 창에서 실행 후 매개변수 입력값에 값을 넣고 실행 -> 자동 커밋
--exec ->프로시저 출력
set serveroutput on;
create or replace procedure procTest1
        (v_empno in number)
is 
    v_sal number;
begin
    select sal into v_sal from emp where empno=v_empno;
    dbms_output.put_line(v_empno||'의 급여는 '||v_sal);
end;
/
exec procTest1(7900);

--(2)사원번호를 입력받아 급여를 5000으로 update 처리
create or replace procedure proc_up_sal
                (v_empno in emp.empno%type)
is
begin
    update emp set sal=5000
                where empno=v_empno;
end;
/
exec proc_up_sal(7839);
--(2.1)사원번호와 급여를 입력받아 update 처리
create or replace procedure proc_up_sal1
                (v_empno in emp.empno%type,
                    v_sal in emp.sal%type)
is
begin
    update emp set sal=v_sal
        where empno=v_empno;
end;
/

exec proc_up_sal1(7839,6500);
select * from emp;
rollback;
--(3)사원번호를 입력받아 그 사원의 이름과 급여를 출력하는 프로시저
create or replace procedure proc_emp_sal
        (v_empno emp.empno%type)
is
    v_sal emp.sal%type;
    v_ename emp.ename%type;
begin
    select ename,sal into v_ename,v_sal from emp
            where empno=v_empno;
    dbms_output.put_line(v_ename||'의 급여는 '||v_sal||'입니다');
end;
/

exec proc_emp_sal(7900);

--------------------[Q1]------------------
--사원번호를 입력받아 삭제 처리하는 프로시저 생성
create or replace procedure proc_emp_del
                        (v_empno in emp.empno%type)
is
    v_cnt number :=0;
begin
    select count(*) into v_cnt from emp 
                where empno=v_empno;
    if v_cnt = 0 then
        dbms_output.put_line(v_empno||'는 존재하지 않는 번호입니다.');
    else
        delete from emp where empno=v_empno;
        dbms_output.put_line(v_empno||': 삭제완료');
    end if;
end;
/
exec proc_emp_del(8011);
select *from emp;
--------------------[Q2]------------------
--부서 급여 업데이트 - 부서번호를 입력 받아 아래의 내용으로 update처리
--deptno 10 ->급여의 20% ,deptno 20 ->급여의 30%,deptno ->급여의 10% ,나머지 0%
create or replace procedure proc_up_salQ2
                    (v_deptno in emp.deptno%type)
is
begin
    if
        v_deptno=10 then
        update emp set sal = round(sal*1.2)
        where deptno = v_deptno;
    elsif
        v_deptno=20 then
        update emp set sal = round(sal*1.3)
        where deptno = v_deptno;
    elsif
        v_deptno=30 then
        update emp set sal= round(sal*1.1)
        where deptno = v_deptno;
    end if;
    dbms_output.put_line(v_deptno||'의 급여 변경완료');
end;
/
exec proc_up_salQ2(10);
select *from emp;
rollback;
--------------------[Q3]------------------
--부서테이블에 부서 추가 입력 처리
--조건:같은 deptno가 있는지 체크 - 같은 부서번호가 존재합니다 라는 메세지
create or replace procedure proc_dept_inser
    (v_deptno in dept.deptno%type,
     v_dname in dept.dname%type,
     v_loc in dept.loc%type)
is
    v_cnt number;
begin
    select count(*) into v_cnt from dept
            where deptno = v_deptno;
    if v_cnt =0 then
        insert into dept(deptno,dname,loc)
            values (v_deptno,v_dname,v_loc);
        dbms_output.put_line(v_deptno||'가 저장 처리 되었습니다.');
    else
        dbms_output.put.line('이미 사용중인 부서번호입니다.');
    end if;
end;
/