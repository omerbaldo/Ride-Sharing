<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="cs336Final.LoginObject"%>
<%@ page import="cs336Final.rideObj"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

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
	background-color: #BBDEFB;
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

.table {
	border-collapse: collapse;
	width: 100%;
}

.th, .td {
	text-align: left;
	padding: 8px;
}

.tr:nth-child(even) {
	background-color: #f2f2f2
}

.th {
	background-color: #4CAF50;
	color: white;
}

h1 {
	font-family: 'Roboto', sans-serif
}

h2 {
	font-family: 'Roboto', sans-serif
}

.table {
	display: table;
}

.table>* {
	display: table-row;
}

.table>*>* {
	display: table-cell;
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
	<button id="selected" class="tablinks">Dashboard</button>
	<form method='post' action="adminCreateSupport.jsp">
		<button class="tablinks">Create Support</button>
	</form>
	<form method='post' action="Login.jsp">
		<button class="tablinks" style="float: right;">Logout</button>
	</form>
</div>
<body>
	<%
	session.setAttribute("user", (LoginObject) session.getAttribute("user"));%>

	<h2>Rides per Time Period</h2>
	<div class="tab2">
		<button class="tablinks" onclick="openCity(event, 'day')">Day</button>
		<button class="tablinks" onclick="openCity(event, 'week')">Week</button>
		<button class="tablinks" onclick="openCity(event, 'month')">Month</button>
		<button class="tablinks" onclick="openCity(event, 'semester')">Semester</button>
		<button class="tablinks" onclick="openCity(event, 'year')">Year</button>
		<button class="tablinks" onclick="openCity(event, 'timeOfDay')">Time
			of Day</button>
	</div>

	<div id="day" class="tabcontent">
		<h3>Total Rides by Day (Past Month)</h3>
		<div class = "table">
			<div class="tr">
	  			<span class="th">Count</span>
	  			<span class = "th">Day</span>
	  			<span class = "th">Month</span>
	  			<span class = "th">Year</span>
			</div>
			<%
				ResultSet a = rideObj.getCountByDay();
				while (a.next())
				{
			%>
			<div class="tr">
				<span class= "td"><%=a.getInt(1) %></span>
				<span class= "td"><%=a.getInt(2) %></span>
				<span class= "td"><%=a.getInt(3) %></span>
				<span class= "td"><%=a.getInt(4) %></span>
			</div>
			<%
				}
			%>
		</div>
	</div>

	<div id="week" class="tabcontent">
		<h3>Total Rides by Week 1 (5 Weeks)</h3>
		<div class = "table">
			<div class="tr">
	  			<span class="th">Rides</span>
	  			<span class = "th">Week</span>
	  			<span class = "th">Month</span>
	  			<span class = "th">Year</span>
			</div>
			<%
				ResultSet week1 = rideObj.getCountFirstWeekofMonth();
				while (week1.next())
				{
			%>
			<div class="tr">
				<span class= "td"><%=week1.getInt(1) %></span>
				<span class= "td">1</span>
				<span class= "td"><%=week1.getInt(2) %></span>
				<span class= "td"><%=week1.getInt(3) %></span>
			</div>
			<%
				}
			%>
		</div>
		
		<h3>Total Rides by Week 2 (5 Weeks)</h3>
		<div class = "table">
			<div class="tr">
	  			<span class="th">Rides</span>
	  			<span class = "th">Week</span>
	  			<span class = "th">Month</span>
	  			<span class = "th">Year</span>
			</div>
			<%
				ResultSet week2 = rideObj.getCountSecondWeekofMonth();
				while (week2.next())
				{
			%>
			<div class="tr">
				<span class= "td"><%=week2.getInt(1) %></span>
				<span class= "td">2</span>
				<span class= "td"><%=week2.getInt(2) %></span>
				<span class= "td"><%=week2.getInt(3) %></span>
			</div>
			<%
				}
			%>
		</div>
		
		<h3>Total Rides by Week 3 (5 Weeks)</h3>
		<div class = "table">
			<div class="tr">
	  			<span class="th">Rides</span>
	  			<span class = "th">Week</span>
	  			<span class = "th">Month</span>
	  			<span class = "th">Year</span>
			</div>
			<%
				ResultSet week3 = rideObj.getCountThirdWeekofMonth();
				while (week3.next())
				{
			%>
			<div class="tr">
				<span class= "td"><%=week3.getInt(1) %></span>
				<span class= "td">3</span>
				<span class= "td"><%=week3.getInt(2) %></span>
				<span class= "td"><%=week3.getInt(3) %></span>
			</div>
			<%
				}
			%>
		</div>
		
		<h3>Total Rides by Week 4 (5 Weeks)</h3>
		<div class = "table">
			<div class="tr">
	  			<span class="th">Rides</span>
	  			<span class = "th">Week</span>
	  			<span class = "th">Month</span>
	  			<span class = "th">Year</span>
			</div>
			<%
				ResultSet week4 = rideObj.getCountFourthWeekofMonth();
				while (week4.next())
				{
			%>
			<div class="tr">
				<span class= "td"><%=week4.getInt(1) %></span>
				<span class= "td">4</span>
				<span class= "td"><%=week4.getInt(2) %></span>
				<span class= "td"><%=week4.getInt(3) %></span>
			</div>
			<%
				}
			%>
		</div>
	</div>

	<div id="month" class="tabcontent">
		<h3>Total Rides by Month (12 Months)</h3>
		<div class = "table">
			<div class="tr">
	  			<span class="th">Rides</span>
	  			<span class = "th">Month</span>
	  			<span class = "th">Year</span>
			</div>
			<%
				ResultSet y = rideObj.getCountByMonth();
				while (y.next())
				{
			%>
			<div class="tr">
				<span class= "td"><%=y.getInt(1) %></span>
				<span class= "td"><%=y.getInt(2) %></span>
				<span class= "td"><%=y.getInt(3) %></span>
			</div>
			<%
				}
			%>
		</div>
	</div>

	<div id="semester" class="tabcontent">
		<h3>Total Rides by Semester (10 Semesters)</h3>
		<p>Tokyo is the capital of Japan.</p>
	</div>

	<div id="year" class="tabcontent">
		<h3> Total Rides by Year (5 Years)</h3>
		<div class = "table">
			<div class="tr">
	  			<span class="th">Rides</span>
	  			<span class = "th">Year</span>
			</div>
			<%
				ResultSet x = rideObj.getCountByYear();
				while (x.next())
				{
			%>
			<div class="tr">
				<span class= "td"><%=x.getInt(1) %></span>
				<span class= "td"><%=x.getInt(2) %></span>
			</div>
			<%
				}
			%>
		</div>
	</div>

	<div id="timeOfDay" class="tabcontent">
		<h3>Total Rides by Time of Day (Monthly Avg)</h3>
		<p>Tokyo is the capital of Japan.</p>
	</div>


	<h2>Total Rides by User</h2>

	<h2>Total Rides per Location</h2>
	<div class="tab2">
		<button class="tablinks" onclick="openCity(event, 'origin')">Origin</button>
		<button class="tablinks" onclick="openCity(event, 'destination')">Destination</button>
	</div>

	<div id="origin" class="tabcontent">
		<h3>Origin</h3>
		<div class = "table">
			<div class="tr">
	  			<span class="th">Count</span>
	  			<span class = "th">Origin</span>
			</div>
			<%
				ResultSet origin = rideObj.getCountByOrigin();
				while (origin.next())
				{
			%>
			<div class="tr">
				<span class= "td"><%=origin.getInt(1) %></span>
				<span class= "td"><%=origin.getString(2) %></span>
			</div>
			<%
				}
			%>
		</div>
	</div>

	<div id="destination" class="tabcontent">
		<h3>Destination</h3>
		<div class = "table">
			<div class="tr">
	  			<span class="th">Count</span>
	  			<span class = "th">Destination</span>
			</div>
			<%
				ResultSet dest = rideObj.getCountByDestination();
				while (dest.next())
				{
			%>
			<div class="tr">
				<span class= "td"><%=dest.getInt(1) %></span>
				<span class= "td"><%=dest.getString(2) %></span>
			</div>
			<%
				}
			%>
		</div>
	</div>


</body>
</html>