<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336Final.LoginObject"%>
<%@ page import="cs336Final.RiderObject"%>
<%@ page import="cs336Final.DriverObject"%>
<%@ page import="cs336Final.rideObj"%>
<%@ page import="cs336Final.rideObj.ride"%>
<%@ page import="java.util.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>User profile</title>

<div class="tab">
  <form method ='post' action = "userProfile.jsp"><button class="tablinks" id="selected">User Profile</button></form>
  <form method ='post' action = "userGiveRide.jsp"><button class="tablinks">Give a Ride</button></form>
  <form method ='post' action = "userFindRide.jsp"><button class="tablinks">Find a Ride</button></form>
  <form method ='post' action = "carManagement.jsp"><button class="tablinks" >Cars</button></form>
  <form method ='post' action = "userLeaderboard.jsp"><button class="tablinks">Leaderboard</button></form>
  <form method ='post' action = "../Login.jsp"><button class="tablinks" style ="float: right;">Logout</button></form>
</div>

<link rel="stylesheet" type="text/css" href="user.css">



</head>




<body>
<%
//Gets current user
session.setAttribute("user", (LoginObject) session.getAttribute("user"));
LoginObject x = (LoginObject) session.getAttribute("user");
RiderObject R = new RiderObject();
DriverObject D = new DriverObject();
%>
<!--  -->

	<h1> Stats </h1>
	
	</br></br> Username:  <% out.print(x.getUsername()); %>
		
	</br></br> Number of Taken rides:   <% out.print(R.amountOfRidesTaken(x)); %>
	
	</br></br> Number of Given rides: <% out.print(D.amountOfRidesGiven(x)); %>
	
	</br></br> Reward points: <% 
	
	if (R.amountOfRidesTaken(x)==0){
		out.print(D.amountOfRidesGiven(x));
	}else{
		out.print(D.amountOfRidesGiven(x)/R.amountOfRidesTaken(x)); 
	}
	
	
	%>
		<p>note: reward points determined by rides given / rides taken 
			Click here to figure out how much money we will give each driver at the end of the terms!</p>
			
	<form action = "ad_distibution.jsp"><button>Find out!!</button></form>
	<!-- If the user is another user have option to message user -->
	</br></br> <form action="messageUser.jsp" method ="post"><button> Message User! </button></form>




<h4>Your rides</h4>
<table>


  <tr>
    <th> Start Location </th>
    <th> End Location</th>
    <th> Start Time</th>
    <th> End Time </th>
    <th> Car </th>
    <th> Status </th>
    <th> Delete </th>
    <th> Accept Ride Requests </th>
  </tr>


<%
ArrayList<ride> rides = rideObj.findRidesOfUser(x.getUser_id());
for(ride r : rides){
%>
  <tr>

<td style="padding:0 15px 0 15px;" > <%= r.locations %></td>
		<td style="padding:0 15px 0 15px;"><%= r.locatione %> </td>
		<td style="padding:0 15px 0 15px;"><%= r.start %> </td>
		<td style="padding:0 15px 0 15px;"><%= r.end %> </td>
		<td style="padding:0 15px 0 15px;"><%= r.car %> </td>
		<%
			if(r.started.equals("0")){
		
		%>
				<td style="padding:0 15px 0 15px;">hasn't started </td>
		
		<%
			}
			if(r.started.equals("1")){
		
		%>
						<td style="padding:0 15px 0 15px;">ride started </td>
		
		<%
			}
		%>
		
		<td style="padding:0 15px 0 15px;">
		
			<form method = "post" action = "deleteRideINT.jsp">
				<input type = "hidden" name ="rideid" value = "<%=r.ride_id %>"/>
				<input type="submit" value="delete"> 
			</form> 
		
		
		
		<% if(r.started.equals("0")){
			
		%>
		</td>
				<td style="padding:0 15px 0 15px;">
		
			<form method = "post" action = "chooseINT.jsp">
				<input type = "hidden" name ="rideid" value = "<%=r.ride_id %>"/>
				<input type="submit" value="choose"> 
			</form> 
		
		</td>
		<% 
			}else{
		%>
		<td> already started, cant accept no more</td>
		
		
		<%
		} %>
		
</tr>

<%
}
%>

</table>









</body>
</html>