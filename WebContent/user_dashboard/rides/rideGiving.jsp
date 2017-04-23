<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ page import="cs336Final.LoginObject"%>
    <%@ page import="cs336Final.rideObj"%>
    <%@ page import="cs336Final.RiderObject"%>
        <%@ page import="cs336Final.rideObj.rideOffer"%>
    
        <%@ page import="cs336Final.DriverObject"%>
    
	<%@ page import="java.util.*"%>
		<%@ page import="java.sql.*"%>
				<%@ page import="java.sql.ResultSet"%>
				<%@ page import="java.sql.SQLException"%>
		
	


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<div class="tab">
  	<form method ='post' action = "../userProfile.jsp"><button class="tablinks">User Profile</button></form>
  	<button class="tablinks" id="selected">Give a Ride</button>
	<form method ='post' action = "../userFindRide.jsp"><button class="tablinks">Find a Ride</button></form>
	  <form method ='post' action = "../carManagement.jsp" id="selected"><button class="tablinks" >Cars</button></form>
	<form method ='post' action = "../../Login.jsp"><button class="tablinks" style ="float: right;">Logout</button></form>
</div>

<link rel="stylesheet" type="text/css" href="../user.css">
<link rel="stylesheet" type="text/css" href="../dropdown.css">
<link rel="stylesheet" type="text/css" href="../overflow.css">




<h1> Accept Ride Requests</h1>

<!-- Spinning JS Query That Constantly checks  -->

<%
session.setAttribute("user", (LoginObject) session.getAttribute("user"));
LoginObject x = (LoginObject) session.getAttribute("user");
Integer ride_id = (Integer) session.getAttribute("ride_id");

session.setAttribute("ride_id", (Integer) session.getAttribute("ride_id"));


System.out.println("ride id is " + ride_id);


%>



<form action="driver_int.jsp">
<input type = "hidden" name ="ride_id" value = "<%=ride_id%>"/>



<h3>Here are users who want to go in your car. choose them</h3>
<p>Hit refresh to see new ride requests from users</p>


<%	
	ArrayList<rideOffer> offers = rideObj.getOffers(ride_id);
	for(rideOffer ro : offers){
		String username = LoginObject.getUserName(ro.user_id);
%>

<input type="checkbox" name="requests" value=<%=ro.requestID%>><%=username %> <br>


		
		
<%
}
%>



<input type="submit">
</form>


	    <!-- 
	    	After acceptance,go to intermediate page. here its should
	    		1) change status of ride request to accepted.
	    		2) make all other requests to denied
	    		3) pass it all users who are driving with car
	    		4) go to driving page
	    			where it chooses an ad and displays it
	    				ad seen goes up. 
	    				users revenue goes up.
	     -->


</body>
</html>