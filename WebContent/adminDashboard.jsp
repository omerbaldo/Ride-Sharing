<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336Final.admin"%>
<%@ page import="cs336Final.LoginObject"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="admin.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Dashboard</title>
</head>
<div class="tab">
  <button class="tablinks" id = "selected">Dashboard</button>
  <button class="tablinks">Ad Manager</button>
  <form method ='post' action = "adminUserManager.jsp"> <button class="tablinks">User Manager</button></form>
  <button class="tablinks" style ="float: right;">Logout</button>
</div>
<body>
	<%
	session.setAttribute("user", (LoginObject) session.getAttribute("user"));%>

</body>
</html>