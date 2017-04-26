<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336Final.LoginObject"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<div class="tab">
  <form method ='post' action = "userProfile.jsp"><button class="tablinks">User Profile</button></form>
  <form method ='post' action = "userGiveRide.jsp">  <button class="tablinks">Give a Ride</button></form>
  <button class="tablinks"  id="selected">Find a Ride</button>
  <form method ='post' action = "carManagement.jsp"><button class="tablinks" >Cars</button></form>
  <form method ='post' action = "userLeaderboard.jsp"><button class="tablinks">Leaderboard</button></form>
  <form method ='post' action = "messageUser.jsp"><button class="tablinks">Message User</button></form>

  <form method ='post' action = "../Login.jsp"><button class="tablinks" style ="float: right;">Logout</button></form>
</div>

<link rel="stylesheet" type="text/css" href="user.css">
<link rel="stylesheet" type="text/css" href="dropdown.css">
<link rel="stylesheet" type="text/css" href="overflow.css">

</head>
<body>


<%
session.setAttribute("user", (LoginObject) session.getAttribute("user"));
LoginObject x = (LoginObject) session.getAttribute("user");
%>


<form action = "rides/rideOffering.jsp">
	 Pickup 
	 <select name="pickup">
	    <option value="busch">Busch</option>
	    <option value="collegeave">College Ave</option>
	    <option value="livi">Livingston</option>
	    <option value="cook">Cook</option>
	  </select>
	  
     Destination 
	 <select name="dest">
	    <option value="busch">Busch</option>
	    <option value="collegeave">College Ave</option>
	    <option value="livi">Livingston</option>
	    <option value="cook">Cook</option>
	  </select>
  
	Show All Rides After
	<input type="datetime-local" name="startTime">
	
	
	
	
	
	  
	  <button> Search </button>

</form>




<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<script type='text/javascript'>
console.log("hey");
$(document).ready(function(){
	var d = new Date();	//utc time zone. 4 hrs ahead
	d.setUTCHours(d.getUTCHours() - 4); //ESTRN TIME
	d.setSeconds(0);

    $('input[type=datetime-local]').val(d.toJSON().slice(0,19));
});

</script>




























</body>
</html>