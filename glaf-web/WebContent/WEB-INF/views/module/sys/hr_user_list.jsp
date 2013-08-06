<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ page import="java.util.*"%>
<%@ page import="com.glaf.base.utils.*"%>
<%@ page import="com.glaf.base.modules.sys.*"%>
<%@ page import="com.glaf.base.modules.sys.model.*"%>
<%@ page import="com.glaf.base.modules.Constants"%>
<%@ page import="com.glaf.base.modules.sys.model.SysDepartment"%>
<%
int pageSize = Constants.PAGE_SIZE;

String context = request.getContextPath();
PageResult pager = (PageResult) request.getAttribute("pager");
List list = pager.getResults();
Iterator iter = list.iterator();
String name =ParamUtil.getParameter(request,"fullName");
String deptid =ParamUtil.getParameter(request,"deptid");
%>
<html>
<head>
<base target="_self">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title></title>
<link href="../../css/site.css" type="text/css" rel="stylesheet">
<link href="<%=context%>/css/site.css" type="text/css" rel="stylesheet">
<script language="javascript" src='<%=context%>/js/main.js'></script>
<script language="javascript" src='<%=context%>/js/verify.js'></script>
</head>
<script language="javascript">
function selMultData(){
	document.getElementById("hr_form").action="<%=context%>/sys/user.do?method=saveHRUser&deptId=${parent}";
	//alert(document.getElementById("hr_form").action);
	document.getElementById("hr_form").submit();
}
</script>
<body>
<table width="430" border="0" align="center" cellspacing="0" cellpadding="0">      
      
    </table>
<form action="?method=getHRUser&deptId=<%=deptid%>" method="post" id="hr_form">
<table width="400" border="0" align="center" cellpadding="0" cellspacing="0" class="box">  
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">      
      <tr class="box">
        <td class="box-lt">&nbsp;</td>
        <td class="box-mt">&nbsp;</td>
        <td class="box-rt">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td class="box-mm">
    <table width="100%"border="0" align="center" cellspacing="0" cellpadding="0" class="box">
      <tr>
         <td class="input-box">用户名称
          <input name="fullName" type="text" class="input" size="15">
          <input name="Submit" type="submit" value=" " class="submit-search"></td>
        </tr>
    </table>
   
      <table width="95%" align="center" border="0" cellspacing="0" cellpadding="5">
	    <tr>
		  <td width="7%" align="center"><input type="checkbox" name="id" value="checkbox" onClick="CheckAlls(this, 'id')"></td>
		  <td width="93%">全择</td>
		</tr>
		</table>
		<table width="95%" align="center" border="0" cellspacing="1" cellpadding="3" class="list-box">
<%
  int i=0;
while(iter.hasNext()){
  i++;
  ExpEmployees user = (ExpEmployees)iter.next();
%>        		
		<tr class="<%= i % 2 == 0 ? "" : "list-back" %>">
          <td width="7%" class="td-cb"><input type="checkbox" name="id" value="<%=user.getCode()%>" title="<%=user.getName()%>" code="<%=user.getEmail()%>" ></td>
           <td width="7%" align="center"><%=((pager.getCurrentPageNo()-1)*pageSize + i)%></td>
           <td width="20%"> <%=user.getCode()%> </td>
          <td width="23%" class="td-text"><%= user.getName() %></td>
          <td width="43%" class="td-no"><%= user.getEmail() %></td>
        </tr>
        
<%
}
%>		
      </table>
	  
	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
          <td height="30" align="center"><%
String params = WebUtil.getQueryString(request);
%>
              <jsp:include page="/WEB-INF/views/inc/show_page.jsp" flush="true">
                <jsp:param name="total" value="<%=pager.getTotalRecordCount()%>"/>    
                <jsp:param name="page_count" value="<%=pager.getTotalPageCount()%>"/>    
                <jsp:param name="page_size" value="<%=pageSize%>"/>    
                <jsp:param name="page_no" value="<%=pager.getCurrentPageNo()%>"/>    
                <jsp:param name="url" value=""/>    
                <jsp:param name="params" value="<%=java.net.URLEncoder.encode(params)%>"/>    
              </jsp:include></tr>
      </table>
    </td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr class="box">
        <td class="box-lb">&nbsp;</td>
        <td class="box-mb">&nbsp;</td>
        <td class="box-mb">&nbsp;</td>
        <td class="box-rb">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="400" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" height="30"><input type="button" name="btn_save" value="确定" class="button" onClick="selMultData()" /></td>
  </tr>
</table>
</form>
</body>
</html>
