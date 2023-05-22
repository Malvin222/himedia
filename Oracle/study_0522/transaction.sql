--[트랜잭션](transaction)--
-- 작업그룹
-- 여러개 발생 가능
-- 커밋과 커밋 사이를 말함
-- commit/ rollback/ savepoint
-- (작업종료)/(작업취소)/(작업위치)
-- insert/ update/ delete
-- create(x)관련없음

create table subject (
title varchar2(100),
price number);

--cmd 화면 로그인
-- sqlplus c##java/1234
--desc subject;
--select *from subject;
--선택된 레코드가 없습니다
--커밋 후
--select * from subject;

insert into subject values('java',10000);
select *from subject;
commit;
insert into subject values('jsp','30000');
insert into subject values('html','15000');
select *from subject;
rollback;

--커밋 하드웨어에 적용
commit;
rollback;
--커밋 이후는 롤백 불가

delete from subject where title = 'jsp';
select *from subject;
rollback;

--create는 커밋없이 바로 적용
create table abc(userid varchar2(100) );
rollback;
desc abc;

--save point 테스트--
select *from subject;
insert into subject values('a1',1000);
savepoint sp1;
---------아래부터 적용--------
select *from subject;
insert into subject values('a2',2000);
savepoint sp2;
select *from subject;
rollback to sp1;