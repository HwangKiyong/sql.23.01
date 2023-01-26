drop user mybatis cascade;

--mybatis 테이블을 전부 삭제하는거다, mybatis접속이 되어있으면 삭제가 불가능하다.
/* create table mybatis.users (
    user_id number(2) constraint user_userid_pk primary key,
    user_name varchar2(12),
    reg_date date);

create table mybatis.address (
    user_id number(2) constraint addr_userid_pk primary key
                      constraint addr_userid_fk references mybatis.users(user_id),
    address varchar2(30));

create table mybatis.posts (
    post_id number(3) constraint post_postid_pk primary key,
    post_title varchar2(60),
    post_content varchar2(120),
    user_id number(2) constraint post_userid_fk references mybatis.users(user_id));
*/   

create table mybatis.users(
    user_id number(2),
    user_name varchar2(12),
    reg_date date);
    
create table mybatis.address(
    user_id number(2),
    address varchar2(30));
    
create table mybatis.posts (
    post_id number(3),
    post_title varchar2(60),
    post_content varchar2(120),
    user_id number(2));
    
alter table mybatis.users
    add constraint user_userid_pk primary key(user_id);
alter table mybatis.addresses
    add constraint addr_userid_pk primary key(user_id);
alter table mybatis.posts
    add constraint post_postid_pk primary key(post_id);