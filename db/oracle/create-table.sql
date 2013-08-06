
/**
 drop table sys_user_role;
*/

create table sys_user_role (
    id number(19,0) not null, 
    availdatestart timestamp, 
    availdateend timestamp,
    userid number(19,0) not null, 
    roleid number(19,0), 
    authorized number(10,0) default 0, 
    authorizefrom number(19,0), 
    processdescription varchar2(255), 
    primary key (id)
);