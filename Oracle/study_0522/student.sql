-- char : character 의 약자로 확정길이 문자열 의미
-- userid -> [abc123]   varchar2 -> 7바이트로 변환 
--username -> [abc1234] char ->[abc1234   ] 10바이트 : 나머지 공간 (3바이트) 낭비

create table student(
    userid varchar2(20) not null,   --varchar2 :크기 가변,검색속도가 char보다 느림   
    username char(10) not null,     --char :크기 고정 ,검색속도가 varchar2보다 빠름  
    age number,
    gender char(1),
    grade char(1)
    );
--insert into student (userid,username) valuse('a1','n1');(o)
--insert into student (userid,age) values('a2',20);(x) --불가 username null

insert into student (userid,username,age,gender,grade) 
    values('st101','Tom',15, 'M',2);
insert into student (userid,username,age,gender,grade)
    values('st102','jane',16,'F',3);
insert into student (userid,username,age,gender,grade)
    values('st103','Yakima',14,'M',1);
insert into student (userid,username,age,gender,grade)
    values('st104','yong',14,'',1);
insert into student (userid,username,age,gender,grade)
    values('st105','minyo',0,'F','');
insert into student (userid,username,age,gender,grade)
    values('st106','kang',15,'',2);
insert into student (userid,username,age,gender,grade)
    values('st107','kim',0,'M','');
insert into student (userid,username,age,gender,grade)
    values('st108','miranda',15,'F',2);

select *from student;

--통계함수
select count(*) from student where gender is not null and grade is not null;
select sum(age) from student;
select avg(age) from student;
select min(age) from student;
select max(age) from student;

--alias(출력 타이틀(컬럼명) 변경)
select username as 이름, userid as 아이디 from student;

--order by(순차정렬/ 역순정렬)
--순차정렬 (ascending)
select *from student order by age asc;
--역순정렬 (descending)
select *from student order by age desc;

--Distinct(데이터 중복 제거)
select age from student;
select distinct(age) from student; 

--Q1
select username from student where grade='1';
select username,age from student where age>=15;
select userid from student where gender is null;
--Q2
select username,age,grade from student where userid='st101' or userid='st102';
select *from student where age>=15 and gender='F';
select userid,username from student where grade='2'and  gender='M';
select avg(age) from student where gender='M' and age is not null;
select *from student where gender='M' order by age asc ; 

--Q3 
savepoint sp0;
select *from student;
update student set age='14' where userid='st105';
update student set age='15' where userid='st107';
update student set grade = '1' where age='14';
update student set grade = '2' where age='15';
update student set grade = '3' where age='16';
update student set gender ='M' where gender is null;

select *from student;
rollback to sp0;
rollback;