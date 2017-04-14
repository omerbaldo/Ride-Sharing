<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336Final.LoginObject"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="user.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Dashboard</title>
</head>
<div class="tab">
  <button class="tablinks" id = "selected">Dashboard</button>
  <form method = 'post' action= "systemSupportAd.jsp"><button class="tablinks">Ad Manager</button></form>
  <form method ='post' action = "systemSupportUserManager.jsp"> <button class="tablinks">User Manager</button></form>
  <form method = 'post' action = "systemSupportResetPassword.jsp"> <button class="tablinks">Reset Users</button></form>
  <form method ='post' action = "Login.jsp"><button class="tablinks" style ="float: right;">Logout</button></form>
</div>
<body>
	<%
	session.setAttribute("user", (LoginObject) session.getAttribute("user"));%>

</body>
</html>