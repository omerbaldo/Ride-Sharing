<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336Final.loginClass"%>
<%@ page import="cs336Final.LoginObject"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="stylesheet" type="text/css" href="user.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reset Users</title>
<style>
.table {
    border-collapse: collapse;
    width: 100%;
}

.th, .td {
    text-align: left;
    padding: 8px;
}

.tr:nth-child(even){background-color: #f2f2f2}

.th {
    background-color: #4CAF50;
    color: white;
}

	h1
	{
		font-family :'Roboto', sans-serif
	}


.table { display: table; } 
.table>* { display: table-row; }
.table>*>* { display: table-cell; }
</style>
</head>
<body>
<div class="tab">
  <form method ='post' action = "systemSupportDashboard.jsp"><button class="tablinks">Dashboard</button></form>
  <form method = 'post' action = "systemSupportAd.jsp"> <button class="tablinks">Ad Manager</button></form>
  <form method ='post' action = "systemSupportReport.jsp"> <button class="tablinks">Ad Report</button></form>
  <form method = 'post' action = "systemSupportUserManager.jsp"> <button class="tablinks">User Manager</button></form>
  <button class="tablinks"  id="selected">Reset Users</button>
  <form method ='post' action = "../Login.jsp"><button class="tablinks" style ="float: right;">Logout</button></form>
</div>
<h1> Active Users</h1>
<div class="table">
  <div class="tr">
    <span class= "th">Username</span>
    <span class= "th">Password</span>
  </div>
<%

ArrayList<LoginObject> c = LoginObject.getUsers();



session.setAttribute("user", (LoginObject) session.getAttribute("user"));

for (LoginObject x: c)
{
%>

<form class= "tr" method = "post" action = "reset.jsp">
	<span class ="td" style="padding:0 15px 0 15px;" > <%=x.getUsername()%></span>
	<span class = "td" style="padding:0 15px 0 15px;"><%=x.getPassword()%> </span>
	<span class = "td" style="padding:0 15px 0 15px;"><button class="btn red" type="submit"><span>Reset Password </span></button></span>
	<span class = "td"><input type = "hidden" name ="username" value = "<%=x.getUsername()%>"/></span>
</form>

<%       
}
%>
</div>
</body>
</html>