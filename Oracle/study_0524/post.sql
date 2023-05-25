--우편번호,시도,구군,동면읍,리,섬,건물명
create table post1(
a1 varchar2(6) ,
a2 varchar2(50),
a3 varchar2(50),
a4 varchar2(50),
a5 varchar2(50),
a6 varchar2(50),
a7 varchar2(50)
);
--중복제거 distinct , 포함열 like, 연결연산자||
alter table post1 modify a7 varchar2(100);
truncate table post1; --데이터삭제
select count(*)from post1; --(1)
select count(*)from post1 where a2 like'%서울%'; --(2)
select post1.*from post1 where a2 like'%서울%' and rownum<=20; --(3)
select *from post1 where a2 like '%서울%' and a3= '서초구'; --(4)
select *from post1 where a4 like '%양재%'; --(5)
select distinct(a3) from post1 where a4 like '%양재%'; --(6)
select *from post1 where a7 like '%달서구청%'; --(7)
select distinct(a3) from post1 where a2 like '%대구%'; --(8)
select '['||a1||']'||' '||a2||' '||a3||' '||a4||' '||a7 as 결과주소 from post1 
    where a1 like '306762'; --(9)
------(10)------
select *from post1 where a2 like '%서울%';
--create talble 테이블명 as select ... : select 내용을 담는 테이블 생성
create table post_seoul as select *from post1 where a2 like '%서울%';
select count(*)from post_seoul ;

commit;
desc post1;