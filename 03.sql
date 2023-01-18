--single function
desc dual
select * from dual;

select lower('SQL Course')
from dual;
--lower 은 소문자로 출력한다.
select upper('SQL Course')
from dual;
--upper 대문자로 출력한다.

select initcap('SQL Course')
from dual;
--init 은 문자의 앞글자만 대문자로 출력한다.

select last_name
from employees
where last_name = 'higgins';

select last_name
from employees
where last_name = 'Higgins';

select last_name
from employees
where lower(last_name) = 'higgins';

select concat('Hello', 'World')
from dual;

select substr('HelloWorld', 2, 5) --시작이 2이고 5글자인것을 표현한것이다.
from dual;

select substr('Hello', -1 , 1)
from dual;

select length('Hello')
from dual;

select instr('Hello', 'l')
from dual;
-- 왼쪽부터 검색하기때문에 3이 나오고 끝난다.
--return 값이 0보다 크다면 l이있는것이고 작다면 없는것이다(java에서)
select instr('Hello', 'w')
from dual;

select lpad(salary, 5, '*')
from employees;
--lapd 왼쪽을 채운다.
select rpad(salary, 5, '*')
from employees;
--rpad 오른쪽을 채운다.
select replace('JACK and JUE', 'J', 'BL')
from dual;
--replace 교체하는거다.
select trim('H' from 'Hello')
from dual;
-- trim은 머리와 꼬리에 잇는것을 짤라내는것이다.
select trim('l' from 'Hello')
from dual;

select trim(' ' from ' Hello ')
from dual;

--과제: 위 query에서 ' ' 가 trim 됐음을, 눈으로 확인 할 수 있게 조회하라.
select '|' || trim(' ' from ' Hello ')|| '|'
from dual;

select trim(' Hello World ')
from dual;

select employee_id, concat(first_name, last_name) name,
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
from employees
where substr(job_id, 4) = 'PROG';

-- 과제:위 query에서, where 절을 like 로 refactoring 하라.
select employee_id, concat(first_name, last_name) name,
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
from employees
where job_id like '%PROG';

/* 과제:이름이 J나 A나 M으로 시작하는 사원들의 이름, 이름의 글자수를 조회하라.
      이름의 첫글자는 대문자, 나머지는 소문자로 출력한다. */
select last_name, length(last_name) 
from employees
where last_name like 'J%' 
      or last_name like 'A%'
      or last_name like 'M%';


select initcap(last_name), length(last_name) --initcap으로 첫글자만 대문자를 출력한다.
from employees
where last_name like 'J%' or
    last_name like 'A%' or
    last_name like 'M%';
    
select round(45.926, 2) --소수점 올림처리 2번째 parameter는 소수점 자리수를 표기한다.
from dual;

select trunc(45.926 , 2) --소수점 내림처리
from dual;

select round(45.923, 0), round(45.923)
from dual; --반올림
select trunc(45.926, 0), trunc(45.923)
from dual; --내림

-- 과제: 사원들의 이름, 월급, 15.5% 인상된 월급(New Salary, 정수), 인상액(Increase)을 조회하라.
select last_name, salary, salary + round(salary* 0.155) "New Salary" , salary * 0.155 "Increase"
from employees;

select last_name, salary,
    round(salary * 1.155) " New Salary",
    round(salary * 1.155) - salary "Increase"
from employees;    

select sysdate
from dual;
--sysdate 출력하는날의 날짜를 보여준다

select sysdate + 1
from dual;

select sysdate - 1
from dual;

select sysdate - sysdate
from dual;

select last_name, sysdate - hire_date
from employees
where department_id = 90;

select months_between('2023/12/31', '2022/12/31')
from dual;
--날짜사이의 개월수를 리턴한다.

select add_months('2023/01/18', 3)
from dual;
--개월수를 더해준다.

select next_day('2023/01/18' , 4) 
from dual;
--2번째 파라미터는 1 = 일요일 2 = 월요일 로 지나간다. 
--적은 날짜 후에 요일을 날짜로 지정해준다.

select next_day('2023/01/18' , 'thursday') 
from dual;
-- 문자로 써줘도된다.
select next_day('2023/01/18' , 'thu') 
from dual;

select last_day('2023/01/18')
from dual;
--날짜의 말일을 구하는것이다.

--과제: 20년 이상 재직한 사원들의 이름, 첫월급일을 조회하라.
--      월급을 매월 말일에 지급한다.
select last_name ,last_day(hire_date)
from employees
where months_between(sysdate, hire_date) >= 12 *20; --20년이상을 표기한것이다.

-- 과제: 사원들의 이름, 월급 그래프를 조회하라.
--       그래프는 $1000 당 * 하나를 표시하라.
select last_name, salary, rpad(' ', salary / 1000 + 1, '*') sal
from employees
order by sal desc;



