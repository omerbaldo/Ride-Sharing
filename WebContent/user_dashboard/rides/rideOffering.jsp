<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="cs336Final.rideObj"%>
    <%@ page import="cs336Final.rideObj.ride"%>
    <%@ page import="cs336Final.carObj.car"%>
    <%@ page import="cs336Final.carObj"%>
    
    <%@ page import="cs336Final.LoginObject"%>
    
    <%@ page import="java.util.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Look at rides</title>
</head>
<body>

<div class="tab">
  <button class="tablinks">User Profile</button>
  <form method ='post' action = "../userGiveRide.jsp"><button class="tablinks">Give a Ride</button></form>
    <button class="tablinks"  id="selected" >Find a ride </button>
  <form method ='post' action = "../carManagement.jsp"><button class="tablinks" >Cars</button></form>
  <form method ='post' action = "../../Login.jsp"><button class="tablinks" style ="float: right;">Logout</button></form>
  <form method ='post' action = "../userLeaderboard.jsp"><button class="tablinks">Leaderboard</button></form>
  <form method ='post' action = "../messageUser.jsp"><button class="tablinks">Message User</button></form>

</div>

<link rel="stylesheet" type="text/css" href="../user.css">


<%
session.setAttribute("user", (LoginObject) session.getAttribute("user"));
LoginObject x = (LoginObject) session.getAttribute("user");
String pickup = request.getParameter("pickup");
String dest = request.getParameter("dest");
String startTime = request.getParameter("startTime");
ArrayList<ride> arrayrides = rideObj.findRides(pickup, dest, startTime);


/* Matching locations
SELECT *
FROM app.Ride
Where locationStart = busch and locationEnd = busch
*/
/*
From the result set create ride objects and find the one which time is after 
*/


if (arrayrides.size() == 0){
%>
	<h1> No Rides found</h1>
	
<% }else{ %>
	
	<h3>Results: Choose a ride to request: </h3>
	<p>To message the driver click message and know their id</p>
	<table>
	  <tr>
	    <th>Lincense</th>
	    <th>Make</th>
	    <th>Model</th>
	    <th>Driver</th>
	    <th>Driver ID</th>
	    <th>Start Time</th>
	    
	  </tr>

<%
System.out.println("starting");

for ( int i =0; i < arrayrides.size(); i++){

	ride r = arrayrides.get(i);
	System.out.println(r.car.trim());	
	
	car c = carObj.getCar(r.car);
	
%>


	<tr>
	    <td style="padding:0 15px 0 15px;" > <%= c.Lincense %></td>
		<td style="padding:0 15px 0 15px;" > <%= c.Make %></td>
		<td style="padding:0 15px 0 15px;" > <%= c.Model %></td>
		<td style="padding:0 15px 0 15px;" > <%= LoginObject.getUserName(c.user_id) %> 		</td>
		<td style="padding:0 15px 0 15px;" >  
		
			<form method ='post' action = "../messageUser.jsp"><button class="tablinks">Message User </button>
		
			<input type = "hidden" name ="To_ID" value = "<%=c.user_id%>"/>
		
		
			</form>
			
		</td>
		<td style="padding:0 15px 0 15px;" > <%=r.start %></td>

		
		<td style="padding:0 15px 0 15px;">
		
				<form action = "resquestSentINT.jsp">
								<input type = "hidden" name ="rid" value = "<%=r.ride_id%>"/>
								<button class="btn red" type="submit"> Request </button>
				</form>	
		</td>
		
	</tr>
	</br>



<%
}
}
%>








</table>










</body>
</html>