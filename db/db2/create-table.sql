
/**
 drop table sys_user_role;
*/

create table sys_user_role (
    id bigint generated by default as identity , 
    availdatestart timestamp, 
    availdateend timestamp,
    userid bigint not null, 
    roleid bigint, 
    authorized integer default 0, 
    authorizefrom bigint, 
    processdescription varchar(255), 
    primary key (id)
);