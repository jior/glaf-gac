<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>
<%@ page import="com.glaf.base.modules.sys.*"%>
<%@ page import="com.glaf.base.modules.sys.model.*"%>
<%@ page import="com.glaf.base.modules.sys.service.*"%>
<%@ page import="org.springframework.web.context.*"%>
<%@ page import="org.springframework.web.context.support.*"%>
<%@ page import="com.glaf.base.utils.StringUtil"%>
<%@ page import="com.glaf.base.modules.workspace.model.*"%>
<%@ page import="com.glaf.base.modules.workspace.service.*"%>
<%
WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
SysUser user = com.glaf.base.utils.RequestUtil.getLoginUser(request);
String menu = (String)session.getAttribute(SysConstants.MENU);

MyMenuService myMenuService = (MyMenuService) wac.getBean("myMenuService");
List menuList = myMenuService.getMyMenuList(user.getId());
String context = request.getContextPath();
%>
<script type="text/javascript">
_dynarch_menu_url = "<%=context%>/js/hmenu";
</script>
<script type='text/javascript' src='<%= context %>/js/main.js'></script>
<script type='text/javascript' src='<%= context %>/js/site.js'></script>
<script type="text/javascript">
    context = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript">
//window.onload = function() {
  //DynarchMenu.setup('menu1', { context: true});
//}
DynarchMenu.setup=function(aa){}
function modifyInfo(){	
  var url="<%=context%>/sys/user.do?method=prepareModifyInfo";
  var width=450;
  var height=350;
  var scroll="no";
  openWindow(url, width, height, scroll);	
}
function authorize(){	
  var url="<%=context%>/sys/sysUserRole.do?method=showSysAuth";
  var width=400;
  var height=380;
  var scroll="no";
  openWindow(url, width, height, scroll);	
}
function window.onbeforeunload(){
	if(event.clientX>document.body.clientWidth&&event.clientY<0||event.altKey){
		//window.event.returnValue="确定要退出基础平台系统吗?";
		window.open("<%=context%>/sys/authorize.do?method=logout");
	}
}
</script>


