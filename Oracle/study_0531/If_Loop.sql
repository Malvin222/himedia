--[loop 문]  -- set serveroutput on; -> dbms 출력을 하려면 있어야한 문구
set serveroutput on;
declare
    cnt number:=1;
begin
    loop
        dbms_output.put_line(cnt);
        cnt:=cnt +1;
        exit when cnt>10;
    end loop;
end;
/
-----------[자바]-----------
 do {
    System.out.println(cnt)
    cnt=cnt+1;
 }  while (cnt>10);
----------[for 문]----------
--for i in 시작값..최종값 , 역순으로는 (10..1)은 되지 않음 ,역순은 for i in reverse
declare
begin
    for i in 1..10
    loop
        dbms_output.put_line(i);
    end loop;
end;
/
------------[구구단출력]------------
--&n -> 매개변수 입력
declare
    v_cnt number:=&n;
begin
    for i in 1..9
    loop
        dbms_output.put_line(v_cnt||'*'||i||'='||v_cnt*i);
    end loop;
end;
/
----------[전체 구구단 출력]---------
declare
begin
    for i in 2..9 loop
        for j in 1..9 loop
            dbms_output.put_line(i||'*'||j||'='||i*j);
            dbms_output.put_line('');
        end loop;
        dbms_output.put_line('');
    end loop;
end;
/
-------------[while문]-------------
declare 
    v_cnt number:=1;
begin
    while v_cnt<=10 loop
    dbms_output.put_line(v_cnt);
    v_cnt:=v_cnt+1;
    end loop;
end;
/

---------[풀어보기1]-------
--사원정보 출력 PL/SQL
--(실행) 외부데이터로 사원번호를 받아 emp 테이블에서 아래 내용 출력
--(출력) 사원번호 :7788 사원명 : TOM 급여 780
declare
    v_empno number:=&empno;
    v_ename varchar2(100);
    v_sal number;
begin
    select ename,sal into v_ename,v_sal
        from emp
        where empno=v_empno;
    dbms_output.put_line('사원번호 : '||v_empno||
                        ' 사원명 : '||v_ename||
                        ' 급여 : '||v_sal);
end;
/
---------[풀어보기2]-------
--부서정보 입력 PL/SQL
--(실행) dept 테이블에 데이터 입력하기(부서번호/부서명/부서위치를 외부데이터 받기)
--(조건) 부서번호와 부서명의 중복방지
--문자타입엔 ''이 있어야함
savepoint sp1;

declare
    v_deptno dept.deptno%type := &p_deptno;
    v_dname dept.dname%type :='&p_dname';
    v_loc dept.loc%type :='&p_loc';
    v_cnt number:=0;
begin
    select count(1) into v_cnt from dept
        where deptno = v_deptno or dname = v_dname;
    if v_cnt = 0 then
        insert into dept values(v_deptno,v_dname,v_loc);
        dbms_output.put_line('입력성공');
    else
        dbms_output.put_line('이미 있는 부서번호 입니다.');
    end if;
end;
/
---------[풀어보기3]-------
--부서정보 수정 PL/SQL
--(실행)dept 테이블에 데이터 수정하기 (부서번호/부서명/부서위치를 외부데이터에서 받기)
--(조건)부서번호 존재 유무/부서명의 중복 방지
declare
    v_deptno dept.deptno%type := &p_deptno;
    v_dname dept.dname%type :='&p_dname';
    v_loc dept.loc%type :='&p_loc';
    v_cnt number:=0;
begin
    select count(1) into v_cnt from dept
        where deptno = v_deptno;
    if v_cnt=0 then
        dbms_output.put_line('없는 번호입니다.');
    else
        update dept set dname=v_dname,
                        loc=v_loc
                    where deptno = v_deptno;
        dbms_output.put_line('내용 변경 성공!');
    end if;
end;
/
select *from dept;
---------[풀어보기4]-------
--dept 테이블에서 부서 삭제
--(조건)emp (사원)테이블에 관련 부서의 직원이 존재하면 삭제불가
--(처리) 1. 외부에서 삭제할 부서번호 받음
--2.dept 테이블에 부서번호의 존재 유무 체크
--3.emp 테이블에 소속지원의 존재유무 체크
--4. 삭제처리
declare
    v_deptno dept.deptno%type := &p_deptno;
    v_cnt number :=0;
begin
    select count(1) into v_cnt from dept
        where deptno = v_deptno;
    if v_cnt=0 then
        dbms_output.put_line('없는 부서번호입니다.');
    else
        select count(1) into v_cnt from emp
        where deptno =v_deptno;
        if  v_cnt>0 then
                dbms_output.put_line('소속 직원이 존재합니다');
        else 
            delete from dept where deptno=v_deptno;
            dbms_output.put_line('부서가 삭제되었습니다');
        end if;
    end if;
end;
/
select *from dept;

---------[풀어보기5]-------
--테이블의 code라는 컬럼에 1씩 증가시켜서 값을 넣기
--테이블 생성
create table test80 (code varchar2(5));

declare
    v_cnt number := 1;
    v_code varchar2(5);
begin
    loop
        v_code :='a'||cnt;
        insert into test80(code) values (v_code);
        v_cnt:=v_cnt+1;
        exit when v_cnt>10;
    end loop;
end;
/
select *from test80;
---------[풀어보기6]-------
--1부터 100까지의 누적 합계
declare 
    v_hap number :=0;
begin
    for i in 1..100
        loop   v_hap:= v_hap+i;
        end loop;
        dbms_output.put_line('합 : '||v_hap);
end;
/
---------[풀어보기7]-------
--급여인상 (매개변수로 사원번호 입력) 프로그램 만들기
--(조건) 급여 0~1000 +100
--  1001~2000은 +110
--  2001~3000은 +120
--  그 이상 인상 없음

--p_empno는 매개변수를 받는용도로만 가능(따로 불러와서 사용불가)
--else 부분 사원번호 존재한다면 else 실행; 
declare 
    v_empno emp.empno%type:=&p_empno;
    v_cnt number;
    v_sal1 emp.sal%type:=0;
    v_sal2 emp.sal%type:=0;
begin
    select count(1) into v_cnt from emp
    where empno =v_empno;
        
    if v_cnt =0 then
        dbms_output.put_line(v_empno||'는 없는 번호입니다.');
    else
        select sal into v_sal1 from emp where empno=v_empno;
            if v_sal1 <1000 then
                v_sal2:=v_sal1+100;
            elsif v_sal1 <= 2000 then
                v_sal2:=v_sal1+110;
            elsif v_sal1 <=3000 then
                v_sal2:=v_sal1+120;
            else
                v_sal2:=v_sal1;
            end if;
            update emp set sal=v_sal2
            where empno = v_empno;
    end if;
end;
/
rollback;
select *from emp;

--사원 추가
insert into emp(empno,ename,job)
values ((select max(empno)+1 from emp),'HTML1','HTML');