<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336Final.LoginObject"%>
<%@ page import="java.util.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="user.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<style>
	h1
	{
		font-family :'Roboto', sans-serif
	}
	h3
	{
		font-family :'Roboto', sans-serif
	}
</style>
<title>User Dashboard</title>
</head>
<div class="tab">
  <button class="tablinks" id = "selected">Dashboard</button>
  <form method = 'post' action= "systemSupportAd.jsp"><button class="tablinks">Ad Manager</button></form>
  <form method ='post' action = "systemSupportReport.jsp"> <button class="tablinks">Ad Report</button></form>
  <form method ='post' action = "systemSupportUserManager.jsp"> <button class="tablinks">User Manager</button></form>
  <form method = 'post' action = "systemSupportResetPassword.jsp"> <button class="tablinks">Reset Users</button></form>
  <form method ='post'action = "../Login.jsp"><button class="tablinks" style ="float: right;">Logout</button></form>
</div>
<body>
	<%
	session.setAttribute("user", (LoginObject) session.getAttribute("user"));
	ArrayList<LoginObject> a = LoginObject.getUsers();
	
	int r = 0;
	int ad = 0;
	int s = 0;
	int l = 0;
	
	for (LoginObject x : a)
	{
		if (x.getActive() == 0)
		{
			l++;
		}
		
		if (x.getUserType() == 1)
		{
			ad++;
		}
		else if (x.getUserType() == 2)
		{
			s++;
		}
		else if (x.getUserType() == 3)
		{
			r++;
		}
	}
	%>
	
	<h1 style="text-align: center;"> System Support Dashboard</h1>
	<h3 style="text-align: center;"> Number of Regular Users: <%=r %></h3>
	<h3 style="text-align: center;"> Number of Admin Users: <%=ad %></h3>
	<h3 style="text-align: center;"> Number of Support Users: <%=s %></h3>
	<h3 style="text-align: center;"> Number of Locked Users: <%=l %></h3>
</body>
</html>