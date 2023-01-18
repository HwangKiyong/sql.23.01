select hire_date
from employees
where hire_date = '2003/06/17';

select salary
from employees
where salary = '7000';
--���ڷ� parsing�� �����Ѱ��� �����̵ȴ�.

select hire_date || ''
from employees;
--��¥�� ���ڷ� �ٲ�°�
select salary || ''
from employees;
--���ڰ� ���ڷ� �ٲ�°�
select to_char(hire_date)
from employees;

select to_char(sysdate, 'yyyy-mm-dd')
from dual;

select to_char(sysdate, 'YEAR MONTH DDsp DAY(DY)')
from dual;

select to_char(sysdate, 'Year Month Ddsp Day(Dy)')
from dual;
--���� ���� ��ҹ��ڸ� �����ϴ¹��
select to_char(sysdate, 'd')
from dual;
--index�� ���ڷ� �ٲٴ°� d�� ����ϸ�ȴ�. ����Ұ�!
select last_name, hire_date,
    to_char(hire_date, 'day'),
    to_char(hire_date, 'd')
from employees;

-- ����: �� ���̺��� �����Ϻ��� �Ի��ϼ� �������� �����϶�.
select last_name, hire_date,
    to_char(hire_date, 'day') day
from employees
order by to_char(hire_date - 1, 'd');

select to_char(sysdate, 'hh24:mi:ss am')
from dual;
--�ð� �� �� ����,���ĸ� ��Ÿ���°��̴�.
select to_char(sysdate, 'DD "of" Month')
from dual;
--��¥�� ���� ��Ÿ����. �Ϲݹ��ڴ� "" �ȿ� �־��ָ�ȴ�.
select to_char(hire_date, 'fmDD Month YY')
from employees;
--fm fillmode �����ִ°��̴�. ������ �����ش�.

--����: ������� �̸�,�Ի���, �λ������� ��ȸ�϶�.
--      �λ������� �Ի��� �� 3���� �� ù��° �������̴�.
--      ��¥�� YYYY.MM.DD �� ǥ���Ѵ�.

select last_name, to_char(hire_date, 'YYYY.MM.DD') hire_date,
    to_char(next_day(add_months(hire_date, 3), 'monday'), 'YYYY.MM.DD') review_date
from employees;

select to_char(salary)
from employees;

select to_char(salary, '$99,999.99'), to_char(salary, '$00,000.00')
from employees
where last_name = 'Ernst';
-- 0�� ���ԵǸ� ���� �����ڸ��� 0���� ä���.
select '|' || to_char(12.12, '9999.99')|| '|',
    '|' || to_char(12.12, '0000.00') || '|'
from dual;

select '|' || to_char(12.12, 'fm9999.99')|| '|',
    '|' || to_char(12.12, 'fm0000.00') || '|'
from dual;

select to_char(1237, 'L9999')
from dual;

-- ����: <�̸�> earns <$,����> monthly but wants <$, ���� x 3>. �� ��ȸ�϶�.
select last_name || ' earns ' || 
    to_char(salary, 'fm$99,999') || ' monthly but wants'||
    to_char(salary * 3, 'fm$99,999') || '.'
from employees;

select last_name, hire_date
from employees
where hire_date = to_date('Sep 21, 2005', 'Mon dd,yyyy');
--to_date�� ���ڸ� ���ڷ� �����Ѵ�.
select last_name, hire_date
from employees
where hire_date = to_date('Sep 21, 2005', 'Mon  dd yy');

select last_name, hire_date
from employees
where hire_date = to_date('Sep 21, 2005', 'fxMon  dd yy');
--fx�� �ְԵǸ� ������ �����ʰԉ��� �� ����ó���� �Ѵ�.
select to_number('1237')
from dual;
--���ڸ� ���ڷ� �ٲ۴�.
select to_number('1,237.12')
from dual;

select to_number('1,237.12', '9,999.99')
from dual;

select nvl(null, 0)
from dual;

select job_id, nvl(commission_pct, 0)
from employees;
--nvl �� data ���� null���϶� ���Ǽ��������� ó�����ִ°��̴�.
-- ����: ������� �̸�, ����, ������ ��ȸ�϶�.
select last_name, job_id, salary * (1 + nvl(commission_pct,0)) * 12 ann_sal 
from employees
order by ann_sal desc;

-- ����: ������� �̸�, Ŀ�̼����� ��ȸ�϶�.
--       Ŀ�̼��� ������, No Commission�� ǥ���Ѵ�.
select last_name, nvl(to_char(commission_pct), 'No Commission')
from employees;

-- '1.2' = ����, 1.2 = ����

select job_id, nvl2(commission_pct, 'SAL+COMM', 'SAL') income
from employees;
--���� ������ parameter2 null�̸� parameter3
select job_id, nvl2(commission_pct, 'SAL+COMM', 0) income
from employees;

select first_name, last_name,
    nullif(length(first_name), length(last_name))
from employees;
--nullif �ΰ��� parameter���� ������ null�� �����Ѵ�.
select to_char(null), to_number(null), to_date(null)
from dual;

select last_name, job_id,
    coalesce(to_char(commission_pct), to_char(manager_id),'None')
from employees;
--coalesce parameter �� �Ѵ� null�̸� null�� ��ȯ�Ѵ�.
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
--decode �� a���� b�� �ٲٴ°��̴�.  
select decode(salary , 'a', 1)
from employees;

select decode(salary, 'a', 1, 0)
from employees;

select decode(job_id, 1, 1)
from employees;
--charŸ���� ���ڷ� ��ȯ�� �Ұ����ϴ�.

-- ����: ������� ����, ������ ����� ��ȸ�϶�.
--       �⺻ ����� null�̴�.
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
--case ���� when �񱳰� then ���ϰ� else end
--�񱳰����� Ÿ���� ���ƾ��ϰ� ���ϰ����� Ÿ���� ���ƾ��Ѵ�.
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
      end grade
from employees;

select last_name, salary,
    case when salary < 5000 then 'low'
         when salary < 10000 then 'medium'
         when salary < 20000 then 'high'
         else 'good'
    end grade
from employees;
--case when �񱳰� �ڸ��� �񱳰��� ������ ���ǰ��� �ִ´�.
-- ����: ������� �̸�, �Ի���, �Ի������ �����Ϻ��� ���ϼ����� ��ȸ�϶�.
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
