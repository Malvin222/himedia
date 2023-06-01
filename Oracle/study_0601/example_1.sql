--테이블 카피  as 뒤에 셀렉문 -> 특정 테이블에 있는 내용들이 카피 
--         맞지않은 where 문 -> 데이터값이 맞지않아 데이터는 카피되지 않음 ,데이터값이 맞으면 데이터 또한 카피
create table emp101 
            as select empno,ename,job from emp where 1=2;

create table emp102 
            as select empno,ename,job from emp;
create table goods (code varchar2(20),name varchar2(20) );
    
-----------------[풀어보기]-----------------
--1. 사원번호 1001,1002,1003 -> insert 시 max 사용
--중간에 데이터 소실시 연결된 테이블끼리 데이터가 꼬여버릴 수가 있음 ->좋지 않은 코딩
insert into emp101 (empno,ename,job) 
        values((select nvl(max(empno),1000)+1 from emp101),'a1','aa');

select * from emp101;

--2. 사원번호 1001,1002,1003 -> insert 시 시퀀스 (생성후) 사용
--시퀀스 : 중간 데이터를 소실해도 채우지 않기때문에 유니크한 값을 생성 
--      -> 테이블끼리 연결되었을때 중간값이 소실되도 꼬일 확률이 적음 
create sequence emp102_seq
increment by 1 
start with 1001
maxvalue 999999;
insert into emp102 (empno,ename,job)
    values(emp102_seq.nextval,'b1','bb');
    
select * from emp102;

--3. 사원번호 sm1001,sm1002,sm1003 -> insert 시 사용자함수(생성후) 사용
--첫번째 select: max값을 가지고 옴 nvl->데이터가 null일때 sm1000을 가져옴
--두번째 select: 계산 substr로 v_code1의 1000을 불러와서 +1
create or replace function fn_goods_code1
return varchar2
is
    v_code1 varchar2(20);
    v_code2 varchar2(20);
begin
    select nvl(max(code),'sm1000') into v_code1 from goods; 
    select substr(v_code1,3)+1 into v_code1 from dual;
    v_code2 := 'sm'||v_code1;
    return v_code2;
end;
/
insert into goods values (fn_goods_code1(),'a2');
select *from goods;

--4.사원번호 sm0001,sm0002 ->insert 시 사용자함수(생성후) 사용
--첫번째 select문 sm0000이나 max (sm0000)을 v_code1에 적용
--두번째 select '1'||0000을 사용해서 10000을 만든후 v_code2로 1대은 sm을 붙임.
create table goods2 (code varchar2(20),name varchar2(20) );

create or replace function fn_goods_code2
return varchar2
is
    v_code1 varchar2(20);
    v_code2 varchar2(20);
begin
    select nvl(max(code),'sm0000') into v_code1 from goods2; 
    v_code1 :=substr(v_code1,3);
    select ('1'||v_code1)+1 into v_code1 from dual;
    v_code2 := 'sm'||substr(v_code1,2);
    return v_code2;
end;
/
insert into goods2 values (fn_goods_code2(),'a2');

select *from goods2;

------------------
select 10003 +1 from dual; 
select '0003' +1 from dual; 
select 'sm10003' +1 from dual;
select '0003' + 1 from dual;
select ('1'||'0003') +1 from dual;
select 'sm'||substr('10004',2) from dual;