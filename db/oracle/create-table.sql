
 create table message ( 
    id numeric(19,0) not null ,
    type number(10,0) ,
    sysType number(10,0) ,
    recverList varchar2  (255) ,
    title varchar2  (255) ,
    content varchar2  (255) ,
    createDate timestamp ,
    readed number(10,0) ,
    category number(10,0) ,
    sender numeric(19,0) ,
    recver numeric(19,0) ,
    primary key (id) 
);


 create table myaudit ( 
    ID numeric(19,0) not null ,
    CREATEDATE timestamp ,
    DEPTID numeric(19,0) ,
    DEPTNAME varchar2  (250) ,
    FLAG number(10,0) ,
    HEADSHIP varchar2  (50) ,
    LEADERID numeric(19,0) ,
    LEADERNAME varchar2  (50) ,
    MEMO varchar2  (500) ,
    REFERID numeric(19,0) ,
    REFERTYPE number(10,0) ,
    primary key (ID) 
);


 create table mymenu ( 
    id numeric(19,0) not null ,
    userId numeric(19,0) ,
    title varchar2  (255) ,
    url varchar2  (255) ,
    sort number(10,0) ,
    primary key (id) 
);


 create table subjectcode ( 
    id numeric(19,0) not null ,
    parent numeric(19,0) ,
    subjectCode varchar2  (255) ,
    subjectName varchar2  (255) ,
    sort number(10,0) ,
    primary key (id) 
);


 create table sys_access ( 
    roleId numeric(19,0)  not null ,
    appId numeric(19,0) not null,
    primary key (roleId,appId) 
);


 

 create table sys_agent ( 
    ID_ varchar2  (50)  not null ,
    AGENTTYPE_ number(10,0) ,
    ASSIGNFROM_ varchar2  (255) ,
    ASSIGNTO_ varchar2  (255) ,
    CREATEDATE_ timestamp ,
    ENDDATE_ timestamp ,
    LOCKED_ number(10,0) ,
    OBJECTID_ varchar2  (255) ,
    OBJECTVALUE_ varchar2  (255) ,
    PROCESSNAME_ varchar2  (255) ,
    SERVICEKEY_ varchar2  (50) ,
    STARTDATE_ timestamp ,
    TASKNAME_ varchar2  (255) ,
    primary key (ID_) 
);


 create table sys_application ( 
    id numeric(19,0) not null ,
    name varchar2  (255) ,
    appDesc varchar2  (255) ,
    url varchar2  (255) ,
    sort number(10,0) ,
    showMenu number(10,0) ,
    nodeId numeric(19,0) ,
    CODE varchar2  (50) ,
    CREATEBY varchar2  (50) ,
    CREATEDATE timestamp ,
    locked number(10,0) ,
    UPDATEBY varchar2  (50) ,
    UPDATEDATE timestamp ,
    primary key (id) 
);


 create table sys_calendar ( 
    ID_ numeric(19,0) not null ,
    CREATEBY_ varchar2  (50) ,
    CREATEDATE_ timestamp ,
    DAY_ number(10,0) ,
    DUTYA_ varchar2  (50) ,
    DUTYB_ varchar2  (50) ,
    GROUPA_ varchar2  (50) ,
    GROUPB_ varchar2  (50) ,
    ISFREEDAY_ number(10,0) ,
    MONTH_ number(10,0) ,
    PRODUCTIONLINE_ varchar2  (50) ,
    WEEK_ number(10,0) ,
    WORKDATE_ timestamp ,
    YEAR_ number(10,0) ,
    primary key (ID_) 
);


 


 create table sys_dbid ( 
    NAME_ varchar2  (50)  not null ,
    TITLE_ varchar2  (200) ,
    VALUE_ varchar2  (500) ,
    VERSION_ number(10,0) ,
    primary key (NAME_) 
);


 create table sys_department ( 
    id numeric(19,0) not null ,
    name varchar2  (255) ,
    deptDesc varchar2  (255) ,
    createTime timestamp ,
    sort number(10,0) ,
    deptNo varchar2  (255) ,
    code varchar2  (255) ,
    code2 varchar2  (255) ,
    status number(10,0) ,
    fincode varchar2  (255) ,
    nodeId numeric(19,0) ,
    CREATEBY varchar2  (50) ,
    DEPTLEVEL number(10,0) ,
    UPDATEBY varchar2  (50) ,
    UPDATEDATE timestamp ,
    primary key (id) 
);


 create table sys_dept_role ( 
    id numeric(19,0) not null ,
    grade number(10,0) ,
    code varchar2  (255) ,
    sort number(10,0) ,
    deptId numeric(19,0) ,
    sysRoleId numeric(19,0) ,
    CREATEBY varchar2  (50) ,
    CREATEDATE timestamp ,
    primary key (id) 
);


 create table sys_dictory ( 
    id numeric(19,0)  not null ,
    typeId numeric(19,0) ,
    code varchar2  (255) ,
    name varchar2  (255) ,
    sort number(10,0) ,
    dictDesc varchar2  (255) ,
    blocked number(10,0) ,
    ext1 varchar2  (255) ,
    ext2 varchar2  (255) ,
    ext3 varchar2  (255) ,
    ext4 varchar2  (255) ,
    ext5 timestamp ,
    ext6 timestamp ,
    CREATEBY varchar2  (50) ,
    CREATEDATE timestamp ,
    ext10 timestamp ,
    ext11 numeric(19,0) ,
    ext12 numeric(19,0) ,
    ext13 numeric(19,0) ,
    ext14 numeric(19,0) ,
    ext15 numeric(19,0) ,
    ext16 double precision ,
    ext17 double precision ,
    ext18 double precision ,
    ext19 double precision ,
    ext20 double precision ,
    ext7 timestamp ,
    ext8 timestamp ,
    ext9 timestamp ,
    UPDATEBY varchar2  (255) ,
    UPDATEDATE timestamp ,
    VALUE_ varchar2  (255) ,
    primary key (id) 
);


 create table sys_function ( 
    id numeric(19,0) not null ,
    name varchar2  (255) ,
    funcDesc varchar2  (255) ,
    funcMethod varchar2  (255) ,
    sort number(10,0) ,
    appId numeric(19,0) ,
    CODE varchar2  (50) ,
    primary key (id) 
);


 create table sys_log ( 
    id numeric(19,0) not null ,
    account varchar2  (255) ,
    ip varchar2  (255) ,
    createTime timestamp ,
    operate varchar2  (255) ,
    flag number(10,0) ,
    primary key (id) 
);


 create table sys_scheduler ( 
    id varchar2  (50)   not null ,
    taskName varchar2  (200) ,
    taskType varchar2  (50) ,
    jobClass varchar2  (200) ,
    title varchar2  (200) ,
    content varchar2  (500) ,
    startDate timestamp ,
    endDate timestamp ,
    threadSize number(10,0) ,
    repeatCount number(10,0) ,
    repeatInterval number(10,0) ,
    startDelay number(10,0) ,
    priority_ number(10,0) ,
    locked_ number(10,0) ,
    startup_ number(10,0) ,
    autoStartup number(10,0) ,
    expression_ varchar2  (500) ,
    createBy varchar2  (50) ,
    createDate timestamp ,
    attribute_ varchar2  (500) ,
    intervalTime varchar2  (255) ,
    intervalType varchar2  (255) ,
    intervalValue varchar2  (255) ,
    primary key (id) 
);


 create table sys_scheduler_params ( 
    id varchar2  (50)  not null ,
    date_val timestamp ,
    double_val double precision ,
    int_val number(10,0) ,
    key_name varchar2  (50) ,
    long_val numeric(19,0) ,
    string_val varchar2  (2000) ,
    taskId varchar2  (50) ,
    text_val clob   ,
    title varchar2  (200) ,
    type_cd varchar2  (20) ,
    primary key (id) 
);


 create table sys_todo ( 
    id numeric(19,0)  not null ,
    actorId varchar2  (255) ,
    alarm varchar2  (255) ,
    code varchar2  (255) ,
    content varchar2  (255) ,
    deptId numeric(19,0) ,
    deptName varchar2  (255) ,
    enableFlag number(10,0) ,
    eventFrom varchar2  (255) ,
    eventTo varchar2  (255) ,
    limitDay number(10,0) ,
    xa number(10,0) ,
    xb number(10,0) ,
    link varchar2  (255) ,
    listLink varchar2  (255) ,
    linkType varchar2  (255) ,
    appId number(10,0) ,
    moduleId number(10,0) ,
    moduleName varchar2  (255) ,
    news varchar2  (255) ,
    objectId varchar2  (255) ,
    objectValue varchar2  (255) ,
    processName varchar2  (255) ,
    roleCode varchar2  (255) ,
    roleId numeric(19,0) ,
    tablename varchar2  (255) ,
    taskName varchar2  (255) ,
    title varchar2  (255) ,
    type varchar2  (255) ,
    sql varchar2  (255) ,
    versionNo numeric(19,0) ,
    allListLink varchar2  (255) ,
    configFlag number(10,0) ,
    provider varchar2  (50) ,
    roleName varchar2  (50) ,
    sortNo number(10,0) ,
    sql_ clob   ,
    primary key (id) 
);


 create table sys_todo_instance ( 
    id numeric(19,0) not null ,
    actorId varchar2  (255) ,
    actorName varchar2  (255) ,
    title varchar2  (255) ,
    content varchar2  (255) ,
    provider varchar2  (255) ,
    link varchar2  (255) ,
    linkType varchar2  (255) ,
    createDate timestamp ,
    startDate timestamp ,
    endDate timestamp ,
    alarmDate timestamp ,
    pastDueDate timestamp ,
    taskInstanceId varchar2  (255) ,
    processInstanceId varchar2  (255) ,
    deptId numeric(19,0) ,
    deptName varchar2  (255) ,
    roleId numeric(19,0) ,
    roleCode varchar2  (255) ,
    rowId varchar2  (255) ,
    todoId numeric(19,0) ,
    appId number(10,0) ,
    moduleId number(10,0) ,
    objectId varchar2  (255) ,
    objectValue varchar2  (255) ,
    versionNo numeric(19,0) ,
    link_ varchar2  (255) ,
    rowId_ varchar2  (255) ,
    primary key (id) 
);


 create table sys_tree ( 
    id numeric(19,0) not null ,
    parent numeric(19,0) ,
    name varchar2  (255) ,
    nodeDesc varchar2  (255) ,
    sort number(10,0) ,
    code varchar2  (255) ,
    CREATEBY varchar2  (50) ,
    CREATEDATE timestamp ,
    DISCRIMINATOR varchar2  (10) ,
    icon varchar2  (50) ,
    iconCls varchar2  (50) ,
    locked number(10,0) ,
    MOVEABLE varchar2  (10) ,
    TREEID varchar2  (500) ,
    UPDATEBY varchar2  (50) ,
    UPDATEDATE timestamp ,
    url varchar2  (500) ,
    primary key (id) 
);


 create table sys_user ( 
    id numeric(19,0) not null ,
    account varchar2  (255) ,
    password varchar2  (255) ,
    code varchar2  (255) ,
    name varchar2  (255) ,
    blocked number(10,0) ,
    createTime timestamp ,
    lastLoginTime timestamp ,
    lastLoginIP varchar2  (255) ,
    evection number(10,0) ,
    mobile varchar2  (255) ,
    email varchar2  (255) ,
    telephone varchar2  (255) ,
    gender number(10,0) ,
    headship varchar2  (255) ,
    userType number(10,0) ,
    fax varchar2  (255) ,
    accountType number(10,0) ,
    dumpFlag number(10,0) ,
    adminFlag varchar2  (255) ,
    deptId numeric(19,0) ,
    CREATEBY varchar2  (50) ,
    SUPERIORIDS varchar2  (250) ,
    UPDATEBY varchar2  (50) ,
    UPDATEDATE timestamp ,
    primary key (id) 
);


create table sys_user_role (
    id numeric(19,0) not null , 
    availdatestart timestamp, 
    availdateend timestamp,
    userid numeric(19,0) not null, 
    roleid numeric(19,0), 
    authorized number(10,0) default 0, 
    authorizefrom numeric(19,0), 
    processdescription varchar2(255), 
    primary key (id)
);


 create table sys_workcalendar ( 
    id numeric(19,0) not null ,
    freeDay number(10,0) ,
    freeMonth number(10,0) ,
    freeYear number(10,0) ,
    primary key (id) 
);

create table sys_role(
        id bigint not null,
        name varchar2(255),
        roledesc varchar2(255),
        code varchar2(255),
        sort number(10,0),
        createby varchar2(50),
        createdate timestamp,
        updateby varchar2(50),
        updatedate timestamp,
        primary key (id)
    );