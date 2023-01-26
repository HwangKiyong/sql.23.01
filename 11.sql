--view 
create view empvu80 as  --80번부서만 보겠다는 것이다.
    select employee_id, last_name, department_id
    from employees
    where department_id = 80;
    
desc empvu80

select * from empvu80; --view 에 데이터가 저장되어있지 않다.
--밑에 처럼 긴 코드를 간소화하기 위해 하는것이다. 중복을 최소화한다.
select * from (
    select employee_id, last_name, department_id
    from employees
    where department_id = 80); 

create or replace view empvu80 as
    select employee_id, job_id
    from employees
    where department_id = 80;
--새로 만들거나 수정하는것이다.
desc empvu80

--과제: 50번 부서원들의 사번, 이름, 부서번호로 구성된 DEPT50 view 를 만들어라.
--      view의 구조는 EMPNO,EMPLOYEE,DEPTNO 이다.
create or replace view dept50(empno, employee, deptno) as
    select employee_id, last_name, department_id
    from employees
    where department_id = 50;

desc dept50
select * from dept50;    

create or replace view dept50(empno, employee, deptno) as
    select employee_id, last_name, department_id
    from employees
    where department_id = 50
    with check option constraint dept50_ck;
--with check option 을 써준 후 제약조건을 걸어야한다.
create table teams as
    select department_id team_id, department_name team_name
    from hr.departments;
    
create view team50 as
    select *
    from teams
    where team_id = 50;

select * from team50;

select count(*) from teams;

insert into team50
values(300, 'Marketing');

select count(*) from teams;

create or replace view team50 as
    select *
    from teams
    where team_id = 50
    with check option;
--with check option 에서는 where절을 체크한다. where절 조건문이랑 다르면 오류가난다. 
insert into team50 values(50, 'IT Support');
select count(*) from teams;
insert into team50 values(301, 'IT Support');

create or replace view empvu10(employee_num, employee_name, job_title) as
    select employee_id, last_name, job_id
    from employees
    where department_id = 10
    with read only;
--read only기에 추가가 안된다.    
insert into empvu10 values(501, 'able', 'Sales');
select * from empvu10;

drop sequence team_teamid_seq;

create sequence team_team_id_seq; --테이블명_칼럼명_seq

select team_team_id_seq.nextval from dual;
select team_team_id_seq.nextval from dual;
select team_team_id_seq.currval from dual;

insert into teams
values(team_teamid_seq.nextval, 'Marketing');

select * from teams
where team_id < 5;

create sequence x_xid_seq
    start with 10 --시작숫자
    increment by 5 --공차
    maxvalue 20 --최대값
    nocache --데이터를 미리 준비한다.
    nocycle; --최대값에 도달하면 끝
    
select x_xid_seq.nextval from dual;

-- 과제: DEPT 테이블의 DEPARTMENT_ID 칼럼의 field value 로 쓸 sequence를 만들어라.
--       sequence는 400이상, 1000이하로 생성한다. 10씩 증가한다.
create sequence dept_deptid_seq
    start with 400
    increment by 10
    maxvalue 1000;

--과제: 위 sequence를 이용해서, DEPT 테이블에서 Education 부서를 insert 하라.
insert into dept(department_id, department_name)
values(dept_deptid_seq.nextval, 'Education');

commit;

drop index emp_lastname_idx;
--복습시간에 실행해볼것. index 삭제하는법
create index emp_lastname_idx 
on employees(last_name);
--index 만드는법
select last_name, rowid
from employees;
--rowid는 DB내에서 유일한 값이다.
select last_name
from employees
where rowid = 'AAAEAbAAEAAAADNABe';
--where 절에는 pk(primary key)칼럼을 쓰는게 유리하다.
select index_name, index_type, table_owner, table_name
from user_indexes;

-- 과제: DEPT 테이블의 DEPARTMENT_NAME에 대해 index를 만들어라.
create index dept_deptname_idx
on dept(department_name);

drop synonym team;

create synonym team
for departments;

select * from team;

-- 과제: EMPLOYEE 테이블에 EMPS synonym 을 만들어라.
create synonym emps
for employees;

select * from employees;
