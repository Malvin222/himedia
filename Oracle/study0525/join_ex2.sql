create table h_member1(
userid varchar2(20),
pass varchar2(100),
name varchar2(20),
birthday date,
phone varchar2(20));

alter table h_member1 modify userid varchar2(20) not null primary key;
alter table h_member1 modify pass varchar2(100) not null;
alter table h_member1 modify name varchar2(20) not null;

desc h_member1;
select *from h_member1;

insert into h_member1(userid,pass,name,birthday,phone) 
    values('hong','1234','홍길동','2010-04-23','');
insert into h_member1(userid,pass,name,birthday,phone)
    values('tiger','1111','호돌이','2010-11-11','010-5555-7777');
insert into h_member1(userid,pass,name,birthday,phone)
    values('linux','qwer','토발즈','2010-08-17','010-2222-1234');
insert into h_member1(userid,pass,name,birthday,phone)
    values('java','1212','고릴라','2010-01-02','010-1111-7777');
    
create table h_sore1(
userid varchar(20),
eng number,
kor number);

alter table h_score1 modify userid varchar(20) not null primary key;
alter table h_score1 modify eng number default '0';
alter table h_score1 modify kor number default '0';

insert into h_score1(userid,eng,kor)
    values('hong',90,80);
insert into h_score1(userid,eng,kor)
    values('tiger',68,54);
insert into h_score1(userid,eng,kor)
    values('linux',98,62);

select *from h_score1;

create table h_grade1(
grade varchar(1),
loscore number,
hiscore number);

insert into h_grade1(grade,loscore,hiscore)
    values('A',90,100);
insert into h_grade1(grade,loscore,hiscore)
    values('B',80,89);
insert into h_grade1(grade,loscore,hiscore)
    values('C',70,79);
insert into h_grade1(grade,loscore,hiscore)
    values('D',60,69);
insert into h_grade1(grade,loscore,hiscore)
    values('F',0,59);
    
select *from h_grade1;

--1.아이디,이름,영어점수,국어점수    (등가조인)
select m.userid,m.name,s.eng,s.kor from h_member1 m,h_score1 s 
    where m.userid=s.userid;    --멤버 userid와 스코어 userid를 조인(매칭)

--2.아이디,이름,영어점수,국어점수 --조인되지 않은 데이터 출력 (outer 조인)
select m.userid,m.name,s.eng,s.kor from h_member1 m,h_score1 s 
    where m.userid = s.userid (+);  --스코어 userid값이 부족하므로 (+)처리-->java가 시험을 안봄 

--3.아이디,이름,총점,평균 --(영어+국어),(영어+국어)/2   
select m.userid,
       m.name,
       (s.eng+kor) as sum,
       (s.eng+s.kor)/2 as avg
        from h_member1 m,h_score1 s --as 생략가능
        where m.userid = s.userid;  --userid 조인

--4.아이디,영어점수(학점)
select s.userid,s.eng||'('||g.grade||')' eng 
        from h_score1 s,h_grade1 g
    where s.eng between g.loscore and g.hiscore;    --s.eng와 grade 범위를 조인(매칭)

--5.아이디,이름,국어점수(학점)
select m.userid,m.name,s.kor||'('||g.grade||')' kor
    from 
        h_member1 m,h_score1 s,h_grade1 g
    where m.userid = s.userid --userid 조인
            and 
          s.kor between g.loscore and g.hiscore; -- s.kor와     
--5.1 이중 셀렉문 사용
select 
        m.userid,
        (select name from h_member1 where userid=s.userid) name,
        s.kor||'('||g.grade||')' kor
    from h_member1 m,h_score1 s,h_grade1 g
    where m.userid = s.userid and s.kor between g.loscore and g.hiscore;

--6.아이디,이름,국어점수(학점),영어점수(학점)
select 
        m.userid,
        m.name,
        s.eng||'('||g2.grade||')' as eng,
        s.kor||'('||g1.grade||')' as kor 
    from
         h_member1 m, 
         h_score1 s, 
         h_grade1 g1, 
         h_grade1 g2
    where 
          m.userid = s.userid
          and
          s.eng between g1.loscore and  g1.hiscore 
          and
          s.kor between g2.loscore and  g2.hiscore;

--7.아이디,이름,나이
select userid,
       name,
       to_char(sysdate,'yyyy')-to_char(birthday,'yyyy') age 
        from h_member1;

--8.총점합계 1등의 정보를 출력한다 --꼴등의 정보도 출력
-- rownum을 이용하지 못하므로 안쪽 셀렉문에 desc정렬을 한후 
-- 바깥 셀렉문에서 rownum = 1 을 가져옴(바깥셀렉문은 where로 rownum=1만 가져옴)
select a.*from a (
select   m.userid,
         m.name,
         s.eng+s.kor as sum,
         (s.eng+s.kor)/2 avg
        from h_member1 m,h_score1 s 
        where 
            m.userid =s.userid
        order by sum desc) a
      where rownum=1
      ;
--8.1 꼴등 정보 출력
-- rownum을 이용하지 못하므로 안쪽 셀렉문에 asc정렬을 한후 
-- 바깥 셀렉문에서 rownum = 1 을 가져옴
select a.* from ( 
select m.userid,
         m.name,
         s.eng+s.kor as sum,
         (s.eng+s.kor)/2 avg
    from h_member1 m,h_score1 s 
    where 
      m.userid =s.userid
      order by sum asc) a
      where rownum =1
      ;

--8.2 점수없이 정보만 출력 order by (s.eng+s.kor) desc
select a.* from ( 
select m.*
    from h_member1 m,h_score1 s 
    where 
      m.userid =s.userid
      order by (s.eng+s.kor) desc) a
      where rownum =1
      ;
--9.전화번호가 없는 데이터 출력한다
select *from h_member1 where phone is null;
select *from h_member1 where phone is not null;
--10.회원이름 중 "홍"씨성을 검색한다
select *from h_member1 where name like '홍%';
select *from h_member1 where name not like '홍%';