
--[일반게시판]   -board1
--고유번호 :unq         숫자
--제목    :title       문자열 (100byte)
--암호    :pass        문자열  (100byte)
--글쓴이   :name        문자열 (30byte)
--내용    :content     문자열   (4000byte)
--등록일   :rdate       날짜     (연월일 시분초)
--조회수   :hit         숫자

--primary key :중복된 값 존재 x(고유한값) -테이블 탭 중 인덱스 탭에서 확인가능
create table board1 (
unq number not null primary key,
title varchar2(100) not null,
pass varchar2(100) not null,
name varchar2(30),
content varchar2 (4000),
rdate timestamp,
hit number
);

insert into board1(unq,title,pass,name,content,rdate)
    values(1,'oracle수업','1234','홍길동','냉무11',sysdate);
insert into board1(unq,title,pass,name,content,rdate)
    values(2,'java수업','1111','메이비','냉무11',sysdate);
insert into board1(unq,title,pass,name,content,rdate)
    values(3,'html수업','22225','나그네','냉무11',sysdate);

select *from board1;
update board1 set content ='냉무123' where unq='3';

--1. unq 1번의 제목,이름,내용을 출력
select title,name,content from board1 where unq='1';

--2. 이름이 "나그네"로 되어 있는 데이터를 출력
select *from board1 where name='나그네';

--3. 번호,제목,이름을 아래의 형식으로 목록 출력  --|| :연결연산자 , as : 컬럼명 변경출력 
select unq||':'||title||':'||name as title from board1 ;

--4. 제목과 내용의 길이를 목록 출력;
--oracle수업(4) length(content) :content 길이 출력
select title||'('||length(content)||')' as title from board1;

savepoint sp0;
--5. 조회수를 모두 1000으로 변경
update board1 set hit=1000;
select *from board1;

--6. 2번의 조회수를 1500,3번의 조회수를 2000으로 각각 변경
update board1 set hit =1500 where unq='2';
update board1 set hit =2000 where unq='3';
select *from board1;
commit;
--7. 최신글 순으로 출력 rdate 보단 고유번호로 정렬하는게 좀 더 정확함
select *from board1 order by unq desc;

--8. 조회수 많은 순으로 출력
select * from board1 order by hit desc;

rollback to sp0;
select * from board1;
--9. 제목에서 "java"라는 단어가 들어있는 데이터 출력 
--like :포함 문자열 추출 %: 아무 문자와도 상관없음
--java%: java라는 단어로 시작하는 문자열 java뒤에 아무 문자나 와도 상관없음
-- '.' :문자 한개
--'.body%' : body라는 단어 앞에 문자 한개가 반드시 있어야하고 뒤에 아무문자나 와도 상관없음
select *from board1 where title like '%java%';

--10. unq 3번의 조회수를 +100
update board1 set hit =100 where unq='3'; --(x)
update board1 set hit=hit+100 where unq='3'; --(o)