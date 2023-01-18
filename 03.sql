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

/* ����:�̸��� J�� A�� M���� �����ϴ� ������� �̸�, �̸��� ���ڼ��� ��ȸ�϶�.
      �̸��� ù���ڴ� �빮��, �������� �ҹ��ڷ� ����Ѵ�. */
select last_name, length(last_name) 
from employees
where last_name like 'J%' 
      or last_name like 'A%'
      or last_name like 'M%';


select initcap(last_name), length(last_name) --initcap���� ù���ڸ� �빮�ڸ� ����Ѵ�.
from employees
where last_name like 'J%' or
    last_name like 'A%' or
    last_name like 'M%';
    
select round(45.926, 2) --�Ҽ��� �ø�ó�� 2��° parameter�� �Ҽ��� �ڸ����� ǥ���Ѵ�.
from dual;

select trunc(45.926 , 2) --�Ҽ��� ����ó��
from dual;

select round(45.923, 0), round(45.923)
from dual; --�ݿø�
select trunc(45.926, 0), trunc(45.923)
from dual; --����

-- ����: ������� �̸�, ����, 15.5% �λ�� ����(New Salary, ����), �λ��(Increase)�� ��ȸ�϶�.
select last_name, salary, salary + round(salary* 0.155) "New Salary" , salary * 0.155 "Increase"
from employees;

select last_name, salary,
    round(salary * 1.155) " New Salary",
    round(salary * 1.155) - salary "Increase"
from employees;    

select sysdate
from dual;
--sysdate ����ϴ³��� ��¥�� �����ش�

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
--��¥������ �������� �����Ѵ�.

select add_months('2023/01/18', 3)
from dual;
--�������� �����ش�.

select next_day('2023/01/18' , 4) 
from dual;
--2��° �Ķ���ʹ� 1 = �Ͽ��� 2 = ������ �� ��������. 
--���� ��¥ �Ŀ� ������ ��¥�� �������ش�.

select next_day('2023/01/18' , 'thursday') 
from dual;
-- ���ڷ� ���൵�ȴ�.
select next_day('2023/01/18' , 'thu') 
from dual;

select last_day('2023/01/18')
from dual;
--��¥�� ������ ���ϴ°��̴�.

--����: 20�� �̻� ������ ������� �̸�, ù�������� ��ȸ�϶�.
--      ������ �ſ� ���Ͽ� �����Ѵ�.
select last_name ,last_day(hire_date)
from employees
where months_between(sysdate, hire_date) >= 12 *20; --20���̻��� ǥ���Ѱ��̴�.

-- ����: ������� �̸�, ���� �׷����� ��ȸ�϶�.
--       �׷����� $1000 �� * �ϳ��� ǥ���϶�.
select last_name, salary, rpad(' ', salary / 1000 + 1, '*') sal
from employees
order by sal desc;



