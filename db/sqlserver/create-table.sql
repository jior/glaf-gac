
 create table message ( 
    id numeric(19,0) identity not null ,
    type integer ,
    sysType integer ,
    recverList varchar  (255) ,
    title varchar  (255) ,
    content varchar  (255) ,
    createDate datetime ,
    readed integer ,
    category integer ,
    sender numeric(19,0) ,
    recver numeric(19,0) ,
    primary key (id) 
);


 create table myaudit ( 
    ID numeric(19,0) identity not null ,
    CREATEDATE datetime ,
    DEPTID numeric(19,0) ,
    DEPTNAME varchar  (250) ,
    FLAG integer ,
    HEADSHIP varchar  (50) ,
    LEADERID numeric(19,0) ,
    LEADERNAME varchar  (50) ,
    MEMO varchar  (500) ,
    REFERID numeric(19,0) ,
    REFERTYPE integer ,
    primary key (ID) 
);


 create table mymenu ( 
    id numeric(19,0) identity not null ,
    userId numeric(19,0) ,
    title varchar  (255) ,
    url varchar  (255) ,
    sort integer ,
    primary key (id) 
);


 create table subjectcode ( 
    id numeric(19,0) identity not null ,
    parent numeric(19,0) ,
    subjectCode varchar  (255) ,
    subjectName varchar  (255) ,
    sort integer ,
    primary key (id) 
);


 create table sys_access ( 
    roleId numeric(19,0)  not null ,
    appId numeric(19,0) not null,
    primary key (roleId,appId) 
);


 

 create table sys_agent ( 
    ID_ varchar  (50)  not null ,
    AGENTTYPE_ integer ,
    ASSIGNFROM_ varchar  (255) ,
    ASSIGNTO_ varchar  (255) ,
    CREATEDATE_ datetime ,
    ENDDATE_ datetime ,
    LOCKED_ integer ,
    OBJECTID_ varchar  (255) ,
    OBJECTVALUE_ varchar  (255) ,
    PROCESSNAME_ varchar  (255) ,
    SERVICEKEY_ varchar  (50) ,
    STARTDATE_ datetime ,
    TASKNAME_ varchar  (255) ,
    primary key (ID_) 
);


 create table sys_application ( 
    id numeric(19,0) identity not null ,
    name varchar  (255) ,
    appDesc varchar  (255) ,
    url varchar  (255) ,
    sort integer ,
    showMenu integer ,
    nodeId numeric(19,0) ,
    CODE varchar  (50) ,
    CREATEBY varchar  (50) ,
    CREATEDATE datetime ,
    locked integer ,
    UPDATEBY varchar  (50) ,
    UPDATEDATE datetime ,
    primary key (id) 
);


 create table sys_calendar ( 
    ID_ numeric(19,0) identity not null ,
    CREATEBY_ varchar  (50) ,
    CREATEDATE_ datetime ,
    DAY_ integer ,
    DUTYA_ varchar  (50) ,
    DUTYB_ varchar  (50) ,
    GROUPA_ varchar  (50) ,
    GROUPB_ varchar  (50) ,
    ISFREEDAY_ integer ,
    MONTH_ integer ,
    PRODUCTIONLINE_ varchar  (50) ,
    WEEK_ integer ,
    WORKDATE_ datetime ,
    YEAR_ integer ,
    primary key (ID_) 
);


 


 create table sys_dbid ( 
    NAME_ varchar  (50)  not null ,
    TITLE_ varchar  (200) ,
    VALUE_ varchar  (500) ,
    VERSION_ integer ,
    primary key (NAME_) 
);


 create table sys_department ( 
    id numeric(19,0) identity not null ,
    name varchar  (255) ,
    deptDesc varchar  (255) ,
    createTime datetime ,
    sort integer ,
    deptNo varchar  (255) ,
    code varchar  (255) ,
    code2 varchar  (255) ,
    status integer ,
    fincode varchar  (255) ,
    nodeId numeric(19,0) ,
    CREATEBY varchar  (50) ,
    DEPTLEVEL integer ,
    UPDATEBY varchar  (50) ,
    UPDATEDATE datetime ,
    primary key (id) 
);


 create table sys_dept_role ( 
    id numeric(19,0) identity not null ,
    grade integer ,
    code varchar  (255) ,
    sort integer ,
    deptId numeric(19,0) ,
    sysRoleId numeric(19,0) ,
    CREATEBY varchar  (50) ,
    CREATEDATE datetime ,
    primary key (id) 
);


 create table sys_dictory ( 
    id numeric(19,0) identity  not null ,
    typeId numeric(19,0) ,
    code varchar  (255) ,
    name varchar  (255) ,
    sort integer ,
    dictDesc varchar  (255) ,
    blocked integer ,
    ext1 varchar  (255) ,
    ext2 varchar  (255) ,
    ext3 varchar  (255) ,
    ext4 varchar  (255) ,
    ext5 datetime ,
    ext6 datetime ,
    CREATEBY varchar  (50) ,
    CREATEDATE datetime ,
    ext10 datetime ,
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
    ext7 datetime ,
    ext8 datetime ,
    ext9 datetime ,
    UPDATEBY varchar  (255) ,
    UPDATEDATE datetime ,
    VALUE_ varchar  (255) ,
    primary key (id) 
);


 create table sys_function ( 
    id numeric(19,0) identity not null ,
    name varchar  (255) ,
    funcDesc varchar  (255) ,
    funcMethod varchar  (255) ,
    sort integer ,
    appId numeric(19,0) ,
    CODE varchar  (50) ,
    primary key (id) 
);


 create table sys_log ( 
    id numeric(19,0) identity not null ,
    account varchar  (255) ,
    ip varchar  (255) ,
    createTime datetime ,
    operate varchar  (255) ,
    flag integer ,
    primary key (id) 
);


 create table sys_scheduler ( 
    id varchar  (50)   not null ,
    taskName varchar  (200) ,
    taskType varchar  (50) ,
    jobClass varchar  (200) ,
    title varchar  (200) ,
    content varchar  (500) ,
    startDate datetime ,
    endDate datetime ,
    threadSize integer ,
    repeatCount integer ,
    repeatInterval integer ,
    startDelay integer ,
    priority_ integer ,
    locked_ integer ,
    startup_ integer ,
    autoStartup integer ,
    expression_ varchar  (500) ,
    createBy varchar  (50) ,
    createDate datetime ,
    attribute_ varchar  (500) ,
    intervalTime varchar  (255) ,
    intervalType varchar  (255) ,
    intervalValue varchar  (255) ,
    primary key (id) 
);


 create table sys_scheduler_params ( 
    id varchar  (50)  not null ,
    date_val datetime ,
    double_val double precision ,
    int_val integer ,
    key_name varchar  (50) ,
    long_val numeric(19,0) ,
    string_val varchar  (2000) ,
    taskId varchar  (50) ,
    text_val text   ,
    title varchar  (200) ,
    type_cd varchar  (20) ,
    primary key (id) 
);


 create table sys_todo ( 
    id numeric(19,0)  not null ,
    actorId varchar  (255) ,
    alarm varchar  (255) ,
    code varchar  (255) ,
    content varchar  (255) ,
    deptId numeric(19,0) ,
    deptName varchar  (255) ,
    enableFlag integer ,
    eventFrom varchar  (255) ,
    eventTo varchar  (255) ,
    limitDay integer ,
    xa integer ,
    xb integer ,
    link varchar  (255) ,
    listLink varchar  (255) ,
    linkType varchar  (255) ,
    appId integer ,
    moduleId integer ,
    moduleName varchar  (255) ,
    news varchar  (255) ,
    objectId varchar  (255) ,
    objectValue varchar  (255) ,
    processName varchar  (255) ,
    roleCode varchar  (255) ,
    roleId numeric(19,0) ,
    tablename varchar  (255) ,
    taskName varchar  (255) ,
    title varchar  (255) ,
    type varchar  (255) ,
    sql varchar  (255) ,
    versionNo numeric(19,0) ,
    allListLink varchar  (255) ,
    configFlag integer ,
    provider varchar  (50) ,
    roleName varchar  (50) ,
    sortNo integer ,
    sql_ text   ,
    primary key (id) 
);


 create table sys_todo_instance ( 
    id numeric(19,0) identity not null ,
    actorId varchar  (255) ,
    actorName varchar  (255) ,
    title varchar  (255) ,
    content varchar  (255) ,
    provider varchar  (255) ,
    link varchar  (255) ,
    linkType varchar  (255) ,
    createDate datetime ,
    startDate datetime ,
    endDate datetime ,
    alarmDate datetime ,
    pastDueDate datetime ,
    taskInstanceId varchar  (255) ,
    processInstanceId varchar  (255) ,
    deptId numeric(19,0) ,
    deptName varchar  (255) ,
    roleId numeric(19,0) ,
    roleCode varchar  (255) ,
    rowId varchar  (255) ,
    todoId numeric(19,0) ,
    appId integer ,
    moduleId integer ,
    objectId varchar  (255) ,
    objectValue varchar  (255) ,
    versionNo numeric(19,0) ,
    link_ varchar  (255) ,
    rowId_ varchar  (255) ,
    primary key (id) 
);


 create table sys_tree ( 
    id numeric(19,0) identity not null ,
    parent numeric(19,0) ,
    name varchar  (255) ,
    nodeDesc varchar  (255) ,
    sort integer ,
    code varchar  (255) ,
    CREATEBY varchar  (50) ,
    CREATEDATE datetime ,
    DISCRIMINATOR varchar  (10) ,
    icon varchar  (50) ,
    iconCls varchar  (50) ,
    locked integer ,
    MOVEABLE varchar  (10) ,
    TREEID varchar  (500) ,
    UPDATEBY varchar  (50) ,
    UPDATEDATE datetime ,
    url varchar  (500) ,
    primary key (id) 
);


 create table sys_user ( 
    id numeric(19,0) identity not null ,
    account varchar  (255) ,
    password varchar  (255) ,
    code varchar  (255) ,
    name varchar  (255) ,
    blocked integer ,
    createTime datetime ,
    lastLoginTime datetime ,
    lastLoginIP varchar  (255) ,
    evection integer ,
    mobile varchar  (255) ,
    email varchar  (255) ,
    telephone varchar  (255) ,
    gender integer ,
    headship varchar  (255) ,
    userType integer ,
    fax varchar  (255) ,
    accountType integer ,
    dumpFlag integer ,
    adminFlag varchar  (255) ,
    deptId numeric(19,0) ,
    CREATEBY varchar  (50) ,
    SUPERIORIDS varchar  (250) ,
    UPDATEBY varchar  (50) ,
    UPDATEDATE datetime ,
    primary key (id) 
);


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


 create table sys_workcalendar ( 
    id numeric(19,0) identity not null ,
    freeDay integer ,
    freeMonth integer ,
    freeYear integer ,
    primary key (id) 
);

create table sys_role(
        id bigint not null identity,
        name varchar(255),
        roledesc varchar(255),
        code varchar(255),
        sort integer,
        createby varchar(50),
        createdate datetime,
        updateby varchar(50),
        updatedate datetime,
        primary key (id)
    );