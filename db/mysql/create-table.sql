
/**
 drop table sys_user_role;
*/

create table sys_user_role (
    id bigint not null auto_increment, 
    availdatestart datetime, 
    availdateend datetime,
    userid bigint not null, 
    roleid bigint, 
    authorized integer default 0, 
    authorizefrom bigint, 
    processdescription varchar(255), 
    primary key (id)
);