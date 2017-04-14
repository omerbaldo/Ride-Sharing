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
	h2
	{
		font-family :'Roboto', sans-serif
	}

.table { display: table; } 
.table>* { display: table-row; }
.table>*>* { display: table-cell; }
</style>
</head>
<div class="tab">
  <form method = "post" action = "systemSupportDashboard.jsp"><button class="tablinks">Dashboard</button></form>
  <button class="tablinks" id = "selected">Ad Manager</button>
  <form method ='post' action = "systemSupportUserManager.jsp"> <button class="tablinks">User Manager</button></form>
  <form method = 'post' action = "systemSupportResetPassword.jsp"> <button class="tablinks">Reset Users</button></form>
  <form method ='post' action = "../Login.jsp"><button class="tablinks" style ="float: right;">Logout</button></form>
</div>
<body>
	<%
	session.setAttribute("user", (LoginObject) session.getAttribute("user"));%>
	
	<form class = "table" method="post" action="addAd.jsp">
		<br><br>
  		<div class="tr">
  			<span class="td"><h2 style="text-align:right;">Ad Title</h2></span>
    		<span class="td"><input type="text" name="adTitle"><span class="highlight"></span><span class="bar"></span></span>
    	 	<span class="td"><button  type="submit" class="btn blue">
    			<span>Create Ad</span>
 			</button></span>
  		</div>
		<br><br>
	</form>
	
	<h1> Active Ad List</h1>
<div class = "table">
	<div class="tr">
	  <span class="th">Ad Title</span>
	  <span class = "th">Times Seen</span>
	</div>
<%
ArrayList<AdObj> a = AdObj.getAdList();

for (AdObj x: a)
{
		
%>
	<form class = "tr" method = "post" action = "deleteAd.jsp">
		<span class="td" style="padding:0 15px 0 15px;" > <%=x.getTitle()%></span>
		<span class="td" style="padding:0 15px 0 15px;"><%=x.getSeen()%> </span>
		<span class = "td" style="padding:0 15px 0 15px;"><button class="btn red" type="submit"><span>Delete</span></button></span>
		<span class = "td"><input type = "hidden" name ="delId" value = "<%=x.getId()%>"/></span>
	</form>

<%       
}
%>
</div>
</body>
</html>