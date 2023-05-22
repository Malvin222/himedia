--1.테이블 : bookinfo
--(1)컬럼1 : code 문자열(20byte)
--(2)컬럼2 : title 문자열 (50byte)
--(3)컬럼2 : country 문자열(30byte)


--  코드 실행시 뒷 주석 제거 후 실행해야함

create table bookinfo ( --(책정보 테이블) 테이블명은 보통 암호화처리시킴
code varchar2(20),      --책코드
title varchar2(50),     --책제목
country varchar2(30));  --책 출판국가

 --테이블 구조 확인
desc bookinfo;

select * from bookinfo;
--테이블 컬럼 세팅이랑 값 갯수랑 동일해야함;
insert into bookinfo(code,title,country) values('j02','jsp','');
insert into bookinfo(code,title) values ('j03','oracle');
insert into bookinfo(code,title,country) values('j04','mysql','usa');
insert into bookinfo(code) values  ('j05');
insert into bookinfo values ('j06','linux','korea');

--count() 함수
select count(*) from bookinfo;
select count(code) from bookinfo;
select count(title) from bookinfo;
select count(country) from bookinfo;

--(null) ->컬럼 초기화가 안된상태(구조물(데이터)이 없는 상태)

--풀어보기  --oracle에서 공백과 null은 동일시;
select * from bookinfo where title='linux';
select * from bookinfo where country is null;
select country from bookinfo;
update bookinfo set code='jo2' where country = korea;
