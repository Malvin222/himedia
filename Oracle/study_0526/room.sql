--[펜션예약시스템]

--1.회원정보
--2.룸정보
--3.예약정보
--{회원정보}
--아이디/암호/이름/핸드폰번호/성별/출생일
--{룸정보}
--룸번호/크기/수용인원/요금
--{예약정보}
--고유번호/아이디/예약기간/인원수/결제여부/룸번호


--아이디/암호/이름/핸드폰번호/성별/출생일
create table p_member(
    userid varchar2(20) primary key,
    pass varchar2(100) not null,
    name varchar2(20) not null,
    phone varchar2(20) not null,
    gender char(1) check(gender in ('M','F')),
    birthday date,
    rdate timestamp
);

--룸번호/크기/수용인원/요금
create table p_room ( 
    room_no number primary key,
    room_size number default '0',
    admit_cnt number default '0',
    money number default '0'
);

--고유번호/아이디/예약기간/인원수/결제여부/룸번호
create table p_reserve(
    unq number primary key,
    userid varchar2(20) not null,
    sdate date not null,
    edate date not null,
    mcnt number default '0', --인원수
    app char(1) check(app in ('1','2','3')),
    room_no number not null,
    constraint p_reserve_userid_fk foreign key(userid)
                    references p_member(userid)
);

create sequence p_reserve_seq 
increment by 1
start with 1
maxvalue 99999999;

insert into p_member
    values('test1','11','곰돌이','010-222-7777','M',
            '2000-03-23','2021-04-05 12:52:33');
insert into p_member
    values('test2','1212','야옹이','010-5656-3322','F',
            '1998-09-17','2021-10-14 13:00:33');
insert into p_member
    values('abc77','222','멍멍이','010-7897-3561','M',
            '1991-12-02','2022-06-07 17:20:30');
insert into p_member
    values('linux22','55','토발즈','010-222-3561','M',
            '2002-05-19','2023-01-23 18:22:10');
insert into p_member
    values('test77','1111','어울림','010-3333-7777','F',
            '1999-04-05','2023-01-25 18:30:10');
            
insert into p_room values('101','15','4','150000');
insert into p_room values('102','20','8','200000');
insert into p_room values('103','30','20','300000');

--결제 (1:결제완료, 2.미결제 3:결제대기)
insert into p_reserve(unq,userid,sdate,edate,mcnt,app,room_no)
    values(p_reserve_seq.nextval,'test1',
                                 '2022-12-24','2022-12-24'
                                 ,'2','1','101');
insert into p_reserve(unq,userid,sdate,edate,mcnt,app,room_no)
    values(p_reserve_seq.nextval,'test1',
                                 '2023-05-26','2023-05-28'
                                 ,'3','1','101');
insert into p_reserve(unq,userid,sdate,edate,mcnt,app,room_no)
    values(p_reserve_seq.nextval,'test2',
                                 '2023-05-27','2023-05-28'
                                 ,'5','1','102');                      
commit;

select *from p_member;
select *from p_room;
select *from p_reserve;

-----------[풀어보기]------------
--1. 회원테이블에서 최근 등록한 회원 순으로 출력
select *from p_member order by rdate desc;
--2.회원아이디,회원이름,연락처,예약시작일,예약종료일,방번호(예약전체)
select r.userid,
       m.name,
       m.phone,
       to_char(r.sdate,'yyyy-mm-dd') sdate,
       to_char(r.edate,'yyyy-mm-dd') edate,
       r.room_no 
        from p_member m,p_reserve r
        where r.userid=m.userid;
--3.오늘 포함 예약자 정보 (회원이름,연락처,예약시작일,예약종료일,방번호)
select r.userid,
       m.name,
       m.phone,
       to_char(r.sdate,'yyyy-mm-dd') sdate,
       to_char(r.edate,'yyyy-mm-dd') edate,
       r.room_no 
    from p_member m,p_reserve r 
    where r.userid = m.userid
        and r.sdate >= to_char(sysdate,'yyyy-mm-dd');
--4.test1 사용자의 예약정보 출력 (행번호,아이디,이름,예약일,방번호)
select rownum,r.userid,m.name,r.sdate,r.room_no
    from p_member m,p_reserve r
    where m.userid = r.userid
        and m.userid = 'test1';
--5.올해의 총 결제금액 출력
select '올해의 수입 '|| to_char(sum(rm.money),'FM999,999,999')||'원' income
    from p_room rm, p_reserve rv
    where rv.room_no =rm.room_no
        and to_char(sdate,'yyyy') = to_char(sysdate,'yyyy');