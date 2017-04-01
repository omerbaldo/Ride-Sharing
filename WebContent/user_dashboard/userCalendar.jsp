<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336Final.LoginObject"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<div class="tab">
  <form method ='post' action = "userProfile.jsp"><button class="tablinks" onclick="userProfile.jsp" >User Profile</button></form>
  <form method ='post' action = "userGiveRide.jsp"><button class="tablinks">Give a Ride</button></form>
  <form method ='post' action = "userFindRide"><button class="tablinks" >Find a Ride</button></form>
  <button class="tablinks" id="selected" >Calendar</button>
  <button class="tablinks" style ="float: right;">Logout</button>
</div>


<link rel="stylesheet" type="text/css" href="user.css">
<link rel="stylesheet" type="text/css" href="dropdown.css">
<link rel="stylesheet" type="text/css" href="overflow.css">





</head>
<body>
<%
session.setAttribute("user", (LoginObject) session.getAttribute("user"));
%>


<h3>Click on a date to see all regularly scheduled rides </h3>

</body>
</html>