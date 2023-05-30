create table dept7(
    deptno number not null,
    dname varchar2(100) not null,
    loc varchar2(100) not null,
    constraint dept7_deptno_pk primary key(deptno),
    constraint dept7_dname_uk unique(dname)
    );
    
create table emp7(
    empno number not null,
    ename varchar(100) not null,
    job varchar2(5),
    mgr number,
    hiredate date,
    sal number default '0',
    comm number,
    deptno number not null,
    constraint emp7_empno_PK primary key(empno),
    constraint emp7_dept7_deptno_fk foreign key (deptno)
                                    references dept7(deptno)
    );
    
    select *from BOOK_TBL;
    select B_NAME,B_PRICE,B_PUBLISHER from BOOK_TBL where like '%네트워크%';
    
    