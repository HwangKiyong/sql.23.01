--group function,single function 리턴되는 row의 갯수가 1개이다.
select avg(salary), max(salary), min(salary), sum(salary)
from employees;
--평균, 최대값, 최소값, 합계 구하는법
select min(hire_date), max(hire_date)
from employees;
--min은 가장 오래된 날짜, max 는 가장 최근의 날짜이다.

-- 과제: 최고월급과 최소월급의 차액을 조회하라.
select max(salary) - min(salary) 
from employees;

select count(*) 
from employees;
--count를 많이 사용한다. row의 갯수를 세다이다. * 모든칼럼
--과제: 70번 부서원이 몇명인 지 조회하라.
select count(*)
from employees
where department_id = 70;

select count(employee_id)
from employees;

select count(manager_id)
from employees;

select avg(commission_pct)
from employees;
--영업사원들의 commission 평균을 구한다.
--과제: 조직의 평균 커미션율을 조회하라.
select avg(nvl(commission_pct, 0))
from employees;
--null값을 없앤다.
select avg(salary)
from employees;

select avg(distinct salary)
from employees;
--distinct 중복을 없앤다.
-- 과제: 직원이 배치된 부서 개수를 조회하라.
select count(distinct department_id)
from employees;

--과제: 매니저 수를 조회하라.
select count(distinct manager_id)
from employees;

select department_id, count(employee_id)
from employees
group by department_id
order by department_id;
--group by 는 그룹을 n개를 만들고 싶을때 사용한다.
--count 는 row의 갯수만큼 call한것이다.
select employee_id
from employees
where department_id = 30;

select department_id, job_id, count(employee_id)
from employees
group by department_id, job_id
order by department_id;
--group by를 사용할 땐 제목대로 사용을 해야한다.
--과제: 직업별 사원수를 조회하라.
select job_id, count(employee_id)
from employees
group by job_id
order by job_id;

select department_id, max(salary)
from employees
group by department_id
having department_id > 50;
--그룹에 대해 조건문을 사용하는것이 having이다.

select department_id, max(salary)
from employees
group by department_id
having max(salary) > 10000;

select department_id, max(salary) max_sal
from employees
group by department_id
having max_sal > 10000;
--별명으로는 알아듣지 못한다.

select department_id, max(salary)
from employees
where department_id > 50
group by department_id;

select department_id, max(salary)
from employees
where max(salary) > 10000
group by department_id;
--조건문을 사용할때 group 함수가 들어가게되면 having 함수를 사용해야한다.

select job_id, sum(salary) payroll
from employees
where job_id not like '%REP%'
group by job_id
having sum(salary) > 13000
order by payroll;
--지금 까지 배운 문법 전부 사용함
-- 과제: 매니저ID, 매니저별 관리 직원들 중 최소월급을 조회하라.
--       최소월급이 $6,000 초과여야 한다.
select manager_id, min(salary) 
from employees
where manager_id is not null
group by manager_id
having min(salary) > 6000
order by 2 desc;

select sum(max(avg(salary)))
from employees
group by department_id;
--부서 최대 월급자들의 평균 , group function 은 2단계까지 쓸수있다. 오류코드
select department_id, round(avg(salary))
from employees
group by department_id;

select department_id, round(avg(salary))
from employees;
-- 오류코드
-- 과제: 2001년, 2002년, 2003년도별 입사자 수를 조회하라.
select to_char(hire_date, 'yyyy') hire_year, count(*) emp_cnt
from employees
where to_char(hire_date, 'yyyy') in (2001, 2002, 2003)
group by to_char(hire_date, 'yyyy')
order by hire_year;


select sum(decode(to_char(hire_date, 'yyyy'), '2001', 1, 0)) "2001",
    sum(decode(to_char(hire_date, 'yyyy'), '2002' , 1, 0)) "2002",
    sum(decode(to_char(hire_date, 'yyyy'), '2003', 1, 0)) "2003"
from employees;

select count(case when hire_date like '2001%' then 1 else null end) "2001",
    count(case when hire_date like '2002%' then 1 else null end) "2002",
    count(case when hire_date like '2003%' then 1 else null end) "2003"
from employees;

-- 과제: 직업별, 부서별 월급합을 조회하라.
--       부서는 20, 50, 80 이다.
select job_id, sum(decode(department_id, 20, salary)) "20",
    sum(decode(department_id, 50, salary)) "50",
    sum(decode(department_id, 80, salary)) "80"
from employees
group by job_id;