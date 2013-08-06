<%@page import="org.jpage.util.ResponseUtil"%>
<%@page import="menuBuild.builMenu"%>
<%@page import="sysSrc.common.login.SimpleJson"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="baseSrc.framework.*"%>
<%@ page import="baseSrc.common.*"%>
<%@ page import="java.util.*"%>

<%
	//获取session
	//List<SimpleJson> list = (List)request.getSession().getAttribute(BaseConstants.ISC_BASE_BEANCOM_MENU);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="../../scripts/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="../../scripts/easyui/themes/icon.css">

<script type="text/javascript" src="../../scripts/jquery.min.js"></script>
<script type="text/javascript"
	src="../../scripts/easyui/jquery.easyui.min.js"></script>
</head>
<style>
a:link{
	/* Removing the inherited underline from the titles */
	text-decoration:none;
}
a:hover{
	text-decoration:none;
	color: #993300;
}
</style>
<body style="margin-top: 0px; margin-left: 0px;">
	<div id="aa" class="easyui-accordion"
		style="width: 187px; height: 520px;">


		<%
		
		List<SimpleJson> list = (List)request.getSession().getAttribute(BaseConstants.ISC_BASE_BEANCOM_MENU);
		out.write( new builMenu().buildAccordionPanel(list));
		

		
 %>


	</div>
	<script type="text/javascript">
	function goUrl(url){
		if(url=="")return;
		window.parent.frames['mainFrame'].location.href="<%=request.getContextPath()%>/"+url;
	}
		$(document).ready(function() {

			// var x= $('#aa').accordion('getSelected').panel({collapsed:true,doSize:true});  
			//x.collapsed=true;
		});
	</script>

	


</body>
</html>