select tname
from tab;

create table depts(
department_id number(3) constraint depts_deptid_pk primary key,

--table에는 primary key가 꼭 잇어야한다. 무결성을 줄이기 위함이다.
 