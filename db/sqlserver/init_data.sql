/** 清空数据

delete from sys_access;
delete from sys_function;
delete from sys_user_role;
delete from sys_dept_role;
delete from sys_user;
delete from sys_department;
delete from sys_application;
delete from sys_tree;
delete from sys_role;
delete from sys_dictory;
delete from sys_workcalendar;


**/



/*初始化角色信息*/
SET IDENTITY_INSERT sys_role ON;

insert into sys_role (id, name, roleDesc, sort, code) values (1, '部长', '', 15, 'R001');
insert into sys_role (id, name, roleDesc, sort, code) values (2, '科长', '', 14, 'R002');
insert into sys_role (id, name, roleDesc, sort, code) values (3, 'CO', '', 12, 'R003');
insert into sys_role (id, name, roleDesc, sort, code) values (4, '系长', '', 13, 'R004');
insert into sys_role (id, name, roleDesc, sort, code) values (5, '预算员', '', 11, 'R005');
insert into sys_role (id, name, roleDesc, sort, code) values (6, '部门管理员', '', 10, 'R006');
insert into sys_role (id, name, roleDesc, sort, code) values (7, '采购联络员', '', 9, 'R007');
insert into sys_role (id, name, roleDesc, sort, code) values (10, '采购担当', '', 6, 'R010');
insert into sys_role (id, name, roleDesc, sort, code) values (11, '申请担当', '使用部门申请起票经办人', 5, 'R011');
insert into sys_role (id, name, roleDesc, sort, code) values (12, '收单担当', '', 4, 'R012');
insert into sys_role (id, name, roleDesc, sort, code) values (15, '系统管理员', '', 1, 'SystemAdministrator');
insert into sys_role (id, name, roleDesc, sort, code) values (16, '分级管理员', '', 2, 'BranchAdmin');
insert into sys_role (id, name, roleDesc, sort, code) values (18, '主任', '', 18, 'R017');

SET IDENTITY_INSERT sys_role OFF;

/*初始系统树信息*/

SET IDENTITY_INSERT sys_tree ON;
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (1, 0, '/', '根目录', 1, '0');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (2, 1, '数据结构', '', 20, '01');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (3, 1, '应用模块', '', 10, '02');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (4, 2, '基础数据', '', 50, '011');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (5, 2, '部门结构', '部门结构', 40, '012');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (6, 5, '技术部', '技术部', 284, 'JS000');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (8, 3, '系统管理', '系统管理', 5, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (10, 3, '安全设置', '安全设置', 30, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (11, 8, '系统目录', '系统目录', 20, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (12, 10, '部门管理', '部门管理', 20, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (14, 10, '角色管理', '角色管理', 15, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (15, 10, '模块管理', '模块管理', 12, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (16, 8, '字典管理', '字典管理', 20, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (20, 3, '个人设置', '个人设置', 30, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (21, 20, '修改密码', '修改密码', 30, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (22, 20, '修改个人信息', '修改个人信息', 30, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (26, 8, '数据重载', '数据重载', 26, '');

insert into sys_tree (id, parent, name, nodedesc, sort, code) values (34, 3, '流程管理', '流程管理', 34, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (435, 34, '流程发布', '流程发布', 435, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (437, 34, '流程演示', '流程演示', 437, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (438, 34, '流程监控', '流程监控', 438, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (449, 8, '工作日历', '工作日历', 449, '');

insert into sys_tree (id, parent, name, nodedesc, sort, code) values (494, 8, 'TODO配置', 'TODO配置', 494, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (495, 8, '调度管理', '调度管理', 495, '');
insert into sys_tree (id, parent, name, nodeDesc, sort, code) values (498, 4, '货币类型', '货币类型', 498, 'money');

insert into sys_tree (id, parent, name, nodedesc, sort, code) values (512, 10, '授权管理', '授权管理', 512, '');


SET IDENTITY_INSERT sys_tree OFF;


/*初始化部门信息*/
SET IDENTITY_INSERT sys_department ON;
insert into sys_department (id, name, deptdesc, createtime, sort, deptno, code, code2, status, fincode, nodeid) values (6, '技术部', '技术部', null, 284, 'JS000', 'JS', 'J', 0, 'JS000', 6);
SET IDENTITY_INSERT sys_department OFF;


/*初始化用户信息*/
SET IDENTITY_INSERT sys_user ON;
insert into sys_user (id, account, password, code, name, blocked, createTime, lastLoginTime, lastLoginIP, evection, mobile, email, telephone, gender, headship, userType, fax, accountType, dumpFlag, adminFlag, deptId) values (1, 'root', 'lueSGJZetyySpUndWjMB', 'root', 'root', 0, '2013-08-01 00:00:00', '2013-08-01 00:00:00', '127.0.0.1', 0, '111', 'root@127.0.0.1', '111', 0, '管理员', 40, null, 0, 0, '1', 6);
SET IDENTITY_INSERT sys_user OFF;

/*初始化应用信息*/
SET IDENTITY_INSERT sys_application ON;
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (3, '应用模块', '应用模块', '', 3, 1, 3);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (8, '系统管理', '系统管理', '', 5, 1, 8);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (9, '基础数据', '基础数据', '', 30, 1, 4);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (10, '安全设置', '', '', 14, 2, 10);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (11, '系统目录', '', '/sys/tree.do?method=showMain', 10, 2, 11);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (12, '部门管理', '', '/sys/department.do?method=showFrame', 20, 2, 12);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (14, '角色管理', '', '/sys/role.do?method=showList', 15, 2, 14);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (15, '模块管理', '', '/sys/application.do?method=showFrame', 12, 2, 15);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (16, '字典管理', '', '/sys/dictory.do?method=showFrame', 15, 2, 16);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (20, '个人设置', '', '', 15, 2, 20);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (21, '修改密码', '', '/sys/user.do?method=prepareModifyPwd', 15, 2, 21);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (22, '修改个人信息', '', '/sys/user.do?method=prepareModifyInfo', 15, 2, 22);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (26, '数据重载', '', '/sys/dictory.do?method=loadDictory', 10, 2, 26);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (34, '流程管理', '工作流管理', '', 0, 1, 34);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (36, '流程监控', '流程监控', '/workflow/processController.jspa?operationType=4&loadBusiness=1', 36, 1, 438);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (435, '流程发布', '', '/workflow/deployController.jspa', 435, 1, 435);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (437, '流程演示', '', '/workflow/test/index.jsp', 437, 1, 437);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (449, '工作日历', '工作日历', '/others/workCalendar.do?method=showList', 449, 1, 449);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (512, '授权管理', '', '/sys/sysUserRole.do?method=showUsers', 512, 2, 512);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (494, 'TODO配置', '', '/sys/todo.do?method=showList', 494, 1, 494);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (495, '调度管理', '', '/sys/scheduler.do?method=showList', 495, 1, 495);


SET IDENTITY_INSERT sys_application OFF;


/*插入部门角色*/ 
SET IDENTITY_INSERT sys_dept_role ON;
insert into sys_dept_role (id, grade, code, sort, sysroleid, deptid) values (1, 0, null, 0, 15, 6);
SET IDENTITY_INSERT sys_dept_role OFF;

/*插入用户角色*/
SET IDENTITY_INSERT sys_user_role ON;
insert into sys_user_role (id, userid, roleid, authorized, authorizefrom, availdatestart, availdateend, processdescription) values (2, 1, 1, 1, 1, null, null, null);
SET IDENTITY_INSERT sys_user_role OFF;
 

/*插入系统功能*/
SET IDENTITY_INSERT sys_function ON;
insert into sys_function (id, name, funcdesc, funcmethod, sort, appid) values (1, '模块列表', '模块列表', 'com.glaf.base.modules.sys.action.SysApplicationAction.showList', 1, 15);
insert into sys_function (id, name, funcdesc, funcmethod, sort, appid) values (2, '增加模块', '增加模块', 'com.glaf.base.modules.sys.action.SysApplicationAction.prepareAdd', 2, 15);
insert into sys_function (id, name, funcdesc, funcmethod, sort, appid) values (3, '修改模块', '修改模块', 'com.glaf.base.modules.sys.action.SysApplicationAction.prepareModify', 3, 15);
insert into sys_function (id, name, funcdesc, funcmethod, sort, appid) values (4, '删除模块', '删除模块', 'com.glaf.base.modules.sys.action.SysApplicationAction.batchDelete', 4, 15);
SET IDENTITY_INSERT sys_function OFF;

SET IDENTITY_INSERT sys_dictory ON;
insert into sys_dictory (id, typeId, code, name, sort, dictDesc, blocked, ext1, ext2) values (1, 498, 'RMB', '人民币', 1, null, 0, '', '');
insert into sys_dictory (id, typeId, code, name, sort, dictDesc, blocked, ext1, ext2) values (2, 498, 'USD', '美元', 2, null, 0, '', '');
insert into sys_dictory (id, typeId, code, name, sort, dictDesc, blocked, ext1, ext2) values (3, 498, 'JPY', '日元', 3, null, 0, '', '');
insert into sys_dictory (id, typeId, code, name, sort, dictDesc, blocked, ext1, ext2) values (4, 498, 'HKD', '港币', 4, null, 0, '', '');
insert into sys_dictory (id, typeId, code, name, sort, dictDesc, blocked, ext1, ext2) values (5, 498, 'EUR', '欧元', 5, null, 0, '', '');
SET IDENTITY_INSERT sys_dictory OFF; 
   
 
/*插入访问权限*/

insert into sys_access (roleid, appid) values (1, 3);
insert into sys_access (roleid, appid) values (1, 8);
insert into sys_access (roleid, appid) values (1, 9);
insert into sys_access (roleid, appid) values (1, 10);
insert into sys_access (roleid, appid) values (1, 11);
insert into sys_access (roleid, appid) values (1, 12);
insert into sys_access (roleid, appid) values (1, 14);
insert into sys_access (roleid, appid) values (1, 15);
insert into sys_access (roleid, appid) values (1, 16);
insert into sys_access (roleid, appid) values (1, 20);
insert into sys_access (roleid, appid) values (1, 21);
insert into sys_access (roleid, appid) values (1, 22);
insert into sys_access (roleid, appid) values (1, 26);

insert into sys_access (roleid, appid) values (1, 36);
insert into sys_access (roleid, appid) values (1, 34);
insert into sys_access (roleid, appid) values (1, 435);
insert into sys_access (roleid, appid) values (1, 437);

insert into sys_access (roleid, appid) values (1, 449);
insert into sys_access (roleid, appid) values (1, 512); 
insert into sys_access (roleid, appid) values (1, 494); 
insert into sys_access (roleid, appid) values (1, 495); 


SET IDENTITY_INSERT sys_workcalendar ON; 
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (1, 6, 1, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (2, 13, 1, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (3, 20, 1, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (4, 27, 1, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (5, 26, 1, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (6, 19, 1, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (7, 12, 1, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (8, 5, 1, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (9, 2, 2, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (10, 9, 2, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (11, 16, 2, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (12, 23, 2, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (13, 3, 2, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (14, 10, 2, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (15, 17, 2, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (16, 24, 2, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (17, 3, 3, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (18, 10, 3, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (19, 17, 3, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (20, 24, 3, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (21, 31, 3, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (22, 30, 3, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (23, 23, 3, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (24, 16, 3, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (25, 9, 3, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (26, 2, 3, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (27, 7, 4, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (28, 14, 4, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (29, 21, 4, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (30, 28, 4, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (31, 27, 4, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (32, 20, 4, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (33, 13, 4, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (34, 6, 4, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (35, 5, 5, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (36, 12, 5, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (37, 19, 5, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (38, 26, 5, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (39, 25, 5, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (40, 18, 5, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (41, 11, 5, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (42, 4, 5, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (43, 2, 6, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (44, 9, 6, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (45, 16, 6, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (46, 23, 6, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (47, 30, 6, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (48, 29, 6, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (49, 22, 6, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (50, 15, 6, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (51, 8, 6, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (52, 1, 6, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (53, 7, 7, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (54, 14, 7, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (55, 21, 7, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (56, 27, 7, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (57, 20, 7, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (58, 13, 7, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (59, 6, 7, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (60, 28, 7, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (61, 4, 8, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (62, 11, 8, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (63, 18, 8, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (64, 25, 8, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (65, 31, 8, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (66, 24, 8, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (67, 17, 8, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (68, 10, 8, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (69, 3, 8, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (70, 1, 9, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (71, 8, 9, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (72, 15, 9, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (73, 22, 9, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (74, 29, 9, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (75, 28, 9, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (76, 21, 9, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (77, 14, 9, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (78, 7, 9, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (79, 7, 12, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (80, 14, 12, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (81, 21, 12, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (82, 28, 12, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (83, 1, 12, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (84, 8, 12, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (85, 15, 12, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (86, 22, 12, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (87, 29, 12, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (89, 2, 11, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (90, 9, 11, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (91, 16, 11, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (92, 23, 11, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (93, 30, 11, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (94, 24, 11, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (95, 17, 11, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (96, 10, 11, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (97, 3, 11, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (98, 5, 10, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (99, 12, 10, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (100, 19, 10, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (101, 1, 10, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (102, 2, 10, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (103, 3, 10, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (104, 4, 10, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (105, 6, 10, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (106, 13, 10, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (107, 20, 10, 2013);
insert into sys_workcalendar (id, freeday, freemonth, freeyear) values (108, 27, 10, 2013);
SET IDENTITY_INSERT sys_workcalendar OFF; 

 
