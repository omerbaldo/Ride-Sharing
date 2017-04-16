<%@ page
language="java" 
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" 
import="java.sql.DriverManager,
java.sql.Connection, 
cs336Final.LoginObject,
java.sql.PreparedStatement, 
java.sql.ResultSet, 
java.sql.SQLException,
java.util.*,
cs336Final.rideObj
"
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Give a Rating</title>
</head>
<body>


<div class="tab">
  	<form method ='post' action = "user_dashboard/userProfile.jsp"><button class="tablinks">User Profile</button></form>
  	<button class="tablinks" id="selected">Give a Ride</button>
	<form method ='post' action = "user_dashboard/userFindRide.jsp"><button class="tablinks">Find a Ride</button></form>
	<form method ='post' action = "user_dashboard/userCalendar.jsp"><button class="tablinks" >Calendar</button></form>
	  <form method ='post' action = "user_dashboard/carManagement.jsp" id="selected"><button class="tablinks" >Cars</button></form>
	<form method ='post' action = "../Login.jsp"><button class="tablinks" style ="float: right;">Logout</button></form>
</div>

<link rel="stylesheet" type="text/css" href="user_dashboard/user.css">
<link rel="stylesheet" type="text/css" href="user_dashboard/dropdown.css">
<link rel="stylesheet" type="text/css" href="user_dashboard/overflow.css">












<%
session.setAttribute("user", (LoginObject) session.getAttribute("user"));
LoginObject x = (LoginObject) session.getAttribute("user");
String option = request.getParameter("number");
int giver = x.getUser_id();								//this is the driver 

//session.setAttribute("ride_id", (Integer) session.getAttribute("ride_id"));
Integer rideID = (Integer) session.getAttribute("ride_id");
session.setAttribute("ride_id", (Integer) session.getAttribute("ride_id"));

System.out.println("Omer: ride id is " + rideID);

//check if you are the driver:

if(rideObj.isDriver(giver,rideID) == true){
	System.out.println("you are the driver");	
%>	

<h2>Thanks for driving  ! Please rate all of your passengers</h2>

<%
//take rid and go through ride requests looking for each person who was accepted 
System.out.println("going through ids of riders");
ArrayList<Integer> idsOfRiders = rideObj.getIDSFromRideRequesters(rideID);
session.setAttribute("idsOfRiders", idsOfRiders);
%>


		
<form method = "post" action = "ratingAddRidersINT.jsp">
		
<% 		
for (Integer in : idsOfRiders){
%>

		<h3>Rating for <% out.println(LoginObject.getUserName(in)); %> </h3>
			<p><input type="radio" name=<%="star"+in%>  value="5"> 5 : Awesome!</p>
			<p><input type="radio" name=<%="star"+in%>  value="4"> 4 : Good! </p>
			<p><input type="radio" name=<%="star"+in%>  value="3"> 3 : Average! </p>
			<p><input type="radio" name=<%="star"+in%>  value="2"> 2 : Could have been better! </p>
			<p><input type="radio" name=<%="star"+in%>  value="1"> 1 : Mediocre! </p>
		<br>
		Comments (Optional) <br>
		<textarea name=<%="comment"+in%> cols="40" rows="5"></textarea>
		<br>
		<br>
	<br>
		
<%
	}
%>
		<input type="submit" value="Submit">

</form>
<%
} else{//get driver and do rating for him.
%>
<form method = "post" action = "ratingAddDriverINT.jsp">


	
		<h3>Rating for The Driver  </h3>
			<p><input type="radio" name=<%="star"%>  value="5"> 5 : Awesome!</p>
			<p><input type="radio" name=<%="star"%>  value="4"> 4 : Good! </p>
			<p><input type="radio" name=<%="star"%>  value="3"> 3 : Average! </p>
			<p><input type="radio" name=<%="star"%>  value="2"> 2 : Could have been better! </p>
			<p><input type="radio" name=<%="star"%>  value="1"> 1 : Mediocre! </p>
		<br>
		Comments (Optional) <br>
		<textarea name=<%="comment"%> cols="40" rows="5"></textarea>
		<br>
		<br>
	<br>



		<input type="submit" value="Submit">

</form>







<%

}

%>


</body>
</html>