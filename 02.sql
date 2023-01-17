-- where
select employee_id, last_name, department_id
from employees
where department_id = 50;
--boolean Ÿ���� where�� ���°Ŵ�. true�� ��ȸ�ϰԵȴ�.

-- ����: 176�� ����� ���, �̸�, �μ���ȣ�� ��ȸ�϶�.
select employee_id, last_name, department_id
from employees
where employee_id = 176;

select employee_id, last_name, department_id
from employees
where last_name = 'Whalen';
/*statement������ ��ҹ��� �������Ѵ�. 
data������ ��ҹ��ڸ� �����ؾ��Ѵ�.*/

select employee_id, last_name, hire_date
from employees
where hire_date = '2008/02/06';

select last_name, salary
from employees
where salary <= 3000;

-- ����: �� $12,000 �̻� ���� ������� �̸�, ������ ��ȸ�϶�.
select last_name, salary
from employees
where salary >= 12000;

select last_name, job_id
from employees
where job_id != 'IT_PROG';

select last_name, salary
from employees
where salary between 2500 and 3500;
--between A and B �� A�̻� B�����̴�. �Ǽ��� �����̴�.

select last_name
from employees
where last_name between 'King' and 'Smith';

-- ����: 'King' ����� first_name, last_name, ����, ������ ��ȸ�϶�.
select first_name, last_name, job_id, salary
from employees
where last_name = 'King';

select last_name, hire_date
from employees
where hire_date between '2002/01/01' and '2002/12/31';

select employee_id, last_name, manager_id
from employees
where manager_id in (100, 101, 201);
-- in �� �����̴�. between�� �Ǽ��̴�.

select employee_id, last_name, manager_id
from employees
where manager_id = 100 or
    manager_id = 101 or
    manager_id = 201;
--or�� �Ѱ����� �¾Ƶ� true�� ����̵ȴ�.

select employee_id, last_name
from employees
where last_name in ('Hartstein', 'Vargars');

select last_name, hire_date
from employees
where hire_date in ('2003/06/17', '2005/09/21');

select last_name
from employees
where last_name like 'S%';
-- like �������� charŸ�Ը� �ü��ִ�. like�� ����ϴ��� ǥ���̴�.

select last_name
from employees
where last_name like '%r';

--����: �̸��� s�� ���Ե� ������� �̸��� ��ȸ�϶�.
select last_name
from employees
where last_name like '%s%';

--����: 2005�⿡ �Ի��� ������� �̸�, �Ի����� ��ȸ�϶�.
select last_name, hire_date
from employees
where hire_date like '2005%';

select last_name
from employees
where last_name like 'K___';
-- _�� ����ϸ� �ѱ����̴�. _�� ������ ������ ���ڴ�.

-- ����: �̸��� �ι�° ���ڰ� o �� ����� �̸��� ��ȸ�϶�. 
select last_name
from employees
where last_name like '_o%';

select job_id
from employees;

select last_name, job_id
from employees
where job_id like 'I_\_%' escape '\';
-- _�� ���ԵǾ��ִ°ſ��� \�� ���µ� ���ԵǸ� escape '\'�� ������Ѵ�.

select last_name, job_id
from employees
where job_id like 'I_[_%' escape '[';

--����: ������ _R�� ���Ե� ������� �̸�, ������ ��ȸ�϶�.
select last_name, job_id
from employees
where job_id like '%\_R%' escape '\';

select employee_id, last_name, manager_id
from employees;

select last_name, manager_id
from employees
where manager_id = null; 
-- where ���� true���� ��ȸ�Ѵ�. true���� null�ΰ��̴�.

select last_name, manager_id
from employees
where manager_id is null;
-- is�� ����ϰԵǸ� null�� ���� ã�Եȴ�.

select last_name, job_id, salary
from employees
where salary >= 5000 and job_id like '%IT%';
--�ΰ��� ��� ���������� and �������̴�.
select last_name, job_id, salary
from employees
where salary >= 5000 or job_id like '%IT%';
--�Ѱ����� �����ϸ� or �������̴�.

--����: ������ $5000 �̻� $12000 �����̴�. �׸���,
--      20���̳� 50�� �μ����� ���ϴ� 
--      �� ������� �̸�, ����, �μ���ȣ�� ��ȸ�϶�.
select last_name, salary, department_id
from employees
where (salary between 5000 and 12000) and
    department_id in (20,50);

--����: �̸��� a�� e�� ���Ե� ������� �̸��� ��ȸ�϶�.
select last_name
from employees
where last_name like '%a%' and 
    last_name like '%e%';
    
select last_name, job_id
from employees
where job_id not in ('IT_PROG', 'SA_REP');
-- not �����ڴ� �������� ���ϴ� ���̴�. ���ԵǾ��ִ°��� �ƴѰ͵��� ã�´�.

select last_name, salary
from employees
where salary not between 10000 and 15000;

select last_name, job_id
from employees
where job_id not like '%IT%';

select last_name, job_id
from employees
where commission_pct is not null;

select last_name, salary
from employees
where not (manager_id is null and salary >= 20000);

-- ����: ������ �����̴�. �׸���, ������ $2500, $3500�� �ƴϴ�.
--       �� ������� �̸�, ����, ������ ��ȸ�϶�.
select last_name, job_id, salary
from employees
where job_id like 'SA%' and 
        salary not in (2500,3500);
        
select last_name, department_id
from employees
order by department_id;
--order by �����̴� ������������ �⺻���̴�.

select last_name, department_id
from employees
order by department_id desc;
--desc�� �߰��ϸ� ���������̴�. sql������ index�� 1���� �����Ѵ�.
select last_name, department_id
from employees
order by 2;

select last_name, department_id dept_id
from employees
order by dept_id;
-- ������ ����ϸ� ������ ����ص��ȴ�.

select last_name, hire_date
from employees
where department_id = 100
order by hire_date;
-- order by �� �Ǹ������� ����Ѵ�.

select last_name, department_id, salary
from employees
where department_id > 80
order by department_id asc, salary desc;
-- n�������� ���ϸ� ',' ����ϸ�ȴ�.