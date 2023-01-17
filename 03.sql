--single function
desc dual
select * from dual;

select lower('SQL Course')
from dual;
--lower �� �ҹ��ڷ� ����Ѵ�.
select upper('SQL Course')
from dual;
--upper �빮�ڷ� ����Ѵ�.

select initcap('SQL Course')
from dual;
--init �� ������ �ձ��ڸ� �빮�ڷ� ����Ѵ�.

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

select substr('HelloWorld', 2, 5) --������ 2�̰� 5�����ΰ��� ǥ���Ѱ��̴�.
from dual;

select substr('Hello', -1 , 1)
from dual;

select length('Hello')
from dual;

select instr('Hello', 'l')
from dual;
-- ���ʺ��� �˻��ϱ⶧���� 3�� ������ ������.
--return ���� 0���� ũ�ٸ� l���ִ°��̰� �۴ٸ� ���°��̴�(java����)
select instr('Hello', 'w')
from dual;

select lpad(salary, 5, '*')
from employees;
--lapd ������ ä���.
select rpad(salary, 5, '*')
from employees;
--rpad �������� ä���.
select replace('JACK and JUE', 'J', 'BL')
from dual;
--replace ��ü�ϴ°Ŵ�.
select trim('H' from 'Hello')
from dual;
-- trim�� �Ӹ��� ������ �մ°��� ©�󳻴°��̴�.
select trim('l' from 'Hello')
from dual;

select trim(' ' from ' Hello ')
from dual;

--����: �� query���� ' ' �� trim ������, ������ Ȯ�� �� �� �ְ� ��ȸ�϶�.
select '|' || trim(' ' from ' Hello ')|| '|'
from dual;

select trim(' Hello World ')
from dual;

select employee_id, concat(first_name, last_name) name,
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
from employees
where substr(job_id, 4) = 'PROG';

-- ����:�� query����, where ���� like �� refactoring �϶�.
select employee_id, concat(first_name, last_name) name,
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
from employees
where job_id like '%PROG';