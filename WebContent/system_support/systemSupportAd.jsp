<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336Final.LoginObject"%>
<%@ page import="cs336Final.loginClass"%>
<%@ page import="cs336Final.AdObj"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="user.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Dashboard</title>
</head>
<div class="tab">
  <form method = "post" action = "systemSupportDashboard.jsp"><button class="tablinks">Dashboard</button></form>
  <button class="tablinks" id = "selected">Ad Manager</button>
  <form method ='post' action = "systemSupportUserManager.jsp"> <button class="tablinks">User Manager</button></form>
  <form method ='post' action = "Login.jsp"><button class="tablinks" style ="float: right;">Logout</button></form>
</div>
<body>
	<%
	session.setAttribute("user", (LoginObject) session.getAttribute("user"));%>
	
	<form method="post" action="LoginSuccess.jsp">
		<br><br>
  		<div class="group">
    		<input type="text" name="Ad Title"><span class="highlight"></span><span class="bar"></span>
    		<label>Ad Title</label>
  		</div>
		<br><br>
  		<button type="submit" class="button buttonBlue">Create Ad
    		<div class="ripples buttonRipples"><span class="ripplesCircle"></span></div>
 		</button>
	</form>
	
	<h1> Active Ad List</h1>
<form method = "post" action= "lock.jsp">
<table>
<%
ArrayList<AdObj> a = AdObj.getAdList();

for (AdObj x: a)
{
		
%>

<tr>
<td style="padding:0 15px 0 15px;" > <%=x.getTitle()%></td>
<td style="padding:0 15px 0 15px;"><%=x.getSeen()%> </td>
<td style="padding:0 15px 0 15px;"><button class="btn red" type="submit"><span>Delete</span></button></td>
<td><input type = "hidden" name ="username" value = "<%=x.getId()%>"/></td>
</tr>

<%       
}
%>
</table>
</form>

</body>
</html>