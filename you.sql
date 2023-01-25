select tname
from tab;

create table depts(
department_id number(3) constraint depts_deptid_pk primary key,
department_name varchar2(30));
--table���� primary key�� �� �վ���Ѵ�. ���Ἲ�� ���̱� �����̴�.

desc user_constraints

select constraint_name, constraint_type, table_name
from user_constraints;

create table emps(
employee_id number(3) primary key,
emp_name varchar2(10) constraint emps_empname_nn not null,
email varchar2(20),
salary number(6) constraint emps_sal_ck check(salary > 1000),
department_id number(3), 
constraint emps_email_uk unique(email),
constraint emps_deptid_fk foreign key(department_id)
    references depts(department_id));
    
select constraint_name, constraint_type, table_name
from user_constraints;    
/*not null null���� ���� ���Ѵ�.�ʼ���
���̺��_�ʵ��_����� (check)
���̺��_�ʵ��_����� (unique(�ʵ��)) ,�ʵ�� = row�� ����
���̺��_�ʵ��_����� (foreign key(Į����)) ,Į���� = ���̺��� ����
�ʵ�� = Į���� ǥ���� �ٸ��� �ᱹ ����
foreign key �� ���� relationship�� ���������� ��Ÿ����. 
������ foreign key�� integrity�̶�� ǥ��� 
�ٸ� �������Ǻ��� �ξ� ������ ���� �����̴�.
primary key(pk) �� not null + unique �̴�.*/

insert into depts values(100, 'Development');
insert into emps values(500, 'musk', 'musk@gmail.com', 5000, 100);
insert into emps values(501, 'a', 'musk@gmail.net', 2000, 100);

drop table emps cascade constraints;

select constraint_name, constraint_type, table_name
from user_constraints;

select * from depts;