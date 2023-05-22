--[테이블 구조 변경]--
--alter 명령어
--rollback으로 되돌릴수 없음 (데이터가 아니기때문에)
create table subject(
title varchar2(100),
price number);
--변경 :title의 크기를 200byte로 재설정
alter table subject modify title varchar2(200);
desc subject;
--추가 : name 문자열(50byte) 추가 
alter table subject add name varchar2(50);
desc subject;
--삭제 : name 컬럼 삭제
alter table subject drop column name;
desc subject;
--컬럼명 변경 : alter table 테이블명 rename column 전컬럼명 to 생성컬럼명 
alter table subject rename column price to price100;
desc subject;

--[truncate]-- 테이블 초기화 (데이터 삭제) commit 관련 명령어가 아니기때문에 rollback 불가
truncate table subject; 
select *from subject;

--[drop]-- 테이블 삭제
drop table subject;

