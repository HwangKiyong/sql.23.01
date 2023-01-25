select tname
from tab;

create table depts(
department_id number(3) constraint depts_deptid_pk primary key,
department_name varchar2(30));
--table에는 primary key가 꼭 잇어야한다. 무결성을 줄이기 위함이다.

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
/*not null null값이 들어가지 못한다.필수값
테이블명_필드명_제약명 (check)
테이블명_필드명_제약명 (unique(필드명)) ,필드명 = row의 관점
테이블명_필드명_제약명 (foreign key(칼럼명)) ,칼럼명 = 테이블의 관점
필드명 = 칼럼명 표현이 다를뿐 결국 같다
foreign key 를 통해 relationship을 간접적으로 나타낸다. 
오류시 foreign key만 integrity이라고 표기됨 
다른 제약조건보다 훨씬 수준이 높은 조건이다.
primary key(pk) 는 not null + unique 이다.*/

insert into depts values(100, 'Development');
insert into emps values(500, 'musk', 'musk@gmail.com', 5000, 100);
insert into emps values(501, 'a', 'musk@gmail.net', 2000, 100);

drop table emps cascade constraints;

select constraint_name, constraint_type, table_name
from user_constraints;

select * from depts;