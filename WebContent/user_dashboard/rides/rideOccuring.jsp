<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="cs336Final.LoginObject"%>
        <%@ page import="cs336Final.AdObj"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ride is occuring</title>
</head>
<body>

<div class="tab">
  	<form method ='post' action = "../userProfile.jsp"><button class="tablinks">User Profile</button></form>
  	<button class="tablinks" id="selected">Give a Ride</button>
	<form method ='post' action = "../userFindRide.jsp"><button class="tablinks">Find a Ride</button></form>
	  <form method ='post' action = "../carManagement.jsp" id="selected"><button class="tablinks" >Cars</button></form>
  <form method ='post' action = "../userLeaderboard.jsp"><button class="tablinks">Leaderboard</button></form>
  <form method ='post' action = "../messageUser.jsp"><button class="tablinks">Message User</button></form>

	<form method ='post' action = "../../Login.jsp"><button class="tablinks" style ="float: right;">Logout</button></form>
</div>

<link rel="stylesheet" type="text/css" href="../user.css">
<link rel="stylesheet" type="text/css" href="../dropdown.css">
<link rel="stylesheet" type="text/css" href="../overflow.css">


<%

session.setAttribute("user", (LoginObject) session.getAttribute("user"));
session.setAttribute("ride_id", (Integer) session.getAttribute("ride_id"));
System.out.println("yo omer ride_id is " +(Integer) session.getAttribute("ride_id"));

%>


<h2>The ride is currently occuring. Here is an advertisement. </h2>

<h1><% out.println(AdObj.getRandomAd()); %></h1>

<form method = "post" action = "../../ratingpage.jsp">
<input type="submit" value = "Click Here To End The Ride">

<!-- Here redirect to an intermediate page where you will
	 change the ride to completed and redirect to rating.
	 need ride id 
  -->
</form>


</body>
</html>