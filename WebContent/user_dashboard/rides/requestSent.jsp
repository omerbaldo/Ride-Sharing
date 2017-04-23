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
	  <form method ='post' action = "../carManagement.jsp"><button class="tablinks" >Cars</button></form>
	  <form method ='post' action = "../../Login.jsp"><button class="tablinks" style ="float: right;">Logout</button></form>
	</div>
	
	<link rel="stylesheet" type="text/css" href="../user.css">
	














<h1>Request Sent. Keep refreshing page for status of request</h1>







<%
session.setAttribute("user", (LoginObject) session.getAttribute("user"));
LoginObject x = (LoginObject) session.getAttribute("user");
session.setAttribute("ride_id", (Integer) session.getAttribute("ride_id"));

		
		
Integer requestID = (Integer) session.getAttribute("requestID");
		

//Keep checking that rideId to see if accepted becomes true. if it does go forward. if not print denied


if(rideObj.getStatus(requestID) == 1){
		//redirect;
	System.out.println("");
	response.sendRedirect(request.getContextPath() + "/user_dashboard/rides/rideOccuring.jsp");

}else if(rideObj.getStatus(requestID) == -1){

%>
<h3>Sorry, Ride has started and you haven't been chosen</h3>
<%
	}
%>


</body>
</html>