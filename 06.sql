--join 
select department_id, department_name, location_id
from departments;
--�μ� ������ (�μ����, �μ���, �������)
select location_id, city
from locations;
--location ������ (�������, ����)
--������ �� �� �ִ�, �Ǽ��� �Ѵ� �ƴϴ� �� ������.
--equi join(natural join)
select department_id, department_name, location_id, city
from departments natural join locations;
--natural join �� ���� Į���� �������� ã�Ƽ� ���ν�Ų��.

select department_id, department_name, location_id, city
from departments natural join locations
where department_id in (20, 50);

select employee_id, last_name, department_id, location_id
from employees  join  departments
using (department_id);

--����: ������ ������ 1���� �̸�, �μ���ȣ�� ��ȸ�϶�.
select last_name, department_id 
from employees
where department_id is null;
--������ ���϶� �����̴�.
select employee_id, last_name, department_id, location_id
from employees natural join departments;

select locations.city, departments.department_name
from locations join departments
using (location_id)
where location_id = 1400;

select l.city, d.department_name
from locations l join departments d
using (location_id)
where location_id = 1400;
--������ ����� �� �ִ�.
select l.city, d.department_name
from locations l join departments d
using (location_id)
where d.location_id = 1400;

select l.city, d.department_name, location_id
from locations l join departments d
using (location_id)
where location_id = 1400;
----------------------------------------------------------

select e.last_name, d.department_name
from employees e join departments d
using(department_id)
where d.manager_id = 100;

select e.employee_id, e.last_name, e.department_id,
    d.department_id, d.location_id
from employees e join departments d
on (e.department_id = d.department_id);

select employee_id, city, department_name
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id;

--����: ��query�� using ���� refactoring �϶�.
select employee_id, city, department_name
from employees e join departments d
using (department_id)
join locations l
using (location_id);

select e.employee_id, e.last_name, e.department_id,
    d.department_id, d.location_id
from employees e join departments d
on e.department_id = d.department_id
where e.manager_id = 149;

--����: Toronto �� ��ġ�� �μ����� ���ϴ� �������
--      �̸�, ����, �μ���ȣ, �μ���, ���ø� ��ȸ�϶�
select e.last_name, e.job_id, e.department_id,
    d.department_name, l.city
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where l.city = 'Toronto';

-- non-equi join, ���α׷��� ��ŭ �������ֵ� ã��
select e.last_name, e.salary, e.job_id
from employees e join jobs j
on e.salary between j.min_salary and j.max_salary
and j.job_id = 'IT_PROG';

-- self join
select worker.last_name emp, manager.last_name mgr
from employees worker join employees manager
on worker.manager_id = manager.employee_id;
--on���� ���λ���� error
select worker.last_name emp, manager.last_name mgr
from employees worker join employees manager
on manager_id = employee_id;
--select ���� ���λ���� error
select last_name emp, last_name mgr
from employees worker join employees manager
on worker.manager_id = manager.employee_id;

--����: ���� �μ����� ���ϴ� ������� �μ���ȣ, �̸�, ������� ��ȸ�϶�.
select e.department_id, e.last_name employee ,c.last_name colleague
from employees e join employees c
on e.department_id = c.department_id
and e.employee_id <> c.employee_id
order by 1, 2, 3;
--<> �ٸ��� ���̴�.
--����: Davies ���� �Ŀ� �Ի��� ������� �̸�, �Ի����� ��ȸ�϶�.
select e.last_name , e.hire_date
from employees e join employees d
on d.last_name = 'Davies'
and e.hire_date > d.hire_date;

--����: �Ŵ������� ���� �Ի��� ������� �̸�, �Ի���, �Ŵ�����, �Ŵ��� �Ի����� ��ȸ�϶�.
select w.last_name, w.hire_date, m.last_name, m.hire_date
from employees w join employees m
on w.manager_id = m.employee_id
and w.hire_date < m.hire_date;

-- inner join ���εǴ� row�鸸 ����ϰ� ���ε��� �ʴ� row�� ������.
select e.last_name, e.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id;

-- outer join ���ε��� �ʴ� row�� �����̵ȴ�.(������ ���鶧 ����Ѵ�)
select e.last_name, e.department_id, d.department_name
from employees e full outer join departments d
on e.department_id = d.department_id;
--left outer �� ���ԵǸ� �������̺����� ���ε��� �ʴ°� ä���.
--right outer �� ���ԵǸ� ������, full outer�� ���ԵǸ� ���δ� ä���.
--����: ������� �̸�,���,�Ŵ�����,�Ŵ����� ����� ��ȸ�϶�.
--      King ȸ�嵵 ���̺��� �����϶�.
select w.last_name, w.employee_id, m.last_name, m.employee_id
from employees w left outer join employees m
on w.manager_id = m.manager_id
order by 2;
--Ȯ��
select d.department_id, d.department_name, d.location_id, l.city
from departments d, locations l
where d.location_id = l.location_id;

select d.department_id, d.department_name, d.location_id, l.city
from departments d, locations l
where d.location_id = l.location_id
    and d.department_id in (20, 50);
    
select e.last_name, d.department_name, l.city
from employees e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id;

select e.last_name, e.salary, e.job_id
from employees e, jobs j
where e.salary between j.min_salary and j.max_salary
and j.job_id = 'IT_PROG';

select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id;
--inner join �� ���ʿ� (+)�� �ְԵǸ� left outer join�̴�.
select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+);
--inner join �� �����ʿ� (+)�� �ְԵǸ� right outer join�̴�.
--inner join �� ���ʿ�(+) �ִ� full outer join�� ����.
select worker.last_name || ' works for ' || manager.last_name
from employees worker, employees manager
where worker.manager_id = manager.employee_id;