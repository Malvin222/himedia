create table BOOK_TBL(
    B_NO number not null,
    B_NAME varchar2(50) not null,
    B_COVERIMG varchar2(20),
    B_DATE date,
    B_PRICE number,
    B_PUBLISHER varchar2 (50),
    B_INFO varchar2(2000),
    constraint BOOK_TBL_B_NO_PK primary key(B_NO),
    constraint BOOK_TBL_B_NAME_UK unique(B_NAME)
    );
    
create sequence BOOK_TBL_NO_SEQ
increment by 1 
start with 101
maxvalue 99999;

drop sequence BOOK_TBL_NO_SEQ;

insert into BOOK_TBL(B_NO,B_NAME,B_COVERIMG,B_DATE,B_PRICE,B_PUBLISHER,B_INFO)
        values(book_tbl_no_seq.nextval,'리눅스시작','101.png',
                 to_date('20220101','yy/mm/dd'),24000,'영진','운영체제와 네트워크');
insert into BOOK_TBL(B_NO,B_NAME,B_COVERIMG,B_DATE,B_PRICE,B_PUBLISHER,B_INFO)
        values(book_tbl_no_seq.nextval,'자바초급','102.png',
                 to_date(20210303,'yy/mm/dd'),20000,'시공사','프로그래밍 시작하기');
insert into BOOK_TBL(B_NO,B_NAME,B_COVERIMG,B_DATE,B_PRICE,B_PUBLISHER,B_INFO)
        values(book_tbl_no_seq.nextval,'자바고급','103.png',
                 to_date(20220820,'yy/mm/dd'),30000,'시공사','데이터베이스 연동');
insert into BOOK_TBL(B_NO,B_NAME,B_COVERIMG,B_DATE,B_PRICE,B_PUBLISHER,B_INFO)
        values(book_tbl_no_seq.nextval,'오라클박사','104.png',
                 to_date(20230202,'yy/mm/dd'),32000,'하움','테이블과 제약조건');
insert into BOOK_TBL(B_NO,B_NAME,B_COVERIMG,B_DATE,B_PRICE,B_PUBLISHER,B_INFO)
        values(book_tbl_no_seq.nextval,'JAVASCRIPT','105.png',
                to_date(20220212,'yy/mm/dd'),15000,'다산북스','기초에서 계산기');
        
create table RENT_TBL(
    R_NO number not null,
    B_NO number not null,
    R_PRICE number default '0' not null,
    R_DATE date not null,
    R_STATUS char(1) default '0' not null,
    constraint RENT_TBL_R_NO_PK primary key(R_NO),
    constraint RENT_TBL_B_NO_FK foreign key(B_NO)
                        references BOOK_TBL(B_NO),
    constraint R_STATUS_CK check(R_STATUS in('0','1'))
    );
    
create sequence RENT_TBL_NO_SEQ
increment by 1 
start with 10001
maxvalue 99999;

drop SEQUENCE RENT_TBL_NO_SEQ;

insert into RENT_TBL (R_NO,B_NO,R_PRICE,R_DATE,R_STATUS)
    values(RENT_TBL_NO_SEQ.nextval,101,2400,
            to_date(20230520,'yy/mm/dd'),'0');
insert into RENT_TBL (R_NO,B_NO,R_PRICE,R_DATE,R_STATUS)
    values(RENT_TBL_NO_SEQ.nextval,102,2000,
            to_date(20230520,'yy/mm/dd'),'0');
insert into RENT_TBL (R_NO,B_NO,R_PRICE,R_DATE,R_STATUS)
    values(RENT_TBL_NO_SEQ.nextval,101,2400,
            to_date(20230521,'yy/mm/dd'),'0');
insert into RENT_TBL (R_NO,B_NO,R_PRICE,R_DATE,R_STATUS)
    values(RENT_TBL_NO_SEQ.nextval,101,2400,
            to_date(20230522,'yy/mm/dd'),'0');
insert into RENT_TBL (R_NO,B_NO,R_PRICE,R_DATE,R_STATUS)
    values(RENT_TBL_NO_SEQ.nextval,103,3000,
            to_date(20230522,'yy/mm/dd'),'1');
insert into RENT_TBL (R_NO,B_NO,R_PRICE,R_DATE,R_STATUS)
    values(RENT_TBL_NO_SEQ.nextval,104,3500,
            to_date(20230522,'yy/mm/dd'),'1');
insert into RENT_TBL (R_NO,B_NO,R_PRICE,R_DATE,R_STATUS)
    values(RENT_TBL_NO_SEQ.nextval,102,2000,
            to_date(20230525,'yy/mm/dd'),'1');
            
select *from BOOK_TBL;
select B_NAME,B_PRICE,B_PUBLISHER from BOOK_TBL where B_INFO like '%네트워크%';
select B_NO,B_NAME,B_PRICE from(
    select B_NO,B_NAME,B_PRICE from BOOK_TBL 
                                order by B_PRICE desc)
                                where rownum='1';
select *from RENT_TBL where rownum<=3;
select R_NO,R_PRICE,R_DATE,decode(R_STATUS,0,'반납완료',1,'대여중') R_STATUS from RENT_TBL;
select r.R_NO,b.B_NO,b.B_NAME,
            to_char(r.R_PRICE,'fm999,999') B_PRICE,
            to_char(to_date(r.R_DATE),'yyyy-mm-dd') R_DATE 
            from BOOK_TBL b, RENT_TBL r
            where b.B_NO = r.B_NO;
select B_NO,B_NAME,B_PUBLISHER from BOOK_TBL
                    where B_NO NOT in (select b.B_NO 
                    from BOOK_TBL b,RENT_TBL r
                    where b.B_NO =r.B_NO) ;
savepoint sp1;
update BOOK_TBL SET B_NO=110 where B_NO =101;
-- 무결성 제약조건(C##JAVA.RENT_TBL_B_NO_FK)이 위배되었습니다- 자식 레코드가 발견되었습니다
-- 외래키로 BOOK_TBL 에있는 B_NO= 101이 RENT_TBL에 있는 B_NO=101과 상속되어 변경불가.
select b.B_NAME,b.B_PUBLISHER,to_char(r.R_DATE,'yyyy-mm-dd') R_DATE 
                from BOOK_TBL b ,RENT_TBL r 
                where b.B_NO = r.B_NO 
                and r.R_DATE =to_DATE(20230522,'yy/mm/dd')
                and b.B_PUBLISHER like '%시공사%';
                
desc BOOK_TBL;
desc RENT_TBL;
commit;