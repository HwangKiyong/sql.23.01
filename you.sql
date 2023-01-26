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
--system유저로 전환해야 함
grant all on hr.departments to you;
--해석:hr.departments스키마를 you에게 권한을 주겠다 
--you 유저로 전환해야 함
drop table employees cascade constraints;
create table employees(
employee_id number(6) constraint emp_empid_pk primary key,
first_name varchar2(20),
last_name varchar2(25) constraint emp_lastname_nn not null,
email varchar2(25) constraint emp_email_nn not null
                  constraint emp_email_uk unique,
phone_number varchar2(20),
hire_date date constraint emp_hiredate_nn not null,
job_id varchar2(10) constraint emp_jobid_nn not null,
salary number(8) constraint emp_salary_ck check(salary > 0),
commission_pct number(2, 2),
manager_id number(6) constraint emp_managerid_fk references employees(employee_id),
department_id number(4) constraint emp_dept_fk references hr.departments(department_id));
--email에 not null과 unique제약을 주었지만 primary key와는 다른것이다.

create table gu (
gu_id number(3) primary key,
gu_name char(9) not null);
--부모테이블
create table dong (
dong_id number(4) primary key,
dong_name varchar2(12) not null,
gu_id number(3) references gu(gu_id) on delete cascade); --부모가 delete되면 자식도 delete된다.
--자식테이블
--gu table과 dong table을 references로 관계를 표시한것이다.
create table dong2(
dong_id number(4) primary key,
dong_name varchar2(12) not null,
gu_id number(3) references gu(gu_id) on delete set null);

insert into gu values(100, '강남구');
insert into gu values(200, '노원구');

insert into dong values(5000, '압구정동', null);
insert into dong values(5001, '삼성동', 100);
insert into dong values(5002, '역삼동', 100);
insert into dong values(6001, '상계동', 200);
insert into dong values(6002, '중계동', 200);

insert into dong2
select * from dong;

delete gu
where gu_id = 100;

select * from dong;
select * from dong2;

commit;

create table a (
aid number(1) constraint a_aid_pk primary key);

create table b (
bid number(2),
aid number(1),
constraint b_aid_fk foreign key(aid) references a(aid));

insert into a values(1);
insert into b values(31, 1);
insert into b values(32, 9); --9란게 부모테이블에 없으므로 오류이다.

alter table b disable constraint b_aid_fk; 

alter table b enable constraint b_aid_fk; --부모테이블에 없기때문에 오류이다.
alter table b enable novalidate constraint b_aid_fk;

insert into b values(33, 8);

create table sub_departments as
    select department_id dept_id, department_name dept_name
    from hr.departments;

select * from sub_departments;

create table users(
user_id number(3));
desc users

alter table users add(user_name varchar2(10));
desc users
--add 추가 , modify 수정
alter table users modify(user_name number(7));
desc users

alter table users drop column user_name; --삭제
desc users

insert into users values(1);

alter table users read only; --읽기 전용이다.
insert into users values(2); --읽기 전용이되어 추가가 불가능하다.

alter table users read write; --쓰기 전용이다.
insert into users values(2);

commit;