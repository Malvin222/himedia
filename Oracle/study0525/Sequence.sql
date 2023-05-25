--시퀀스 sequence(자동 숫자증가,일반적으로 고유번호 생성시 사용)
create sequence h_member1_unq_seq
increment by 1  --증가수치
start with 1    --시작수치
maxvalue 99999; --최종수치

create table h_member2(
unq number not null primary key,
userid varchar2(20) not null,
pass varchar2(100) not null,
name varchar2(20) not null,
birthday date,    --timestamp
phone varchar2(20));

--nextval 다음 값 추가
insert into h_member2(unq,userid,pass,name,birthday,phone) 
    values(h_member1_unq_seq.nextval,'hong','1234','홍길동','2010-04-23','');
insert into h_member2(unq,userid,pass,name,birthday,phone)
    values(h_member1_unq_seq.nextval,'tiger','1111','호돌이','2010-11-11','010-5555-7777');
insert into h_member2(unq,userid,pass,name,birthday,phone)
    values(h_member1_unq_seq.nextval,'linux','qwer','토발즈','2010-08-17','010-2222-1234');
insert into h_member2(unq,userid,pass,name,birthday,phone)
    values(h_member1_unq_seq.nextval,'java','1212','고릴라','2010-01-02','010-1111-7777');

create table a100(
unq number not null primary key,
title varchar2(20));

insert into a100 (unq,title)values (h_member1_unq_seq.nextval,'aaa');
insert into a100 (unq,title)values (h_member1_unq_seq.nextval,'bbb');

-- a100 테이블 데이터 추가후 h_member2 테이블 데이터추가
insert into h_member2(unq,userid,pass,name,birthday,phone)
    values(h_member1_unq_seq.nextval,'ggg','1212','킹콩','2010-01-02','010-1111-7777');
--삭제
delete from h_member2 where unq='2';
--새로운 데이터
insert into h_member2(unq,userid,pass,name,birthday,phone)
    values(h_member1_unq_seq.nextval,'cccc','1212','호떡','2010-01-02','010-1111-7777');
    
--currval 현재까지 입력된 마지막 값
select h_member1_unq_seq.currval from dual;