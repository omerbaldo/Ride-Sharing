<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336Final.LoginObject"%>
<%@ page import="cs336Final.registrationClass"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="admin.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Dashboard</title>
</head>
<div class="tab">
  <form method ='post' action = "adminDashboard.jsp"><button class="tablinks">Dashboard</button></form>
  <button id= "selected" class="tablinks">Create Support</button>
  <form method ='post' action = "Login.jsp"><button class="tablinks" style ="float: right;">Logout</button></form>
</div>
<body>
	<%
	session.setAttribute("user", (LoginObject) session.getAttribute("user"));
	
	
	String user = request.getParameter("username");
	String pass = request.getParameter("password");
	String add = request.getParameter("address");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	boolean res = false;
	
	if (user !=null)
	{
		res = registrationClass.registerSupport(user,pass, email, phone, add);
	}
	
	%>
	<h2> Create Support Staff Account</h2>
	<br>
		<form method="post" action="adminCreateSupport.jsp">
		<table>
		<tr>    
		<td>Username</td><td><input type="text" name="username"></td>
		</tr>
		<tr>
		<td>Rutgers Email</td><td><input type="text" name="email"></td>
		</tr>
		<tr>
		<td>Address</td><td><input type="text" name="address"></td>
		</tr>
		<tr>
		<td>Phone</td><td><input type="text" name="phone"></td>
		</tr>
		<tr>
		<td>Password</td><td><input type="text" name="password"></td>
		</tr>
		</table>
		<br>
			<input type="submit" value="Register">
		</form>
	<br>
	<%
	if (user !=null)
	{
		if (res)
			out.print("<h2>Support Staff Created<h2>");
		else
			out.print("<h2>Register Failed. Possibly a duplicate user<h2>");
		}
	%>
	
</body>
</html>