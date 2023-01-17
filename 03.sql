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