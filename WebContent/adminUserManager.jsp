<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336Final.admin"%>
<%@ page import="cs336Final.LoginObject"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="stylesheet" type="text/css" href="admin.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Users</title>
</head>
<div class="tab">
  <button class="tablinks">Dashboard</button>
  <button class="tablinks">Ad Manager</button>
  <button class="tablinks"  id="selected">User Manager</button>
  <button class="tablinks" style ="float: right;">Logout</button>
</div>
<body>
<h1> Active Users</h1>
<table>
<%
ArrayList<String> a = admin.getUserNames();
ArrayList<String> b = admin.getUserPasswords();

session.setAttribute("user", (LoginObject) session.getAttribute("user"));

for ( int i =0; i < admin.getUserNames().size() ; i++)
{
%>

<tr>
<td style="padding:0 15px 0 15px;"> <%=a.get(i)%></td>
<td style="padding:0 15px 0 15px;"><%=b.get(i)%> </td>
<td style="padding:0 15px 0 15px;"><button class="btn red" type="button"><span> Reset Password </span></button></td>
<td style="padding:0 15px 0 15px;"><button class="btn red" type="button"><span> Lock </span></button></td>
</tr>

<%       
}
%>

</table>
</body>
</html>