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
  <form method ='post' action = "userCalendar.jsp"><button class="tablinks" >Calendar</button></form>
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

<h3>Step One: Fill Information</h3>

<div class="dropdown">
  <button class="dropbtn">Pickup location </button>
  <div class="dropdown-content">
    <a href="#">Livingston</a>
    <a href="#">College Ave</a>
    <a href="#">Cook</a>
  </div>
</div>


<div class="dropdown">
  <button class="dropbtn">Destination </button>
  <div class="dropdown-content">
    <a href="#">Livingston</a>
    <a href="#">College Ave</a>
    <a href="#">Cook</a>
  </div>
</div>


<div class="dropdown">
  <button class="dropbtn">Start Time </button>
  <div class="dropdown-content">
      <a href="#">6:00am</a>
      <a href="#">7:00am</a>
      <a href="#">8:00am</a>
      <a href="#">9:00am</a>
      <a href="#">10:00am</a>
       <a href="#">3:00pm</a>
  </div>
</div>

<div class="dropdown">
  <button class="dropbtn">End Time </button>
  <div class="dropdown-content">
      <a href="#">6:00am</a>
      <a href="#">7:00am</a>
      <a href="#">8:00am</a>
      <a href="#">9:00am</a>
      <a href="#">10:00am</a>
       <a href="#">3:00pm</a>
  </div>
</div>

</br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br>





<h3>Step Two: Find Rides </h3>

<p>Pick up: Destination:  Starttime:    Endtime:  </p>

<button> Search For The Ride ! </button>

</br></br>

<h4>Results: </h4>
<div class="scroll">

<table>
  <tr>
    <th>Origin</th>
    <th>Destination</th>
    <th>Host</th>
    <th>Time</th>
    <th>Select Ride</th>
  </tr>
  <tr>
    <th>College Ave</th>
    <th>Cook </th>
    <th>Deep </th>
    <th>9:00 Am </th>
    <th><button> Select</button></th>
  </tr>
  
</table>


 </div>



</body>
</html>