
/**
 drop table sys_user_role;
*/

create table sys_user_role (
    id int8 not null , 
    availdatestart timestamp, 
    availdateend timestamp,
    userid int8 not null, 
    roleid int8, 
    authorized int4 default 0, 
    authorizefrom int8, 
    processdescription varchar(255), 
    primary key (id)
);