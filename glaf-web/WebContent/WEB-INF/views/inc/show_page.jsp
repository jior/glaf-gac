<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ page import="com.glaf.base.utils.*"%>
<%
String context = request.getContextPath();
int total = ParamUtil.getIntParameter(request, "total", 0);
int pageCount = ParamUtil.getIntParameter(request, "page_count", 0);
int pageSize = ParamUtil.getIntParameter(request, "page_size", 10);
int pageNo = ParamUtil.getIntParameter(request, "page_no", 1);
String url = ParamUtil.getParameter(request, "url");
String params = URLDecoder.decode(ParamUtil.getParameter(request, "params"));
int go = pageNo;
%>
<div class="page-nav">
<table  border="0" align="right" cellpadding="0" cellspacing="0">
  <tr> 
    <td class="pageborder"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td align="center">当前第<%=pageNo%>页/共<%=pageCount%>页,<%=total%>条记录</td>
          <td align="center">
              <a href="<%=url%>?<%=WebUtil.getQueryString(params + "&page_no=1")%>">首页</a></td>
          <td align="center">
<%
if(pageNo>1) go=pageNo-1;
%>	
	<a href="<%=url%>?<%=WebUtil.getQueryString(params + "&page_no=" + go)%>">上一页</a>
		  </td>
          <td align="center">
<%
go = pageNo;
if(pageNo+1<=pageCount) go=pageNo+1;
%>	
	<a href="<%=url%>?<%=WebUtil.getQueryString(params + "&page_no=" + go)%>">下一页</a>         
		 </td>
          <td align="center">
              <a href="<%=url%>?<%=WebUtil.getQueryString(params + "&page_no=" + (pageCount==0?1:pageCount))%>">尾页</a></td>
        </tr>
      </table></td>
  </tr>
</table>
</div>