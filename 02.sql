-- where
select employee_id, last_name, department_id
from employees
where department_id = 50;
--boolean 타입의 where을 쓰는거다. true만 조회하게된다.

-- 과제: 176번 사원의 사번, 이름, 부서번호를 조회하라.
select employee_id, last_name, department_id
from employees
where employee_id = 176;

select employee_id, last_name, department_id
from employees
where last_name = 'Whalen';
/*statement에서는 대소문자 구별안한다. 
data에서는 대소문자를 구별해야한다.*/

select employee_id, last_name, hire_date
from employees
where hire_date = '2008/02/06';

select last_name, salary
from employees
where salary <= 3000;

-- 과제: 월 $12,000 이상 버는 사원들의 이름, 월급을 조회하라.
select last_name, salary
from employees
where salary >= 12000;

select last_name, job_id
from employees
where job_id != 'IT_PROG';

select last_name, salary
from employees
where salary between 2500 and 3500;
--between A and B 면 A이상 B이하이다. 실선의 형태이다.

select last_name
from employees
where last_name between 'King' and 'Smith';

-- 과제: 'King' 사원의 first_name, last_name, 직업, 월급을 조회하라.
select first_name, last_name, job_id, salary
from employees
where last_name = 'King';

select last_name, hire_date
from employees
where hire_date between '2002/01/01' and '2002/12/31';

select employee_id, last_name, manager_id
from employees
where manager_id in (100, 101, 201);
-- in 은 점선이다. between은 실선이다.

select employee_id, last_name, manager_id
from employees
where manager_id = 100 or
    manager_id = 101 or
    manager_id = 201;
--or는 한가지만 맞아도 true로 출력이된다.

select employee_id, last_name
from employees
where last_name in ('Hartstein', 'Vargars');

select last_name, hire_date
from employees
where hire_date in ('2003/06/17', '2005/09/21');

select last_name
from employees
where last_name like 'S%';
-- like 다음에는 char타입만 올수있다. like는 비슷하다의 표현이다.

select last_name
from employees
where last_name like '%r';

--과제: 이름에 s가 포함된 사원들의 이름을 조회하라.
select last_name
from employees
where last_name like '%s%';

--과제: 2005년에 입사한 사원들의 이름, 입사일을 조회하라.
select last_name, hire_date
from employees
where hire_date like '2005%';

select last_name
from employees
where last_name like 'K___';
-- _를 사용하면 한글자이다. _의 갯수가 글자의 숫자다.

-- 과제: 이름의 두번째 글자가 o 인 사원의 이름을 죄회하라. 
select last_name
from employees
where last_name like '_o%';

select job_id
from employees;

select last_name, job_id
from employees
where job_id like 'I_\_%' escape '\';
-- _가 포함되어있는거에는 \를 쓰는데 쓰게되면 escape '\'를 써줘야한다.

select last_name, job_id
from employees
where job_id like 'I_[_%' escape '[';

--과제: 직업에 _R이 포함된 사원들의 이름, 직업을 조회하라.
select last_name, job_id
from employees
where job_id like '%\_R%' escape '\';

select employee_id, last_name, manager_id
from employees;

select last_name, manager_id
from employees
where manager_id = null; 
-- where 절은 true값을 조회한다. true값이 null인것이다.

select last_name, manager_id
from employees
where manager_id is null;
-- is를 사용하게되면 null인 것을 찾게된다.

select last_name, job_id, salary
from employees
where salary >= 5000 and job_id like '%IT%';
--두가지 모두 충족했을때 and 연산자이다.
select last_name, job_id, salary
from employees
where salary >= 5000 or job_id like '%IT%';
--한가지라도 충족하면 or 연산자이다.

--과제: 월급이 $5000 이상 $12000 이하이다. 그리고,
--      20번이나 50번 부서에서 일하는 
--      위 사원들의 이름, 월급, 부서번호를 조회하라.
select last_name, salary, department_id
from employees
where (salary between 5000 and 12000) and
    department_id in (20,50);

--과제: 이름에 a와 e가 포함된 사원들의 이름을 조회하라.
select last_name
from employees
where last_name like '%a%' and 
    last_name like '%e%';
    
select last_name, job_id
from employees
where job_id not in ('IT_PROG', 'SA_REP');
-- not 연산자는 여집합을 구하는 것이다. 포함되어있는것이 아닌것들을 찾는다.

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

-- 과제: 직업이 영업이다. 그리고, 월급이 $2500, $3500가 아니다.
--       위 사원들의 이름, 직업, 월급을 조회하라.
select last_name, job_id, salary
from employees
where job_id like 'SA%' and 
        salary not in (2500,3500);
        
select last_name, department_id
from employees
order by department_id;
--order by 정렬이다 오름차순값이 기본값이다.

select last_name, department_id
from employees
order by department_id desc;
--desc를 추가하면 내림차순이다. sql에서는 index는 1부터 시작한다.
select last_name, department_id
from employees
order by 2;

select last_name, department_id dept_id
from employees
order by dept_id;
-- 별명을 사용하면 별명을 사용해도된다.

select last_name, hire_date
from employees
where department_id = 100
order by hire_date;
-- order by 는 맨마지막에 사용한다.

select last_name, department_id, salary
from employees
where department_id > 80
order by department_id asc, salary desc;
-- n차정렬을 원하면 ',' 사용하면된다.