--DML (Date Manipulation Language)
--transaction 작업의 시작부터 끝까지이다, 작업과정이다.
drop table dept;
--테이블 삭제하는 법

create table dept(
department_id number(4),
department_name varchar2(30),
manager_id number(6),
location_id number(4)
);
--테이블 생성하는 법
--data definition language ,auto commit이다
create table emp (
employee_id number(6),
first_name varchar2(20),
last_name varchar2(25),
email varchar2(25),
phone_number varchar2(20),
hire_date date,
job_id varchar2(10),
salary number(8, 2),
commission_pct number(2, 2),
manager_id number(6),
department_id number(4));

insert into dept(department_id, department_name, manager_id, location_id)
values (100, 'Public Relation', 100, 1700);

insert into dept(department_id, department_name)
values(310, 'Purchasing');

select * 
from dept;

commit;
--commit으로 끝을 내줘야한다.

insert into emp(employee_id, first_name, last_name, 
                email, phone_number, hire_date,
                job_id, salary, commission_pct,
                manager_id, department_id)
values (300, 'Louis', 'Pop',
        'Pop@gmail.com', '010-378-1278', sysdate,
        'AC_ACCOUNT', 6900, null, 
        205, 110);

insert into emp
values (320, 'Terry', 'Benard',
        'Benard@gmail.com', '010-637-0972', '2022/07/20',
        'AD_PRES', 5000, .2,
        100, 310);

commit;

select * from emp;
--table은 데이터타입이다.

create table sa_reps (
rep_id number(6),
rep_name varchar2(25),
salary number(8, 2),
commission_pct number(2, 2)
);
--DB에서는 복수로 지정해준다.(프로그래머들끼리의 약속이다.)

insert all
    into sa_reps values(1, '최한석', 20000, .1)
    into sa_reps values(2, '한아름', 30000, .12)
select * from dual;

commit;

select * from sa_reps;

declare
    base number(6) := 400;
begin 
    for i in 1..10 loop
        insert into sa_reps(rep_id, rep_name, salary, commission_pct)
        values (base + i, 'n' || (base + i), base * i, i * 0.01);
    end loop; 
end;
/   
-- / 가 있어야 compile을 한다.
--i변수의 scope은 loop~ end loop사이이다. declare로 변수 선언을 해야한다.

select * 
from sa_reps
where rep_id > 400;

commit;

insert into sa_reps(rep_id, rep_name, salary, commission_pct)
    select employee_id, last_name, salary, commission_pct
    from employees
    where job_id like '%REP%';

commit;

update emp
set job_id = 'IT_PROG',
    salary = 30000
where employee_id = 300;
--update 를 사용할때는 where절을 꼭 사용해야한다.
select job_id , salary
from emp
where employee_id = 300;

update emp
set salary = null
where employee_id = 300;

select job_id, salary
from emp
where employee_id = 300;

rollback;
--rollback을 하게되면 직전 커밋 직후의 단계로 되돌아간다.
select job_id, salary
from emp
where employee_id = 300;


update emp
set job_id = (select job_id
              from employees
              where employee_id = 205),
    salary = (select salary
              from employees
              where employee_id = 205)
where employee_id = 300;

select job_id, salary
from emp
where employee_id = 300;

rollback;

select job_id, salary
from emp
where employee_id = 300;

update emp
set (job_id, salary) = (
    select job_id, salary
    from employees
    where employee_id = 205)
where employee_id = 300;

select job_id, salary
from emp
where employee_id = 300;

commit;

delete dept
where department_id = 310;
--dept의 모든 데이터를 지우는것이다.
select * from dept;

rollback;

select * from dept;

delete emp
where department_id = (
    select department_id
    from departments
    where department_name = 'Purchasing');

select * from emp;

commit;
--마지막 commit후에 insert, update, delete가 시작되면 트랙잭션이 시작된다. 