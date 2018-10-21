<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String context = request.getContextPath(); %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="themes/default/easyui.css" type="text/css"></link>
<link rel="stylesheet" href="themes/icon.css" type="text/css"></link>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
<title>欢迎进入淘淘商城</title>
</head>
<body class="easyui-layout">


	<div data-options="region:'north',split:true,border:true"
		style="height: 50px;">
		<h1>欢迎${pageContext.request.getAttribute("name") }进入淘淘商城</h1>
		
	</div>
	<div data-options="region:'south',split:true,border:true"
		style="height: 100px;">版权所有@Sarkin</div>
	<div data-options="region:'east',split:true,border:true"
		style="width: 100px;">east
		
	<div data-options="region:'west',split:true,border:true"
		style="width: 100px;">west</div>
	<div
		data-options="region:'center',split:true,border:true,href:'<%=context%>/from/listaction!list'"
		style="padding: 5px;"></div>

</body>
</html>

