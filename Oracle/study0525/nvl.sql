--NVL()함수) nvl(필드값,세팅값) ->필드값이 null인경우 세팅값 리턴
select ename,nvl(mgr,0) mgr from emp;

select ename,sal,comm,(sal+nvl(comm,0)) from emp;
                            --nvl2(컬럼,null이 아닌경우,null인경우)
select ename,sal,comm,(sal+nvl2(comm,comm+100,0)) from emp;