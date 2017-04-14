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
<title>Manage Users</title>
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

.table { display: table; } 
.table>* { display: table-row; }
.table>*>* { display: table-cell; }
</style>
</head>
<body>
<div class="tab">
  <form method ='post' action = "systemSupportDashboard.jsp"><button class="tablinks">Dashboard</button></form>
  <form method = 'post' action = "systemSupportAd.jsp"> <button class="tablinks">Ad Manager</button></form>
  <button class="tablinks"  id="selected">User Manager</button>
  <form method = 'post' action = "systemSupportResetPassword.jsp"> <button class="tablinks">Reset Users</button></form>
  <form method ='post' action = "Login.jsp"><button class="tablinks" style ="float: right;">Logout</button></form>
</div>
<h1> Active Users</h1>
<div class="table">
  <div class="tr">
    <span class= "th">Username</span>
    <span class= "th">Password</span>
  </div>
<%
ArrayList<String> a = loginClass.getUserNames();
ArrayList<String> b = loginClass.getUserPasswords();
ArrayList<LoginObject> c = LoginObject.getUsers();

session.setAttribute("user", (LoginObject) session.getAttribute("user"));

for ( int i =0; i < a.size(); i++)
{
	String btn = "";
	int reverse = 0;
	if (c.get(i).getActive() == 1)
		btn = "Lock";
	else
		btn = "Unlock";
	
	if (c.get(i).getActive() == 0)
		reverse = 1;
	else
		reverse = 0;
%>

<form class= "tr" method = "post" action = "lock.jsp">
	<span class ="td" style="padding:0 15px 0 15px;" > <%=a.get(i)%></span>
	<span class = "td" style="padding:0 15px 0 15px;"><%=b.get(i)%> </span>
	<span class = "td" style="padding:0 15px 0 15px;"><button class="btn red" type="submit"><span> <%=btn %> </span></button></span>
	<span class = "td"><input type = "hidden" name ="username" value = "<%=a.get(i)%>"/></span>
	<span class = "td" ><input type = "hidden" name ="reverse" value ="<%=reverse%>"/></span>
</form>

<%       
}
%>
</div>
</body>
</html>