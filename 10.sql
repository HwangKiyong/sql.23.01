
drop table hire_dates;

create table hire_dates (
emp_id number(8),
hire_date date default sysdate);
--기본값이 null이 아닌 다른값으로 사용하려면 default값을 사용하면 된다.
--DB의 구조는 table을 파악하는것으로 보면된다.
-- data dictionary 읽기 전용으로 제공되는 테이블 및 뷰들의 집합으로 데이터베이스 전반에 대한 정보를 제공한다.
select tname
from tab;
--1,2,3,4번 row는 쓰레기이다.
-- 과제: tab에서 쓰레기를 제외한 나머지 테이블만을 조회하라.
select tname
from tab
where tname not like 'BIN%';

insert into hire_dates values(1, to_date('2025/12/21'));
insert into hire_dates values(2, null);
insert into hire_dates(emp_id) values(3); --위에서 설정을 default 햇기에 오늘날짜가 들어간것이다.

select * from hire_dates;

commit;

--ddl 자동커밋
--dml 수동커밋
--DCL (Data Control Language)

