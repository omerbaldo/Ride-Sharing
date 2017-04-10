<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336Final.loginClass"%>
<%@ page import="cs336Final.LoginObject"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="stylesheet" type="text/css" href="admin.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Users</title>
</head>
<body>
<div class="tab">
  <form method ='post' action = "adminDashboard.jsp"><button class="tablinks">Dashboard</button></form>
  <button class="tablinks">Ad Manager</button>
  <button class="tablinks"  id="selected">User Manager</button>
  <form method ='post' action = "Login.jsp"><button class="tablinks" style ="float: right;">Logout</button></form>
</div>
<h1> Active Users</h1>
<form method = "post" action= "lock.jsp">
<table>
<%
ArrayList<String> a = loginClass.getUserNames();
ArrayList<String> b = loginClass.getUserPasswords();

session.setAttribute("user", (LoginObject) session.getAttribute("user"));

for ( int i =0; i < a.size(); i++)
{
%>

<tr>
<td style="padding:0 15px 0 15px;" > <%=a.get(i)%></td>
<td style="padding:0 15px 0 15px;"><%=b.get(i)%> </td>
<td style="padding:0 15px 0 15px;"><button class="btn red" type="submit"><span> Lock </span></button></td>
<td><input type = "hidden" name ="username" value = "<%=a.get(i)%>"/></td>
<td><input type = "hidden" name ="password" value ="<%=b.get(i)%>"/></td>
</tr>

<%       
}
%>
</table>
</form>
</body>
</html>