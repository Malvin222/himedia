--[제약조건]
--'constraint 별칭 unique'

create table memberTest(
    unq number(9) not null
    ,id varchar2(30) not null
    ,pwd varchar2(100) not null
    ,name varchar2(30) --null 포함 가능
    ,gender char(1)    --'M','F'
    ,rdate timestamp   --년월일 시분초 ..date
    ,constraint mm_gender_ck check(gender in('M','F'))  --check :'M'아니면 'F'만 와야함
    ,constraint mm_unq_pk primary key(unq) --primary ket :고유값 보장,검색(index)테이블 올림
    ,constraint mm_id_un unique(id) ); --unique:고유값 보장
    
--테이블 코멘트
comment on table memberTest is '회원테이블';
--컬럼 코멘트
comment on column memberTest.unq is '고유번호';
comment on column memberTest.id is '아이디';

    
create sequence memberTest_seq
    increment by 1 
    start with 1
    maxvalue 9999999;
    
insert into memberTest(unq,id,pwd,name,gender,rdate)
    values(memberTest_seq.nextval,'test1','1111','홍길동','M',sysdate);
insert into memberTest(unq,id,pwd,name,gender,rdate)
    values(memberTest_seq.nextval,'test2','1212','멍멍이','F',sysdate);
insert into memberTest(unq,id,pwd,name,gender,rdate)
    values(memberTest_seq.nextval,'test2','2222','순돌이','M',sysdate);
    
create table memberTest2(
    unq number(9) not null primary key
    ,id varchar2(30) not null unique
    ,pwd varchar2(100) not null
    ,name varchar2(30) --null 포함 가능
    ,gender char(1) check(gender in('M','F'))    --'M','F'
    ,rdate timestamp   --년월일 시분초 ..date
    );

create table memberTest101(
    unq number(9) primary key
    ,id varchar2(30) unique
    ,pwd varchar2(100) not null 
    ,name varchar2(30) unique--null 포함 가능
    ,gender char(1) default 'M'check(gender in('M','F'))    --'M','F'
    ,rdate timestamp   --년월일 시분초 ..date
    );

--primary key 중복 불가
create table memberTest102(
    unq number(9) primary key
    ,id varchar2(30) primary key --primary key 중복 불가
    ,pwd varchar2(100) not null 
    ,name varchar2(30) unique--null 포함 가능
    ,gender char(1) default 'M'check(gender in('M','F'))    --'M','F'
    ,rdate timestamp   --년월일 시분초 ..date
    );

--constraint 별칭 primarykey 괄호 안에는 두개의 primary key 가능
create table memberTest103(
    unq number(9) not null
    ,id varchar2(30) not null
    ,pwd varchar2(100) not null
    ,name varchar2(30) not null --null 포함 가능
    ,gender char(1)    --'M','F'
    ,rdate timestamp   --년월일 시분초 ..date
    ,constraint mm_gender_ck1 check(gender in('M','F'))  --check :'M'아니면 'F'만 와야함
    ,constraint mm_unq_pk1 primary key(id,name) --primary ket :고유값 보장,검색(index)테이블 올림
);
insert into memberTest103 (unq,id,pwd,name,gender,rdate)
    values(1,'a1','1234','호돌이','M',sysdate);
insert into memberTest103 (unq,id,pwd,name,gender,rdate)
    values(2,'a2','1234','호순이','F',sysdate);
insert into memberTest103 (unq,id,pwd,name,gender,rdate)
    values(3,'a3','1234','호순이','F',sysdate);
--아이디,이름값이 똑같을경우 primary key에 걸림
insert into memberTest103 (unq,id,pwd,name,gender,rdate)
    values(2,'a2','1234','호순이','F',sysdate);
    
insert into memberTest103 (unq,id,pwd,name,gender,rdate)
    values(2,'a2','1234','호빵맨','M',sysdate);

--id, name 둘 다 모두 똑같을경우 primary key에 걸림 (and로 생각하면 됨)
select *from memberTest103;

--primary key 두개를 쓰는건 되지 않음
create table memberTest103(
    unq number(9) not null
    ,id varchar2(30) not null
    ,pwd varchar2(100) not null
    ,name varchar2(30) not null --null 포함 가능
    ,gender char(1)    --'M','F'
    ,rdate timestamp   --년월일 시분초 ..date
    ,constraint mm_gender_ck1 check(gender in('M','F'))  --check :'M'아니면 'F'만 와야함
    ,constraint mm_unq_pk11 primary key(id) --primary ket :고유값 보장,검색(index)테이블 올림
    ,constraint mm_unq_pk12 primary key(name)
);

-- constraint 없이 primary key 다 건 등록이 불가
create table memberTest104(
    id varchar2(30) primary key(id,name)
    ,pwd varchar2(100) not null
    ,name varchar2(30) not null --null 포함 가능
    ,gender char(1)    --'M','F'
    ,rdate timestamp   --년월일 시분초 ..date
 );
select *from memberTest;