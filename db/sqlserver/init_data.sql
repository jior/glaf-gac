/** �������

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



/*��ʼ����ɫ��Ϣ*/
SET IDENTITY_INSERT sys_role ON;

insert into sys_role (id, name, roleDesc, sort, code) values (1, '����', '', 15, 'R001');
insert into sys_role (id, name, roleDesc, sort, code) values (2, '�Ƴ�', '', 14, 'R002');
insert into sys_role (id, name, roleDesc, sort, code) values (3, 'CO', '', 12, 'R003');
insert into sys_role (id, name, roleDesc, sort, code) values (4, 'ϵ��', '', 13, 'R004');
insert into sys_role (id, name, roleDesc, sort, code) values (5, 'Ԥ��Ա', '', 11, 'R005');
insert into sys_role (id, name, roleDesc, sort, code) values (6, '���Ź���Ա', '', 10, 'R006');
insert into sys_role (id, name, roleDesc, sort, code) values (7, '�ɹ�����Ա', '', 9, 'R007');
insert into sys_role (id, name, roleDesc, sort, code) values (10, '�ɹ�����', '', 6, 'R010');
insert into sys_role (id, name, roleDesc, sort, code) values (11, '���뵣��', 'ʹ�ò���������Ʊ������', 5, 'R011');
insert into sys_role (id, name, roleDesc, sort, code) values (12, '�յ�����', '', 4, 'R012');
insert into sys_role (id, name, roleDesc, sort, code) values (15, 'ϵͳ����Ա', '', 1, 'SystemAdministrator');
insert into sys_role (id, name, roleDesc, sort, code) values (16, '�ּ�����Ա', '', 2, 'BranchAdmin');
insert into sys_role (id, name, roleDesc, sort, code) values (18, '����', '', 18, 'R017');

SET IDENTITY_INSERT sys_role OFF;

/*��ʼϵͳ����Ϣ*/

SET IDENTITY_INSERT sys_tree ON;
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (1, 0, '/', '��Ŀ¼', 1, '0');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (2, 1, '���ݽṹ', '', 20, '01');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (3, 1, 'Ӧ��ģ��', '', 10, '02');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (4, 2, '��������', '', 50, '011');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (5, 2, '���Žṹ', '���Žṹ', 40, '012');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (6, 5, '������', '������', 284, 'JS000');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (8, 3, 'ϵͳ����', 'ϵͳ����', 5, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (10, 3, '��ȫ����', '��ȫ����', 30, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (11, 8, 'ϵͳĿ¼', 'ϵͳĿ¼', 20, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (12, 10, '���Ź���', '���Ź���', 20, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (14, 10, '��ɫ����', '��ɫ����', 15, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (15, 10, 'ģ�����', 'ģ�����', 12, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (16, 8, '�ֵ����', '�ֵ����', 20, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (20, 3, '��������', '��������', 30, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (21, 20, '�޸�����', '�޸�����', 30, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (22, 20, '�޸ĸ�����Ϣ', '�޸ĸ�����Ϣ', 30, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (26, 8, '��������', '��������', 26, '');

insert into sys_tree (id, parent, name, nodedesc, sort, code) values (34, 3, '���̹���', '���̹���', 34, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (435, 34, '���̷���', '���̷���', 435, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (437, 34, '������ʾ', '������ʾ', 437, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (438, 34, '���̼��', '���̼��', 438, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (449, 8, '��������', '��������', 449, '');

insert into sys_tree (id, parent, name, nodedesc, sort, code) values (494, 8, 'TODO����', 'TODO����', 494, '');
insert into sys_tree (id, parent, name, nodedesc, sort, code) values (495, 8, '���ȹ���', '���ȹ���', 495, '');
insert into sys_tree (id, parent, name, nodeDesc, sort, code) values (498, 4, '��������', '��������', 498, 'money');

insert into sys_tree (id, parent, name, nodedesc, sort, code) values (512, 10, '��Ȩ����', '��Ȩ����', 512, '');


SET IDENTITY_INSERT sys_tree OFF;


/*��ʼ��������Ϣ*/
SET IDENTITY_INSERT sys_department ON;
insert into sys_department (id, name, deptdesc, createtime, sort, deptno, code, code2, status, fincode, nodeid) values (6, '������', '������', null, 284, 'JS000', 'JS', 'J', 0, 'JS000', 6);
SET IDENTITY_INSERT sys_department OFF;


/*��ʼ���û���Ϣ*/
SET IDENTITY_INSERT sys_user ON;
insert into sys_user (id, account, password, code, name, blocked, createTime, lastLoginTime, lastLoginIP, evection, mobile, email, telephone, gender, headship, userType, fax, accountType, dumpFlag, adminFlag, deptId) values (1, 'root', 'lueSGJZetyySpUndWjMB', 'root', 'root', 0, '2013-08-01 00:00:00', '2013-08-01 00:00:00', '127.0.0.1', 0, '111', 'root@127.0.0.1', '111', 0, '����Ա', 40, null, 0, 0, '1', 6);
SET IDENTITY_INSERT sys_user OFF;

/*��ʼ��Ӧ����Ϣ*/
SET IDENTITY_INSERT sys_application ON;
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (3, 'Ӧ��ģ��', 'Ӧ��ģ��', '', 3, 1, 3);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (8, 'ϵͳ����', 'ϵͳ����', '', 5, 1, 8);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (9, '��������', '��������', '', 30, 1, 4);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (10, '��ȫ����', '', '', 14, 2, 10);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (11, 'ϵͳĿ¼', '', '/sys/tree.do?method=showMain', 10, 2, 11);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (12, '���Ź���', '', '/sys/department.do?method=showFrame', 20, 2, 12);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (14, '��ɫ����', '', '/sys/role.do?method=showList', 15, 2, 14);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (15, 'ģ�����', '', '/sys/application.do?method=showFrame', 12, 2, 15);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (16, '�ֵ����', '', '/sys/dictory.do?method=showFrame', 15, 2, 16);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (20, '��������', '', '', 15, 2, 20);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (21, '�޸�����', '', '/sys/user.do?method=prepareModifyPwd', 15, 2, 21);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (22, '�޸ĸ�����Ϣ', '', '/sys/user.do?method=prepareModifyInfo', 15, 2, 22);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (26, '��������', '', '/sys/dictory.do?method=loadDictory', 10, 2, 26);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (34, '���̹���', '����������', '', 0, 1, 34);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (36, '���̼��', '���̼��', '/workflow/processController.jspa?operationType=4&loadBusiness=1', 36, 1, 438);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (435, '���̷���', '', '/workflow/deployController.jspa', 435, 1, 435);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (437, '������ʾ', '', '/workflow/test/index.jsp', 437, 1, 437);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (449, '��������', '��������', '/others/workCalendar.do?method=showList', 449, 1, 449);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (512, '��Ȩ����', '', '/sys/sysUserRole.do?method=showUsers', 512, 2, 512);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (494, 'TODO����', '', '/sys/todo.do?method=showList', 494, 1, 494);
insert into sys_application (id, name, appdesc, url, sort, showmenu, nodeid) values (495, '���ȹ���', '', '/sys/scheduler.do?method=showList', 495, 1, 495);


SET IDENTITY_INSERT sys_application OFF;


/*���벿�Ž�ɫ*/ 
SET IDENTITY_INSERT sys_dept_role ON;
insert into sys_dept_role (id, grade, code, sort, sysroleid, deptid) values (1, 0, null, 0, 15, 6);
SET IDENTITY_INSERT sys_dept_role OFF;

/*�����û���ɫ*/
SET IDENTITY_INSERT sys_user_role ON;
insert into sys_user_role (id, userid, roleid, authorized, authorizefrom, availdatestart, availdateend, processdescription) values (2, 1, 1, 1, 1, null, null, null);
SET IDENTITY_INSERT sys_user_role OFF;
 

/*����ϵͳ����*/
SET IDENTITY_INSERT sys_function ON;
insert into sys_function (id, name, funcdesc, funcmethod, sort, appid) values (1, 'ģ���б�', 'ģ���б�', 'com.glaf.base.modules.sys.action.SysApplicationAction.showList', 1, 15);
insert into sys_function (id, name, funcdesc, funcmethod, sort, appid) values (2, '����ģ��', '����ģ��', 'com.glaf.base.modules.sys.action.SysApplicationAction.prepareAdd', 2, 15);
insert into sys_function (id, name, funcdesc, funcmethod, sort, appid) values (3, '�޸�ģ��', '�޸�ģ��', 'com.glaf.base.modules.sys.action.SysApplicationAction.prepareModify', 3, 15);
insert into sys_function (id, name, funcdesc, funcmethod, sort, appid) values (4, 'ɾ��ģ��', 'ɾ��ģ��', 'com.glaf.base.modules.sys.action.SysApplicationAction.batchDelete', 4, 15);
SET IDENTITY_INSERT sys_function OFF;

SET IDENTITY_INSERT sys_dictory ON;
insert into sys_dictory (id, typeId, code, name, sort, dictDesc, blocked, ext1, ext2) values (1, 498, 'RMB', '�����', 1, null, 0, '', '');
insert into sys_dictory (id, typeId, code, name, sort, dictDesc, blocked, ext1, ext2) values (2, 498, 'USD', '��Ԫ', 2, null, 0, '', '');
insert into sys_dictory (id, typeId, code, name, sort, dictDesc, blocked, ext1, ext2) values (3, 498, 'JPY', '��Ԫ', 3, null, 0, '', '');
insert into sys_dictory (id, typeId, code, name, sort, dictDesc, blocked, ext1, ext2) values (4, 498, 'HKD', '�۱�', 4, null, 0, '', '');
insert into sys_dictory (id, typeId, code, name, sort, dictDesc, blocked, ext1, ext2) values (5, 498, 'EUR', 'ŷԪ', 5, null, 0, '', '');
SET IDENTITY_INSERT sys_dictory OFF; 
   
 
/*�������Ȩ��*/

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

 
