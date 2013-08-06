<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<style type="text/css">
 		.msg-box{ margin-left:auto;margin-right:auto;width:150px;border: #C3C3C3 1px solid;height:150px;margin-top:50px; }
 		.msg-bar{
 		overflow: hidden ; text-overflow: ellipsis ; border: #C3C3C3 1px solid; PADDING-BOTTOM: 0px; PADDING-LEFT: 3px; PADDING-RIGHT: 3px; font-size:14px;
TEXT-ALIGN: center; FILTER: progid:DXImageTransform.Microsoft.gradient(enabled='enabled',startColorstr=#DDEEFE, endColorstr=#96BDD5); BACKGROUND: #f4f5f9; HEIGHT: 25px; VERTICAL-ALIGN: middle; PADDING-TOP: 3px; }
</style>
</head>
<body>
		<div class="msg-box">
				<div class="msg-bar">提示</div>
				${msg }
		</div>
</body>
</html>
<script>
	alert('${msg }!');
	if(window.opener)
	window.opener.location.replace(window.opener.location.href);
	if(window.parent)
		window.parent.location.replace(window.parent.location.href);
	window.close();
</script>