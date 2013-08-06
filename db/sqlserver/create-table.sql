
/**
 drop table sys_user_role;
*/

create table sys_user_role (
    id numeric(19,0) identity not null , 
    availdatestart datetime, 
    availdateend datetime,
    userid numeric(19,0) not null, 
    roleid numeric(19,0), 
    authorized int default 0, 
    authorizefrom numeric(19,0), 
    processdescription varchar(255), 
    primary key (id)
);