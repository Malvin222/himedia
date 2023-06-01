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

--4.사원번호 sm0001,sm0002 ->insert 시 사용자함수(생성후) 사용


