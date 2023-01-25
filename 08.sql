--java 에선 List(key가 있다)는 중복된 값이 들어가고 set(key가 없다)은 중복된 값이 들어가지 않는다.
--set에서는 집합연산자(여집합,합집합,차집합 등등)에 관련된 공부를한다.
select employee_id, job_id
from employees
union --중복제거를 한다.
select employee_id, job_id
from job_history;
--union 은 합집합이다. 각 필드에 데이터타입과 칼럼이 같아야 사용할 수 있다.


select employee_id, job_id
from employees
union all --중복을 제거하지 않는다.
select employee_id, job_id
from job_history
order by employee_id;

--과제: 과거 직업을 현재 갖고 있는 사원들의 사번, 이름, 직업을 조회하라.
select employee_id, last_name, job_id
from employees e
where exists (select *
              from job_history j
              where e.employee_id = j.employee_id
                and e.job_id = j.job_id);
                
select employee_id, last_name, job_id
from employees e
where e.job_id in (select job_id
                    from job_history j
                    where e.employee_id = j.employee_id);
        
select e.employee_id, e.last_name, e.job_id
from employees e, job_history j
where e.employee_id = j.employee_id
and e.job_id = j.job_id;

select location_id, department_name
from departments
union
select location_id, state_province
from locations;

--과제: 위문장을 service 관점에서 고쳐라.
--      union 을 사용하라.

select location_id, department_name , null state
from departments
union 
select location_id, null, state_province
from locations;

select employee_id, job_id, salary
from employees
union
select employee_id, job_id
from job_history;
--칼럼 갯수가 맞지않기에 오류이다.

select employee_id, job_id, salary
from employees
union
select employee_id, job_id, 0
from job_history
order by salary;