<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<div class="tab">
  <button class="tablinks">User Profile</button>
  <button class="tablinks">Give a Ride</button>
  <button class="tablinks"  id="selected">Find a Ride</button>
  <button class="tablinks" style ="float: right;">Logout</button>
</div>

<link rel="stylesheet" type="text/css" href="user.css">
<link rel="stylesheet" type="text/css" href="dropdown.css">







</head>
<body>

<h2>Hover to choose a: </h2>

<h3>Location</h3>
<div class="dropdown">
  <button class="dropbtn">Pickup location </button>
  <div class="dropdown-content">
    <a href="#">Livingston</a>
    <a href="#">College Ave</a>
    <a href="#">Cook</a>
  </div>
</div>


<h3>Destination</h3>
<div class="dropdown">
  <button class="dropbtn"></button>
  <div class="dropdown-content">
    <a href="#">Livingston</a>
    <a href="#">College Ave</a>
    <a href="#">Cook</a>
  </div>
</div>





</body>
</html>