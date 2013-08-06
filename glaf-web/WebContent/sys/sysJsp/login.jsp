<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="html" uri="/sys/sysTld/struts-html.tld" %>
<%@ taglib prefix="bean" uri="/sys/sysTld/struts-bean.tld" %>
<%@ taglib prefix="logic" uri="/sys/sysTld/struts-logic.tld" %>
<%@ taglib prefix="pri" uri="/sys/sysTld/privilegeTag.tld" %>
<%
    String context = request.getContextPath();
	com.glaf.base.modules.utils.ContextUtil.getInstance().setContextPath(context);
%>
<html>
  <head>    
    <title>GTMC 系统开发基盘（内部测试版）</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<LINK rel=stylesheet type=text/css href="<%=request.getContextPath()%>/sys/sysCss/menu/css.css">
	<LINK rel=stylesheet type=text/css href="<%=request.getContextPath()%>/sys/sysCss/menu/style-sys.css">
	<LINK rel=stylesheet type=text/css href="<%=request.getContextPath()%>/sys/sysCss/menu/style-custom.css">
	<style>
		.login-input{width:150px;}
	</style>
  </head>
  <script type="text/javascript" src="<%=request.getContextPath()%>/sys/sysJs/frameWorkUtility.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/verify.js"></script>
<body bgcolor="#C5C1AA" onload="backload()">
	<html:form method="POST" action="/sys/authorize.do?method=login" onsubmit="return verifyAll(this);" >
	<input type="hidden" value="runLogin" name="actionMethodId">
<div align="center">
  <table width="99%" border="0" cellspacing="0" cellpadding="0">
   <tr align="center" valign="middle">
    <td height="630" valign="middle" background="<%=request.getContextPath()%>/sys/sysImages/bg.gif">
      <div align="center">
        <table width="496" height="361" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td background="<%=request.getContextPath()%>/sys/sysImages/loginbg.png"><div align="center">
              <table width="294" height="231" border="0" cellpadding="0" cellspacing="0"  id="login" >
                <tr>
                  <td colspan="2"><div align="right"></div></td>
                </tr>
                <tr>
                  <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                  <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                  <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                  <td colspan="2">&nbsp;</td>
                </tr>
                 <tr>
	            <td align="center" style="color: red;" colspan="2">
				<html:messages id="message" message="true"> 
	              <bean:write name="message"/> 
	            </html:messages> 
				</td>
	          </tr>
                <tr>
                  <td width="73"><div align="left">用户名</div></td>
                  <td width="221"><input onkeydown="if(event.keyCode==13)doSubmit(); " name="account" type="text" class="input login-input" datatype="string" nullable="no" maxsize="20" chname="Account" ></td>
                </tr>
                <tr>
                  <td><div align="left">密码</div></td>
                  <td><input onkeydown="if(event.keyCode==13)doSubmit(); " name="password" type="password" class="input login-input" datatype="string" nullable="no" maxsize="20" chname="Password" ></td>
                </tr>
                <tr>
                  <td colspan="2"><div align="center">
                    
                    <img name="login" onClick="doSubmit();" src="<%=request.getContextPath()%>/sys/sysImages/loginbt.gif" width="60" height="20">
                  &nbsp;
                    
                    <img name="reset" onClick="doReset();" src="<%=request.getContextPath()%>/sys/sysImages/cz.gif" width="60" height="20">
                  </div></td>
                </tr>
              </table>
            </div></td>
          </tr>
        </table>
    </div></td>
   </tr>
   <tr>
    <td class="menuxia" height="35"><div align="center">&copy; 2012 GTMC 版权所有</div></td>
   </tr>
  </table>
</div>
</html:form>

<script type="text/javascript" language="Javascript">    
	function doSubmit(){
	    objFrm = document.forms[0];
	   
	    clearErrorColor();
		submitForm(objFrm,"<bean:message key='baseSample.doubleSubmit'/>");
	}	
	function doReset(){
	    document.getElementsByName("password")[0].value="";
	    document.getElementsByName("account")[0].value="";
	    
	}	
	function backload()
    {
      if(top.location.href!=location.href)
        top.location.href=location.href;
     }
</script>

</body>
</html>
