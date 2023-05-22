--날짜 정보 출력  --from dual : 가상테이블 (형식을 위한 테이블) 설정
-- 주석: --
select sysdate from dual;   --연/월/일 (시 분 초 숨겨져있음)
select systimestamp from dual;  --연/월/일 시:분:초
--포멧 설정 : to_char (시간,포맷(형식:----/--/-- --:--:--))
-- to_char : 시간을 문자열로 바꾸어주는 함수
        --yyyy:년도4자리 mm:월2자리 dd:일 2자리   hh24:24시간2자리 mi:분 ss:초 
select to_char(sysdate,'YYYY/MM/DD HH24:mi:ss')from dual; --현재시간

-- 날짜/증가 감소
-- 일 (날짜)단위 증가와 감소는 +,-연산기호를 사용한다.
select sysdate, sysdate+3 from dual;    --날짜기준 3일 증가
select to_char(sysdate-3,'yyyymmdd hh24miss') from dual; --3일 감소
select to_char(sysdate+1,'yyyymmdd hh24miss')from dual; --1일후
select to_char(sysdate+(2/24),'yyyymmdd hh24miss') from dual; --2시간후 ->1일을 24로 나눔
select systimestamp, sysdate-1 from dual;
--add_month() : 월단위 증가/감소 -*날짜를 동일하게 세팅해야 정수타입의 결과를 얻음
select add_months(sysdate,2)from dual;
--months_between() : 월단위의 차이 반환 month_between(큰달,작은달)
select months_between('2021-09-02','2021-08-02')from dual;
select round(months_between('2021-09-02','2021-08-03'),2) from dual;
--last_day: 해당 달의 마지막 날짜 반환
select last_day(sysdate) from dual;
select last_day ('2021-02-01') from dual;

--to_char()함수
--(1)년월일 시분초
select to_char (sysdate,'yyyy-mm-dd am hh:mi:ss') from dual;
--(2)올해의 연도
select to_char(sysdate,'yyyy')from dual;
select to_char(sysdate,'yy')from dual;
--(3)올해의 날짜와 요일 출력
select to_char(sysdate,'yyyy-mm-dd day') from dual;
select to_char(sysdate,'d') from dual;
select to_char(sysdate,'dy') from dual;
select to_char(sysdate,'day') from dual;

--to_date()함수 : 문자열 타입의 날짜값을 날짜타입으로 변환
--(4) select to_date ( 문자열, 포맷)
select to_date('20230522 15:22:30','yyyy-mm-dd hh24:mi:ss') from dual;
    --23/05/22
--select to_char('20230522 15:22:30','yyyy-mm-dd hh24:mi:ss') from dual;
    --error
select to_char(sysdate,'yyyy-mm-dd') from dual;
--(5) 월 일을 당일을 적용 : 출력날짜가 5월22일이면 5월 1일
select to_date('1998','yyyy') as mydate from dual;

--to_char() 함수의 다른기능 
--정수(숫자)에 3자리마다 콤마(,)찍기 9:숫자 의미 (fm: 주어진 숫자보다 작으면 안됨)
-- as name : 컬럼명을 name 값으로 적용
select to_char(123456,'fm999,999') as num1 from dual;
select to_char(1234567890,'fml999,999,999,999') from dual;
select to_char(1234567,'fm$999,999') from dual; --error #####으로뜸 ->1234567보다 fm-999,999가 작음

--to_number()함수 :문자타입의 숫자들도 연산이 가능하나 
--              낮은버전에서는 문자컬럼('')안의 숫자들은 연산이 안될 수 있음 그 때 사용;
select '50'+'30' as sum from dual;

