
 create table message ( 
    id int8 not null ,
    type int4 ,
    sysType int4 ,
    recverList varchar (255) ,
    title varchar (255) ,
    content varchar (255) ,
    createDate timestamp ,
    readed int4 ,
    category int4 ,
    sender int8 ,
    recver int8 ,
    primary key (id) 
);


 create table myaudit ( 
    ID int8 not null ,
    CREATEDATE timestamp ,
    DEPTID int8 ,
    DEPTNAME varchar (250) ,
    FLAG int4 ,
    HEADSHIP varchar (50) ,
    LEADERID int8 ,
    LEADERNAME varchar (50) ,
    MEMO varchar (500) ,
    REFERID int8 ,
    REFERTYPE int4 ,
    primary key (ID) 
);


 create table mymenu ( 
    id int8 not null ,
    userId int8 ,
    title varchar (255) ,
    url varchar (255) ,
    sort int4 ,
    primary key (id) 
);


 create table subjectcode ( 
    id int8 not null ,
    parent int8 ,
    subjectCode varchar (255) ,
    subjectName varchar (255) ,
    sort int4 ,
    primary key (id) 
);


 create table sys_access ( 
    roleId int8  not null ,
    appId int8 not null,
    primary key (roleId,appId) 
);


 create table sys_agent ( 
    ID_ varchar (50)  not null ,
    AGENTTYPE_ int4 ,
    ASSIGNFROM_ varchar (255) ,
    ASSIGNTO_ varchar (255) ,
    CREATEDATE_ timestamp ,
    ENDDATE_ timestamp ,
    LOCKED_ int4 ,
    OBJECTID_ varchar (255) ,
    OBJECTVALUE_ varchar (255) ,
    PROCESSNAME_ varchar (255) ,
    SERVICEKEY_ varchar (50) ,
    STARTDATE_ timestamp ,
    TASKNAME_ varchar (255) ,
    primary key (ID_) 
);


 create table sys_application ( 
    id int8 not null ,
    name varchar (255) ,
    appDesc varchar (255) ,
    url varchar (255) ,
    sort int4 ,
    showMenu int4 ,
    nodeId int8 ,
    CODE varchar (50) ,
    CREATEBY varchar (50) ,
    CREATEDATE timestamp ,
    locked int4 ,
    UPDATEBY varchar (50) ,
    UPDATEDATE timestamp ,
    primary key (id) 
);


 create table sys_calendar ( 
    ID_ int8 not null ,
    CREATEBY_ varchar (50) ,
    CREATEDATE_ timestamp ,
    DAY_ int4 ,
    DUTYA_ varchar (50) ,
    DUTYB_ varchar (50) ,
    GROUPA_ varchar (50) ,
    GROUPB_ varchar (50) ,
    ISFREEDAY_ int4 ,
    MONTH_ int4 ,
    PRODUCTIONLINE_ varchar (50) ,
    WEEK_ int4 ,
    WORKDATE_ timestamp ,
    YEAR_ int4 ,
    primary key (ID_) 
);


 create table sys_dbid ( 
    NAME_ varchar (50)  not null ,
    TITLE_ varchar (200) ,
    VALUE_ varchar (500) ,
    VERSION_ int4 ,
    primary key (NAME_) 
);


 create table sys_department ( 
    id int8 not null ,
    name varchar (255) ,
    deptDesc varchar (255) ,
    createTime timestamp ,
    sort int4 ,
    deptNo varchar (255) ,
    code varchar (255) ,
    code2 varchar (255) ,
    status int4 ,
    fincode varchar (255) ,
    nodeId int8 ,
    CREATEBY varchar (50) ,
    DEPTLEVEL int4 ,
    UPDATEBY varchar (50) ,
    UPDATEDATE timestamp ,
    primary key (id) 
);


 create table sys_dept_role ( 
    id int8 not null ,
    grade int4 ,
    code varchar (255) ,
    sort int4 ,
    deptId int8 ,
    sysRoleId int8 ,
    CREATEBY varchar (50) ,
    CREATEDATE timestamp ,
    primary key (id) 
);


 create table sys_dictory ( 
    id int8  not null ,
    typeId int8 ,
    code varchar (255) ,
    name varchar (255) ,
    sort int4 ,
    dictDesc varchar (255) ,
    blocked int4 ,
    ext1 varchar (255) ,
    ext2 varchar (255) ,
    ext3 varchar (255) ,
    ext4 varchar (255) ,
    ext5 timestamp ,
    ext6 timestamp ,
    createby varchar (50) ,
    createdate timestamp ,
    ext10 timestamp ,
    ext11 int8 ,
    ext12 int8 ,
    ext13 int8 ,
    ext14 int8 ,
    ext15 int8 ,
    ext16 double precision ,
    ext17 double precision ,
    ext18 double precision ,
    ext19 double precision ,
    ext20 double precision ,
    ext7 timestamp ,
    ext8 timestamp ,
    ext9 timestamp ,
    updateby varchar (255) ,
    updatedate timestamp ,
    value_ varchar (255) ,
    primary key (id) 
);


 create table sys_function ( 
    id int8 not null ,
    name varchar (255) ,
    funcDesc varchar (255) ,
    funcMethod varchar (255) ,
    sort int4 ,
    appId int8 ,
    CODE varchar (50) ,
    primary key (id) 
);


 create table sys_log ( 
    id int8 not null ,
    account varchar (255) ,
    ip varchar (255) ,
    createTime timestamp ,
    operate varchar (255) ,
    flag int4 ,
    primary key (id) 
);


 create table sys_scheduler ( 
    id varchar (50)   not null ,
    taskName varchar (200) ,
    taskType varchar (50) ,
    jobClass varchar (200) ,
    title varchar (200) ,
    content varchar (500) ,
    startDate timestamp ,
    endDate timestamp ,
    threadSize int4 ,
    repeatCount int4 ,
    repeatInterval int4 ,
    startDelay int4 ,
    priority_ int4 ,
    locked_ int4 ,
    startup_ int4 ,
    autoStartup int4 ,
    expression_ varchar (500) ,
    createBy varchar (50) ,
    createDate timestamp ,
    attribute_ varchar (500) ,
    intervalTime varchar (255) ,
    intervalType varchar (255) ,
    intervalValue varchar (255) ,
    primary key (id) 
);


 create table sys_scheduler_params ( 
    id varchar (50)  not null ,
    date_val timestamp ,
    double_val double precision ,
    int_val int4 ,
    key_name varchar (50) ,
    long_val int8 ,
    string_val varchar (2000) ,
    taskId varchar (50) ,
    text_val text   ,
    title varchar (200) ,
    type_cd varchar (20) ,
    primary key (id) 
);


 create table sys_todo ( 
    id int8  not null ,
    actorId varchar (255) ,
    alarm varchar (255) ,
    code varchar (255) ,
    content varchar (255) ,
    deptId int8 ,
    deptName varchar (255) ,
    enableFlag int4 ,
    eventFrom varchar (255) ,
    eventTo varchar (255) ,
    limitDay int4 ,
    xa int4 ,
    xb int4 ,
    link varchar (255) ,
    listLink varchar (255) ,
    linkType varchar (255) ,
    appId int4 ,
    moduleId int4 ,
    moduleName varchar (255) ,
    news varchar (255) ,
    objectId varchar (255) ,
    objectValue varchar (255) ,
    processName varchar (255) ,
    roleCode varchar (255) ,
    roleId int8 ,
    tablename varchar (255) ,
    taskName varchar (255) ,
    title varchar (255) ,
    type varchar (255) ,
    sql varchar (255) ,
    versionNo int8 ,
    allListLink varchar (255) ,
    configFlag int4 ,
    provider varchar (50) ,
    roleName varchar (50) ,
    sortNo int4 ,
    sql_ text   ,
    primary key (id) 
);


 create table sys_todo_instance ( 
    id int8 not null ,
    actorId varchar (255) ,
    actorName varchar (255) ,
    title varchar (255) ,
    content varchar (255) ,
    provider varchar (255) ,
    link varchar (255) ,
    linkType varchar (255) ,
    createDate timestamp ,
    startDate timestamp ,
    endDate timestamp ,
    alarmDate timestamp ,
    pastDueDate timestamp ,
    taskInstanceId varchar (255) ,
    processInstanceId varchar (255) ,
    deptId int8 ,
    deptName varchar (255) ,
    roleId int8 ,
    roleCode varchar (255) ,
    rowId varchar (255) ,
    todoId int8 ,
    appId int4 ,
    moduleId int4 ,
    objectId varchar (255) ,
    objectValue varchar (255) ,
    versionNo int8 ,
    link_ varchar (255) ,
    rowId_ varchar (255) ,
    primary key (id) 
);


 create table sys_tree ( 
    id int8 not null ,
    parent int8 ,
    name varchar (255) ,
    nodeDesc varchar (255) ,
    sort int4 ,
    code varchar (255) ,
    CREATEBY varchar (50) ,
    CREATEDATE timestamp ,
    DISCRIMINATOR varchar (10) ,
    icon varchar (50) ,
    iconCls varchar (50) ,
    locked int4 ,
    MOVEABLE varchar (10) ,
    TREEID varchar (500) ,
    UPDATEBY varchar (50) ,
    UPDATEDATE timestamp ,
    url varchar (500) ,
    primary key (id) 
);


 create table sys_user ( 
    id int8 not null ,
    account varchar (255) ,
    password varchar (255) ,
    code varchar (255) ,
    name varchar (255) ,
    blocked int4 ,
    createTime timestamp ,
    lastLoginTime timestamp ,
    lastLoginIP varchar (255) ,
    evection int4 ,
    mobile varchar (255) ,
    email varchar (255) ,
    telephone varchar (255) ,
    gender int4 ,
    headship varchar (255) ,
    userType int4 ,
    fax varchar (255) ,
    accountType int4 ,
    dumpFlag int4 ,
    adminFlag varchar (255) ,
    deptId int8 ,
    CREATEBY varchar (50) ,
    SUPERIORIDS varchar (250) ,
    UPDATEBY varchar (50) ,
    UPDATEDATE timestamp ,
    primary key (id) 
);


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


 create table sys_workcalendar ( 
    id int8 not null ,
    freeDay int4 ,
    freeMonth int4 ,
    freeYear int4 ,
    primary key (id) 
);

create table sys_role(
        id int8 not null,
        name varchar(255),
        roledesc varchar(255),
        code varchar(255),
        sort int4,
        createby varchar(50),
        createdate timestamp,
        updateby varchar(50),
        updatedate timestamp,
        primary key (id)
    );

create table sys_permission(
        roleid int8 not null,
        funcid int8 not null,
        primary key (roleid, funcid)
 );