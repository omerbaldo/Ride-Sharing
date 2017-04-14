<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="cs336Final.LoginObject"%>
    <%@ page import="java.util.*"%>
    <%@ page import="cs336Final.rideObj"%>
    <%@ page import="cs336Final.rideObj.ride"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Request Sent</title>
</head>
<body>


	<div class="tab">
	  <button class="tablinks">User Profile</button>
	  <form method ='post' action = "../userGiveRide.jsp"><button class="tablinks">Give a Ride</button></form>
	    <button class="tablinks"  id="selected" >Find a ride </button>
	  <form method ='post' action = "../userCalendar.jsp"><button class="tablinks" >Calendar</button></form>
	  <form method ='post' action = "../carManagement.jsp"><button class="tablinks" >Cars</button></form>
	  <form method ='post' action = "../../Login.jsp"><button class="tablinks" style ="float: right;">Logout</button></form>
	</div>
	
	<link rel="stylesheet" type="text/css" href="../user.css">
	














<h1>Request Sent. Waiting for an acceptance</h1>



<style>
.loader {
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  width: 120px;
  height: 120px;
  -webkit-animation: spin 2s linear infinite;
  animation: spin 2s linear infinite;
}

@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>

<div class="loader"></div>






<%
//Login
	session.setAttribute("user", (LoginObject) session.getAttribute("user"));
	LoginObject x = (LoginObject) session.getAttribute("user");

//Add to ride offering table
	String ride_id = request.getParameter("rid");
	int requestID = rideObj.makeRideRequest(ride_id, x.getUser_id());
	System.out.println("request id is " + requestID);
	


//Keep checking that rideId to see if accepted becomes true. if it does go forward. if not print denied

%>




</body>
</html>