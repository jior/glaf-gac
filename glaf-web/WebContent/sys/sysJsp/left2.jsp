<%@page import="sysSrc.common.login.SimpleJson"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="baseSrc.framework.*" %>
<%@ page import="baseSrc.common.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="bean" uri="/sys/sysTld/struts-bean.tld"%>
<%
	//获取session
	List<SimpleJson> list = (List)request.getSession().getAttribute(BaseConstants.ISC_BASE_BEANCOM_MENU);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>jquery弹性菜单</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/sys/sysCss/menu/menu.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/sys/sysCss/menu/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/sys/sysCss/menu/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/sys/sysCss/menu/xixi.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/sys/sysJs/frameWorkUtility.js"></script>
<script language="javascript" type="text/javascript">
function changeClass(thisObt){
  //找到所有菜单项，设置标题颜色为黑色
  var livar = document.getElementsByName("lightbutton");

	for(i=0;i<livar.length;i++){
		if (livar[i].className=='linkclassnewbutton'){
      livar[i].className='linkclassoldbutton';
    }
	}	
	
	var livar = document.getElementsByName("lightli");

	for(i=0;i<livar.length;i++){
		if (livar[i].className=='linkclassnew'){
      livar[i].className='linkclassold';
    }
	}	
	//设置当前选中项的字体颜色为蓝色
	thisObt.className="linkclassnew";
	
}

function changeClassButton(thisObt){
  //找到所有菜单项，设置标题颜色为黑色
  var livar = document.getElementsByName("lightli");

	for(i=0;i<livar.length;i++){
		if (livar[i].className=='linkclassnew'){
      livar[i].className='linkclassold';
    }
	}	
	
	var livar = document.getElementsByName("lightbutton");

	for(i=0;i<livar.length;i++){
		if (livar[i].className=='linkclassnewbutton'){
      livar[i].className='linkclassoldbutton';
    }
	}	
	//设置当前选中项的字体颜色为蓝色
	thisObt.className="linkclassnewbutton";
	
}
</script>
</head>

<body style="text-align:center">
<div id="main">
  <ul class="container">
      <li class="menu">
          <ul>
		    <li class="button">
		    	<a name="lightbutton" onClick="window.parent.frames['mainFrame'].location.href='<%=request.getContextPath()%>/sys/sysJsp/main.jsp';changeClassButton(this);" href="#" class="red">首页 </a>
		    </li>   
          </ul>
      </li>
      <%
            if(list!=null)
			for(SimpleJson sj : list){
            	String sMenu = "<li class='menu'  ><ul><li class='button' ><a href='#' class='red'>" +sj.getName() + "<span></span></a></li><li class='dropdown'><ul>";
            	
            	SimpleJson[] sims =  sj.getChildren();
            	if(sims!=null)
            	for(SimpleJson sim : sims){
            		boolean bChil = false;
            		if(sim.getChildren()!=null){
            			if(sim.getChildren().length>0){
            				bChil = true;
            			}
            			
            		}
            		if(bChil){
            			sMenu = sMenu + "</ul><ul class='father'><li class='button' style=' height: 20px; ''><a style='width: 110px' name='lightli' onclick='changeClass(this)' href='#' target='mainFrame'>" + 
            					sim.getName() + "</a></li><li class='dropdownFather'><ul>";
            			if(sim!=null&&sim.getChildren()!=null)
            			for(SimpleJson chil : sim.getChildren()){
            				sMenu = sMenu + "<li class='highlight'><a name='lightli' onclick='changeClass(this)' href='"+request.getContextPath() +"/"+ chil.getUrl() + "' target='mainFrame'>" + chil.getName() + "</a></li>";
            			}
            			
            			sMenu = sMenu + "</ul></li></ul><ul>";
            		}
            		else{
            			sMenu = sMenu + "<li class='highlight'><a name='lightli' onclick='changeClass(this)' href='" +request.getContextPath() +"/"+ sim.getUrl() + "' target='mainFrame'>" + sim.getName() + "</a></li>";
            		}
            	}
            	sMenu = sMenu + " </ul></li></ul></li>";
             %>
             <%=sMenu%>
	<%}%>
</ul>
<div class="clear"></div>
</div>



<p>&nbsp;</p>
</body>
</html>
