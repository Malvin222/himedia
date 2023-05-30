--깨져서 한자로 뜸 

create table sports(code number, name varchar(10));
insert into sports(code,name) values(101,'绵备');
insert into sports(code,name) values(102,'具备');
insert into sports(code,name) values(103,'硅备');
select * from sports;
select name from sports;
update sports set name='绵备' where code ='101';
update sports set name ='具备' where code ='102';
update sports set name = '硅备' where code = '103';
select *from sports;

delete from sports where code = '101';
select *from sports;
delete from sports;

rollback;

//角嚼3
create table flowerInfo(code varchar2(10),
name varchar2(20),
color varchar2(20),
price number);

insert into flowerInfo (code,name,color,price) values(101,'rose','red',500);
insert into flowerInfo (code,name,color,price) values(102,'rose','yellow',3000);
insert into flowerInfo (code,name,color,price) values(103,'hurb','green',2500);
select *from flowerInfo;
select name from flowerInfo;
select name,price from flowerInfo;

select *from flowerInfo where name='rose';
select  *from flowerInfo where price>=1000;
select *from flowerInfo where price<1000;
select *from flowerInfo where name='rose' and color='yellow';
select *from flowerInfo where price<=2000 and price>=1000;
update flowerInfo set color ='pink' where code ='102';
select *from flowerinfo;
delete from flowerinfo where code='103';
select *from flowerinfo;

//角嚼4
create table bookinfo(
code varchar(20),
title varchar(50),
country varchar(30));

insert into bookinfo (code,title,country) values('j02','jsp','');
insert into bookinfo (code,title)values('j03','oracle');
insert into bookinfo (code,title,country)values('j04','mysql','usa');
insert into bookinfo values('j06','linux','korea');
select  *from bookinfo;
select count(*) from bookinfo;
select count(code) from bookinfo;
select count(title) from bookinfo;
select count(country) from bookinfo;

//钱绢焊扁
select *from bookinfo where title='linux';
select *from bookinfo where country is null;
select *from bookinfo where country=null;
select  country from bookinfo;

update bookinfo set country = 'korea' where code ='j02';
select *from bookinfo
