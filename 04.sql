select hire_date
from employees
where hire_date = '2003/06/17';

select salary
from employees
where salary = '7000';
--숫자로 parsing이 가능한것은 변경이된다.

select hire_date || ''
from employees;
--날짜가 문자로 바뀌는것
select salary || ''
from employees;
--숫자가 문자로 바뀌는거
select to_char(hire_date)
from employees;

select to_char(sysdate, 'yyyy-mm-dd')
from dual;

select to_char(sysdate, 'YEAR MONTH DDsp DAY(DY)')
from dual;

select to_char(sysdate, 'Year Month Ddsp Day(Dy)')
from dual;
--위와 밑은 대소문자를 구별하는방법
select to_char(sysdate, 'd')
from dual;
--index를 숫자로 바꾸는건 d를 사용하면된다. 기억할것!
select last_name, hire_date,
    to_char(hire_date, 'day'),
    to_char(hire_date, 'd')
from employees;

-- 과제: 위 테이블을 월요일부터 입사일순 오름차순 정렬하라.
select last_name, hire_date,
    to_char(hire_date, 'day') day
from employees
order by to_char(hire_date - 1, 'd');

select to_char(sysdate, 'hh24:mi:ss am')
from dual;
--시간 분 초 오전,오후를 나타내는것이다.
select to_char(sysdate, 'DD "of" Month')
from dual;
--날짜와 월을 나타낸다. 일반문자는 "" 안에 넣어주면된다.
select to_char(hire_date, 'fmDD Month YY')
from employees;
--fm fillmode 눌러주는것이다. 여분을 맞춰준다.

--과제: 사원들의 이름,입사일, 인사평가일을 조회하라.
--      인사평가일을 입사한 지 3개월 후 첫번째 월요일이다.
--      날짜는 YYYY.MM.DD 로 표시한다.

select last_name, to_char(hire_date, 'YYYY.MM.DD') hire_date,
    to_char(next_day(add_months(hire_date, 3), 'monday'), 'YYYY.MM.DD') review_date
from employees;

select to_char(salary)
from employees;

select to_char(salary, '$99,999.99'), to_char(salary, '$00,000.00')
from employees
where last_name = 'Ernst';
-- 0을 쓰게되며 값이 없는자리를 0으로 채운다.
select '|' || to_char(12.12, '9999.99')|| '|',
    '|' || to_char(12.12, '0000.00') || '|'
from dual;

select '|' || to_char(12.12, 'fm9999.99')|| '|',
    '|' || to_char(12.12, 'fm0000.00') || '|'
from dual;

select to_char(1237, 'L9999')
from dual;

-- 과제: <이름> earns <$,월급> monthly but wants <$, 월급 x 3>. 로 조회하라.
select last_name || ' earns ' || 
    to_char(salary, 'fm$99,999') || ' monthly but wants'||
    to_char(salary * 3, 'fm$99,999') || '.'
from employees;

select last_name, hire_date
from employees
where hire_date = to_date('Sep 21, 2005', 'Mon dd,yyyy');
--to_date는 문자를 숫자로 리턴한다.
select last_name, hire_date
from employees
where hire_date = to_date('Sep 21, 2005', 'Mon  dd yy');

select last_name, hire_date
from employees
where hire_date = to_date('Sep 21, 2005', 'fxMon  dd yy');
--fx를 넣게되면 형식이 맞지않게됬을 때 에러처리를 한다.
select to_number('1237')
from dual;
--문자를 숫자로 바꾼다.
select to_number('1,237.12')
from dual;

select to_number('1,237.12', '9,999.99')
from dual;

select nvl(null, 0)
from dual;

select job_id, nvl(commission_pct, 0)
from employees;
--nvl 은 data 값이 null값일때 임의설정값으로 처리해주는것이다.
-- 과제: 사원들의 이름, 직업, 연봉을 조회하라.
select last_name, job_id, salary * (1 + nvl(commission_pct,0)) * 12 ann_sal 
from employees
order by ann_sal desc;

-- 과제: 사원들의 이름, 커미션율을 조회하라.
--       커미션이 없으면, No Commission을 표시한다.
select last_name, nvl(to_char(commission_pct), 'No Commission')
from employees;

-- '1.2' = 문자, 1.2 = 숫자

select job_id, nvl2(commission_pct, 'SAL+COMM', 'SAL') income
from employees;
--값이 있으면 parameter2 null이면 parameter3
select job_id, nvl2(commission_pct, 'SAL+COMM', 0) income
from employees;

select first_name, last_name,
    nullif(length(first_name), length(last_name))
from employees;
--nullif 두개의 parameter값이 같으면 null을 리턴한다.
select to_char(null), to_number(null), to_date(null)
from dual;

select last_name, job_id,
    coalesce(to_char(commission_pct), to_char(manager_id),'None')
from employees;
--coalesce parameter 가 둘다 null이면 null을 반환한다.
select last_name, salary, 
    decode(trunc(salary / 2000), 
        0, 0.00,
        1, 0.09,
        2, 0.20,
        3, 0.30,
        4, 0.40,
        5, 0.42,
        6, 0.44,
           0.45) tax_rate
from employees
where department_id = 80;    
--decode 는 a에서 b로 바꾸는것이다.  
select decode(salary , 'a', 1)
from employees;

select decode(salary, 'a', 1, 0)
from employees;

select decode(job_id, 1, 1)
from employees;
--char타입을 숫자로 변환이 불가능하다.

-- 과제: 사원들의 직업, 직업별 등급을 조회하라.
--       기본 등급은 null이다.
--       IT_PROG   A
--       AD_PRES   B
--       ST_MAN    C
--       ST_CLERK  D

select job_id , decode(job_id,
    'IT_PROG', 'A',
    'AD_PRES', 'B',
    'ST_MAN', 'C',
    'ST_CLERK', 'D') grade
from employees;

select last_name, job_id, salary,
    case job_id when 'IT_PROG' then 1.10 * salary
                when 'AR_PRES' then 1.05 * salary
    else salary end revised_salary
from employees;
--case 변수 when 비교값 then 리턴값 else end
--비교값끼리 타입이 같아야하고 리턴값끼리 타입이 같아야한다.
select case job_id when '1' then 1
                   when '2' then 2
                   else 0
      end grade
from employees;

select case job_id when '1' then '1'
                   when '2' then '2'
                   else '0'
      end grade
from employees;

select case salary when 1 then '1'
                   when 2 then '2'
                   else '0'
      end salary
from employees;

select last_name, salary,
    case when salary < 5000 then 'low'
         when salary < 10000 then 'medium'
         when salary < 20000 then 'high'
         else 'good'
    end grade
from employees;
--case when 비교값 자리에 비교값이 없으며 조건값을 넣는다.
-- 과제: 사원들의 이름, 입사일, 입사요일을 월요일부터 요일순으로 조회하라.
select last_name, hire_date, to_char(hire_date, 'fmday') day
from employees
order by case day
              when 'monday' then 1
              when 'tuesday' then 2
              when 'wednesday' then 3
              when 'thursday' then 4
              when 'friday' then 5
              when 'saturday' then 6
              when 'sunday' then 7
        end;   
        
-- 과제: 2005년 이전에 입사한 사원들에게 100만원 상품권,
--       2005년 이후에 입사한 사원들에게 10만원 상품권을 지급한다.
--       사원들의 이름, 입사일, 상품권 금액을 조회하라.

select last_name, hire_date,
    case when hire_date <= '2005/12/31' then '100만원'
        else '10만원' end gift
from employees
order by gift, hire_date;
          