-- variable : 외부변수 선언 , declare : 내부변수 선언 ,":=":문법 , 
--begin: 프로그램 시작, end: 프로그램 종료 ,"/": 전체종료

--(1) 출력 : 변수를 이용한 출력
variable sal number; 
declare  
     v_sal number :=3000; 
begin           
    :sal := v_sal/12;
    end;  
/  
print sal;  

--(2)출력 : dbms함수를 이용한 출력
set serveroutput on;
declare 
    v_sal number(8) :=3000;
    month_sal number(8);
begin
    month_sal:= v_sal/12;
    dbms_output.put_line('내 급여는'||month_sal);
end;
/
--(3) 테이블타입 동기화
--dbms_output.put_line은 컬럼명을 직접적인 출력 불가 따라서 
--into로 변수 값을 넘겨줌
declare
    v_deptno dept.deptno%type;
    v_dname dept.dname%type;
begin   
    select deptno,dname into v_deptno,v_dname
        from dept
            where loc ='BOSTON';
        dbms_output.put_line(v_deptno||'->'||v_dname);
end;
/
--(4) 데이터 입력
declare 
    v_deptno dept.deptno%type :=90;
    v_dname dept.dname%type :='총무부';
    v_loc dept.loc%type :='부산';
begin
    insert into dept values(v_deptno,v_dname,v_loc);
end;
/
--[풀어보기1] :emp 테이블에서 부서번호 10인 데이터들의 평균 급여를 구하라
--into로 round(avg(sal)) 의 값을 v_avg로 넘겨줌
declare 
    v_avg number :=0;
begin
    select round(avg(sal)) into v_avg
        from emp
            where deptno= 10;
    dbms_output.put_line('10번 부서의 평균 급여 :'||v_avg||'입니다.');
end;
/
--[풀어보기2]:emp 테이블의 부서번호 10의 모든 comm필드에 400 더하기 (단, null은 0으로 처리하여 연산)
savepoint sp1;
declare
    v_comm emp.comm%type :=400;
begin
    update emp
        set comm = nvl(comm,0)+v_comm
        where deptno=10;
end;
/
--(5)외부데이터 입력  "&":매개변수 , :=&dept_no : dept_no 매개변수값 입력(자바에서 Scanner)
declare 
    v_deptno dept.deptno%type :=&dept_no;
    v_dname dept.dname%type;
begin
    select dname into v_dname
    from dept
    where deptno = v_deptno;
    dbms_output.put_line('부서명 : '|| v_dname);
end;
/
--if문 예제 진행 count함수로 개수가 0 이면 없음,
declare 
    v_deptno number(8) :=&deptno;
    v_dname dept.dname%type;
    v_cnt number :=0;
begin
    select count(*) into v_cnt from dept
    where deptno = v_deptno;
    if v_cnt = 0 then
        dbms_output.put_line('없는 부서번호 입니다.');
    else
        select dname into v_dname
        from dept
        where  deptno=v_deptno;
        dbms_output.put_line('부서명 : '|| v_dname);
    end if;
end;
/