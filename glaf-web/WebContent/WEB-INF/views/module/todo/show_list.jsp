<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="com.glaf.base.modules.todo.*"%>
<%@ page import="com.glaf.base.modules.todo.model.*"%>
<%@ page import="com.glaf.base.modules.todo.service.*"%>
<%@ page import="com.glaf.base.utils.*"%>
<%@ page import="com.glaf.base.modules.sys.*"%>
<%@ page import="com.glaf.base.modules.sys.model.*"%>
<%@ page import="com.glaf.base.modules.sys.service.*"%>
<%@ page import="org.jpage.util.*" %>
<%@ page import="org.jpage.core.query.paging.*" %>
<%@ page import="com.glaf.base.modules.*" %>
<%@ page import="com.glaf.base.modules.todo.service.*" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%
    String context = request.getContextPath();
    SysUser user = com.glaf.base.utils.RequestUtil.getLoginUser(request);
	
	Map params = org.jpage.util.RequestUtil.getQueryParams(request);

	List rows = (List)request.getAttribute("rows");

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>基础平台系统</title>
<link href="<%=context%>/css/site.css" rel="stylesheet" type="text/css">
<script src="<%=context%>/js/main.js" language="javascript"></script>
<script type="text/javascript">
_dynarch_menu_url = "<%=context%>/js/hmenu";
</script>
<script type="text/javascript" src="<%=context%>/js/hmenu/hmenu.js"></script>
<script type="text/javascript" src="<%=context%>/js/main.js"></script>
<script type="text/javascript" src="<%=context%>/js/site.js"></script>
<script type="text/javascript">
function importXls(){
	location.href="<%=context%>/sys/todo.do?method=showUpload";
}
</script>
<jsp:include page="/WEB-INF/views/module/header.jsp" flush="true"/>
</head>
<body >
<div class="nav-title"><span class="Title">工作流配置</span>&gt;&gt;TODO配置</div>
<br>
<div style="text-align:right;padding-right:18%;"><input type="button" value="导入"
			name="createScheduler" class="button"
			onclick="javascript:importXls();"></div>
<br>
 <table  width="90%" border="0" cellspacing="1" cellpadding="0" class="list-box">
          <tr class="list-title">
		    <td align="center" width="60">序号</td>
            <td align="center" width="120">模块名称</td>
			<td align="center">标题</td>
			<td align="center">内容</td>
			<!-- <td align="center" width="180">流程名称</td> -->
            <!-- <td align="center" width="60">角色代码</td> -->
            <td align="center" width="60">期限</td>
			<td align="center" width="60">a(小时)</td>
			<td align="center" width="60">b(小时)</td>
			<td align="center" width="90">是否启用</td>
			<td align="center" width="60">功能键</td>
          </tr>
		  <%if(rows != null && rows.size()> 0){
			  int index = 1;
			  Iterator iterator008 = rows.iterator();
			  while(iterator008.hasNext()){
                   ToDo todo = (ToDo)iterator008.next();
				   pageContext.setAttribute("todo", todo);
			  %>
          <tr class="list-a">
		    <td height="20" align="center">
			    <%=index++%>
			</td>
            <td height="20" align="left">
			    <c:out value="${todo.moduleName}"/>
			</td>
			<td height="20" align="left">
			   <c:out value="${todo.title}"/>
			</td>
            <td align="left" >
			   <c:out value="${todo.content}"/>
			</td>
			<!-- <td align="left">
			    <c:out value="${todo.processName}"/>
			</td>
            <td align="left" class="yellow" width="60">
			   <c:out value="${todo.roleCode}"/>
			</td> -->
            <td align="right" width="60">
			    <c:out value="${todo.limitDay}"/>
			</td>
			<td align="right" width="60">
			    <c:out value="${todo.xa}"/>
			</td>
			<td align="right" width="60">
			    <c:out value="${todo.xb}"/>
			</td>
			<td align="center" width="90">
			   <c:if test="${todo.enableFlag == 1}">
			      <strong><font color="green"> 启用 </font></strong>
			   </c:if>
			   <c:if test="${todo.enableFlag == 0}">
			      <strong><font color="red"> 禁用 </font></strong>
			   </c:if>
			</td>
			<td align="center" width="60">
			    <a href="<%=context%>/sys/todo.do?method=showModify&id=<c:out value="${todo.id}"/>"><img src="<%=context%>/images/edit_profile.png" border="0"></a>
			</td>
          </tr>
		  <%     }
				  }
		  %>
        </table>
        </body>
        </html>
        