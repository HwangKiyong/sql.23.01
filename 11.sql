--view 
create view empvu80 as  --80���μ��� ���ڴٴ� ���̴�.
    select employee_id, last_name, department_id
    from employees
    where department_id = 80;
    
desc empvu80

select * from empvu80; --view �� �����Ͱ� ����Ǿ����� �ʴ�.
--�ؿ� ó�� �� �ڵ带 ����ȭ�ϱ� ���� �ϴ°��̴�. �ߺ��� �ּ�ȭ�Ѵ�.
select * from (
    select employee_id, last_name, department_id
    from employees
    where department_id = 80); 

create or replace view empvu80 as
    select employee_id, job_id
    from employees
    where department_id = 80;
--���� ����ų� �����ϴ°��̴�.
desc empvu80

--����: 50�� �μ������� ���, �̸�, �μ���ȣ�� ������ DEPT50 view �� ������.
--      view�� ������ EMPNO,EMPLOYEE,DEPTNO �̴�.
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
--with check option �� ���� �� ���������� �ɾ���Ѵ�.
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
--with check option ������ where���� üũ�Ѵ�. where�� ���ǹ��̶� �ٸ��� ����������. 
insert into team50 values(50, 'IT Support');
select count(*) from teams;
insert into team50 values(301, 'IT Support');

create or replace view empvu10(employee_num, employee_name, job_title) as
    select employee_id, last_name, job_id
    from employees
    where department_id = 10
    with read only;
--read only�⿡ �߰��� �ȵȴ�.    
insert into empvu10 values(501, 'able', 'Sales');
select * from empvu10;

drop sequence team_teamid_seq;

create sequence team_team_id_seq; --���̺���_Į����_seq

select team_team_id_seq.nextval from dual;
select team_team_id_seq.nextval from dual;
select team_team_id_seq.currval from dual;

insert into teams
values(team_teamid_seq.nextval, 'Marketing');

select * from teams
where team_id < 5;

create sequence x_xid_seq
    start with 10 --���ۼ���
    increment by 5 --����
    maxvalue 20 --�ִ밪
    nocache --�����͸� �̸� �غ��Ѵ�.
    nocycle; --�ִ밪�� �����ϸ� ��
    
select x_xid_seq.nextval from dual;

-- ����: DEPT ���̺��� DEPARTMENT_ID Į���� field value �� �� sequence�� ������.
--       sequence�� 400�̻�, 1000���Ϸ� �����Ѵ�. 10�� �����Ѵ�.
create sequence dept_deptid_seq
    start with 400
    increment by 10
    maxvalue 1000;

--����: �� sequence�� �̿��ؼ�, DEPT ���̺����� Education �μ��� insert �϶�.
insert into dept(department_id, department_name)
values(dept_deptid_seq.nextval, 'Education');

commit;

drop index emp_lastname_idx;
--�����ð��� �����غ���. index �����ϴ¹�
create index emp_lastname_idx 
on employees(last_name);
--index ����¹�
select last_name, rowid
from employees;
--rowid�� DB������ ������ ���̴�.
select last_name
from employees
where rowid = 'AAAEAbAAEAAAADNABe';
--where ������ pk(primary key)Į���� ���°� �����ϴ�.
select index_name, index_type, table_owner, table_name
from user_indexes;

-- ����: DEPT ���̺��� DEPARTMENT_NAME�� ���� index�� ������.
create index dept_deptname_idx
on dept(department_name);

drop synonym team;

create synonym team
for departments;

select * from team;

-- ����: EMPLOYEE ���̺��� EMPS synonym �� ������.
create synonym emps
for employees;

select * from employees;