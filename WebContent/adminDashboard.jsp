<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336Final.LoginObject"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="admin.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Dashboard</title>
	<style>
	
	/* Style the tab */
	div.tab2 {
	    overflow: hidden;
	    border: 1px solid #ccc;
	    background-color: #BBDEFB;
	    width: 600px;
	}
	
	/* Style the buttons inside the tab */
	div.tab2 button {
	    background-color:  #BBDEFB;
	    float: left;
	    border: none;
	    outline: none;
	    cursor: pointer;
	    padding: 14px 16px;
	    transition: 0.3s;
	}
	
	/* Change background color of buttons on hover */
	div.tab2 button:hover {
	    background-color: #90CAF9;
	}
	
	/* Create an active/current tablink class */
	div.tab2 button.active {
	    background-color: #64B5F6;
	}
	
	/* Style the tab content */
	.tabcontent {
	    display: none;
	    padding: 6px 12px;
	    border: 1px solid #ccc;
	    border-top: none;
	    width: 600px;
	}
	
	</style>
	<script>
	function openCity(evt, cityName) {
	    // Declare all variables
	    var i, tabcontent, tablinks;

	    // Get all elements with class="tabcontent" and hide them
	    tabcontent = document.getElementsByClassName("tabcontent");
	    for (i = 0; i < tabcontent.length; i++) {
	        tabcontent[i].style.display = "none";
	    }

	    // Get all elements with class="tablinks" and remove the class "active"
	    tablinks = document.getElementsByClassName("tablinks");
	    for (i = 0; i < tablinks.length; i++) {
	        tablinks[i].className = tablinks[i].className.replace(" active", "");
	    }

	    // Show the current tab, and add an "active" class to the button that opened the tab
	    document.getElementById(cityName).style.display = "block";
	    evt.currentTarget.className += " active";
	}
	</script>
</head>
<div class="tab">
  <button id= "selected" class="tablinks">Dashboard</button>
  <form method ='post' action = "adminCreateSupport.jsp"><button class="tablinks">Create Support</button></form>
  <form method ='post' action = "Login.jsp"><button class="tablinks" style ="float: right;">Logout</button></form>
</div>
<body>
	<%
	session.setAttribute("user", (LoginObject) session.getAttribute("user"));%>
	
<h2> Rides per Time Period </h2>
<div class="tab2">
  <button class="tablinks" onclick="openCity(event, 'day')">Day</button>
  <button class="tablinks" onclick="openCity(event, 'week')">Week</button>
  <button class="tablinks" onclick="openCity(event, 'month')">Month</button>
  <button class="tablinks" onclick="openCity(event, 'semester')">Semester</button>
    <button class="tablinks" onclick="openCity(event, 'year')">Year</button>
  <button class="tablinks" onclick="openCity(event, 'timeOfDay')">Time of Day</button>
</div>

<div id="day" class="tabcontent">
  <h3>Total Rides by Day (10 Days)</h3>
  <p>London is the capital city of England.</p>
</div>

<div id="week" class="tabcontent">
  <h3>Total Rides by Week (10 Weeks)</h3>
  <p>Paris is the capital of France.</p> 
</div>

<div id="month" class="tabcontent">
  <h3>Total Rides by Month (10 Months)</h3>
  <p>Tokyo is the capital of Japan.</p>
</div>

<div id="semester" class="tabcontent">
  <h3>Total Rides by Semester (10 Semesters)</h3>
  <p>Tokyo is the capital of Japan.</p>
</div>

<div id="year" class="tabcontent">
  <h3>Total Rides by Year (5 Years)</h3>
  <p>Tokyo is the capital of Japan.</p>
</div>

<div id="timeOfDay" class="tabcontent">
  <h3>Total Rides by Time of Day (Monthly Avg)</h3>
  <p>Tokyo is the capital of Japan.</p>
</div>


<h2> Total Rides by User </h2>

<h2> Total Rides per Location</h2>
<div class="tab2">
  <button class="tablinks" onclick="openCity(event, 'origin')">Origin</button>
  <button class="tablinks" onclick="openCity(event, 'destination')">Destination</button>
</div>

<div id="origin" class="tabcontent">
  <h3>Origin</h3>
  <p>London is the capital city of England.</p>
</div>

<div id="destination" class="tabcontent">
  <h3>Destination</h3>
  <p>Paris is the capital of France.</p> 
</div>
	

</body>
</html>