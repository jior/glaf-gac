<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.glaf.base.modules.sys.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%
     String contextPath = request.getContextPath();
	 java.util.Date today = new java.util.Date();
%>
<html>
<title>任务调度管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=contextPath%>/css/site.css" type="text/css" rel="stylesheet">
<script language="javascript" src='<%=contextPath%>/js/verify.js'></script>
<script language="javascript" src='<%=contextPath%>/js/main.js'></script>
<script type="text/javascript">
_dynarch_menu_url = "<%=contextPath%>/js/hmenu";
</script>
<script type="text/javascript" src="<%=contextPath%>/js/hmenu/hmenu.js"></script>
<script language="javascript">

function createScheduler() {
    location.href="<%=request.getContextPath()%>/sys/scheduler.do?method=showModify";
}

function modifyScheduler(taskId) {
    location.href="<%=request.getContextPath()%>/sys/scheduler.do?method=showModify&taskId="+taskId;
}

function lockedScheduler(taskId, locked) {
	if(locked == "1"){
		if(confirm("锁定将无法进行任务调度，您真的要锁定吗？")) { 
			location.href="<%=request.getContextPath()%>/sys/scheduler.do?method=locked&taskId="+taskId+"&locked="+locked;
		}
	} else {
			 location.href="<%=request.getContextPath()%>/sys/scheduler.do?method=locked&taskId="+taskId+"&locked="+locked;
		}
}

function schedulerXY(taskId, startup) {
	if(startup == "false"){
	  if(confirm("您真的要停止任务调度吗？")) { 
		location.href="<%=request.getContextPath()%>/sys/scheduler.do?method=startup&taskId="+taskId+"&startup=0";
	  }
	} else {
		location.href="<%=request.getContextPath()%>/sys/scheduler.do?method=startup&taskId="+taskId+"&startup=1";
    }
}

</script>
<jsp:include page="/WEB-INF/views/module/header.jsp" flush="true"/>
<body onLoad="DynarchMenu.setup('menu1', { context: true});">

<div class="nav-title"><span class="Title">调度管理</span></div>
 <br>
 <div style="text-align:right;padding-right:20%;">
 	<input type="button" value="新增任务调度"
			name="createScheduler" class="button"
			onclick="javascript:createScheduler();"/>
 </div>

<br>
<table class="list-box" cellspacing="1">
	<tr class="list-title">
		<td align="center" noWrap>任务名称</td>
		<td align="center" noWrap>主题</td>
		<td align="center" noWrap>开始时间</td>
		<td align="center" noWrap>结束时间</td>
		<td align="center" noWrap>状态</td>
		<td align="center" noWrap>功能键</td>
	</tr>
	<c:forEach items="${schedulers}" var="scheduler">
	 <%
        Scheduler model = (Scheduler)pageContext.getAttribute("scheduler");
		String startupImg = "stop.gif";
		String label = "启动任务";
		String status = "<font color=red><b>已停止</b><font>";
		int running = -1;
		if(model.getEndDate() != null && model.getEndDate().getTime() < today.getTime()){
			startupImg = "stop.gif";
			label = "任务过期";
			status = "<font color=blue><b>已过期</b><font>";
		} else {
			if(0 == model.getStartup()){
                running = 0;
				label = "启动任务";
			} else {
				startupImg = "running.gif";
				running = 1;
				label = "停止任务";
				status = "<font color=green><b>运行中</b><font>";
			}
		}

        int lockedFlag = model.getLocked();
		String locked = lockedFlag+"";	
		String alt = "启用";
		String title = "";
		String lockedImg = "locked0.gif";

		if(lockedFlag == 1){
			locked = "0";
			alt = "启用";
			title="<font color=\"red\">已锁定</font>";
			lockedImg = "locked1.gif";
		} else {
			lockedImg = "locked0.gif";
		    locked = "1";
			alt = "锁定";
			title="<font color=\"green\">已启用</font>";
	   }
	    pageContext.setAttribute("lockedImg",lockedImg);
	    pageContext.setAttribute("locked",locked);
		pageContext.setAttribute("title",title);
	    pageContext.setAttribute("alt",alt);
 
  %>
		<tr onmouseover="this.className='x-row-over';"
			onmouseout="this.className='x-row-out';" class="x-content">
			<td align="left" noWrap>&nbsp; <a
				href="<%=request.getContextPath()%>/sys/scheduler.do?method=showModify&taskId=<c:out value="${scheduler.id}"/>">
			<c:out value="${scheduler.taskName}" /> </a></td>
			<td align="left" noWrap>&nbsp; <c:out value="${scheduler.title}" />
			</td>
			<td align="center" noWrap>&nbsp; <fmt:formatDate
				value="${scheduler.startDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			<td align="center" noWrap>&nbsp; <fmt:formatDate
				value="${scheduler.endDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			<td align="center" noWrap>&nbsp; <b><c:out value="${title}"
				escapeXml="false" /></b></td>
			<td align="left" valign="center" noWrap>&nbsp; <a
				href="<%=request.getContextPath()%>/sys/scheduler.do?method=showModify&taskId=<c:out value="${scheduler.id}"/>">
			<img src="<%=request.getContextPath()%>/images/update.gif"
				title="修改记录" border="0" style="cursor: hand;">修改</a>  
			<%
			if(model.getLocked() == 0){
			  if(running > 0){%> &nbsp;  
			  <img
				src="<%=request.getContextPath()%>/images/running.gif" border="0"
				style="cursor: hand;" height="18" width="18"
				onclick="javascript:schedulerXY('<c:out value="${scheduler.id}"/>','false');">
			<%}else{%> &nbsp; <img
				src="<%=request.getContextPath()%>/images/stop.gif" border="0"
				style="cursor: hand;" height="18" width="18"
				onclick="javascript:schedulerXY('<c:out value="${scheduler.id}"/>','true');">
			<%}%> <%=status%> <%}%>
			</td>
		</tr>
	</c:forEach>

</table>
</form>
</body>
</html>

