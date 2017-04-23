<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ page import="cs336Final.LoginObject"%>
    <%@ page import="cs336Final.rideObj"%>
    <%@ page import="cs336Final.RiderObject"%>
        <%@ page import="cs336Final.rideObj.rideOffer"%>
    
        <%@ page import="cs336Final.DriverObject"%>
    
	<%@ page import="java.util.*"%>




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

// First check if the rider exsists in the db. if yes up its ride amount, if not add it to the data base
DriverObject.addDriver(x);

// Next create a ride object and add it to the database.
rideObj r = new rideObj();

// Constantly spin waiting for ride requests to come in from a table. 

String pickup = request.getParameter("pickup");
String dest = request.getParameter("dest");
String startTime = request.getParameter("startTime");
String endTime = request.getParameter("endTime");
String often = request.getParameter("offer");
String car = request.getParameter("cars");
System.out.println("car " + car);

//System.out.println("often? " + often);
boolean f = true;
int ride_id = 0;
if(often.equals("yes")){
	
	 often = request.getParameter("often");
	 if(often.equals("Weekly")){
		 System.out.println("adding weekly");
		 ride_id = rideObj.addToDBWeekly(x.getUser_id(), startTime, endTime, pickup, dest, "yes", often, car);
		 //redirect

		 f = false;
	 }else if(often.equals("Monthly")){
		 ride_id = rideObj.addToDBMonthly(x.getUser_id(), startTime, endTime, pickup, dest, "yes", often, car);
	 	 //redirect
		f = false;
	 }
	 else{
	 
	 	ride_id = rideObj.addToDB(x.getUser_id(), startTime, endTime, pickup, dest, "yes", often, car);
	 }
}else{
	ride_id = rideObj.addToDB(x.getUser_id(), startTime, endTime, pickup, dest, "no", often, car);
}

System.out.println("pickup " + pickup);
System.out.println("dest " + pickup);
System.out.println("starttime " + startTime);
System.out.println("endtime " + endTime);

//redirect and send rideID
session.setAttribute("ride_id", (Integer) ride_id);



if(f==true){
	response.sendRedirect(request.getContextPath() + "/user_dashboard/rides/rideGiving.jsp");
}else{
	response.sendRedirect(request.getContextPath() + "/user_dashboard/userProfile.jsp");

}


%>





</body>
</html>