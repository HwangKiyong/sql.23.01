select * -- '*'은 departments를 모두 사용하겠다는것이다.
from departments;

select department_id, location_id --두가지만 사용한다는것이다.
from departments;

select location_id, department_id --순서를 지정할 수 있다.
from departments;   --language 라 들여쓰면 알아듣지 못한다.

desc departments /*세미콜론이 붙지않는다.
command이기 때문에 알아들을수 있다.*/

select last_name, salary, salary + 300
from employees;

-- 과제: 사원들의 월급, 연봉을 조회하라.

select salary, salary*12
from employees;

select last_name, salary, 12 * salary + 100
from employees;

select last_name, salary, 12 * (salary + 100)
from employees;

select last_name, job_id, commission_pct
from employees; --SA 는 SAIL 의 줄임말이다.

select last_name, job_id, 12 * salary + (12 * salary * commission_pct)
from employees; --table을 설계할때는 null값을 최소화해야한다.

select last_name as name, commission_pct comm
from employees; --칼럼변경하는법 ,대문자로 표기된다.

select last_name "Name" , salary * 12 "Annual Salary"
from employees; --"" 를 사용하면 내가 원하는대로 맞출수 있다.

-- 과제: 사원들의 사번, 이름, 직업, 입사일(STARTDATE)을 조회하라.

select employee_id, last_name, job_id, hire_date startdate
from employees;

-- 과제: 사원들의 사번(Emp #), 이름(Name), 직업(Job), 입사일(Hire Date)를 조회하라.

select employee_id "Emp #", last_name "Name", job_id "Job", hire_date "Hire Date"
from employees;

select last_name || job_id 
from employees; -- '||'를 사용하면 붙이기 연산자이다.하나로 사용할 수 있다.

select last_name || ' is ' || job_id  
from employees; --''은 상수이다.

select last_name || ' is ' || job_id employee
from employees;

select last_name || null
from employees;

select last_name || commission_pct
from employees;

select last_name || salary
from employees;

select last_name || hire_date
from employees; -- date가 char로 변환이 된다.

select last_name || (salary * 12)
from employees;

-- 과제: 사원들의 '이름, 직업'(Emp and Title)을 조회하라.
select last_name || ', ' || job_id "Emp and Title"
from employees;
