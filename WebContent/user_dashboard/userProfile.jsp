<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336Final.LoginObject"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>User profile</title>

<div class="tab">
  <button class="tablinks" id="selected">User Profile</button>
  <form method ='post' action = "userGiveRide.jsp"><button class="tablinks">Give a Ride</button></form>
  <form method ='post' action = "userFindRide.jsp"><button class="tablinks">Find a Ride</button></form>
  <form method ='post' action = "userCalendar.jsp"><button class="tablinks" >Calendar</button></form>
  <form method ='post' action = "../Login.jsp"><button class="tablinks" style ="float: right;">Logout</button></form>
</div>

<link rel="stylesheet" type="text/css" href="user.css">



</head>




<body>
<%
session.setAttribute("user", (LoginObject) session.getAttribute("user"));
LoginObject x = (LoginObject) session.getAttribute("user");
%>
<!--  -->

	<h1> Stats </h1>
	
	</br></br> Username :  <% out.print(x.getUsername()); %>
		
	</br></br> Number of completed rides
	
	</br></br> Number of taken rides
	
	</br></br> Reward points
	
	</br></br> Leaderboard Rank

	<!-- If the user is another user have option to message user -->
	</br></br> <button> Message User! </button>

</body>
</html>