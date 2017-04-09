<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="cs336Final.LoginObject"%>
    <%@ page import="cs336Final.carObj"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="tab">
  <form method ='post' action = "userProfile.jsp"><button class="tablinks">User Profile</button></form>
  <form method ='post' action = "userGiveRide.jsp">  <button class="tablinks">Give a Ride</button></form>
  <button class="tablinks" >Find a Ride</button>
  <form method ='post' action = "userCalendar.jsp"><button class="tablinks" >Calendar</button></form>
  <form method ='post' action = "carManagement.jsp"><button class="tablinks" id="selected">Cars</button></form>

  <form method ='post' action = "../Login.jsp"><button class="tablinks" style ="float: right;">Logout</button></form>
</div>

<link rel="stylesheet" type="text/css" href="user.css">
<link rel="stylesheet" type="text/css" href="dropdown.css">
<link rel="stylesheet" type="text/css" href="overflow.css">

<h3>Your Cars</h3>
<%
session.setAttribute("user", (LoginObject) session.getAttribute("user"));
LoginObject x = (LoginObject) session.getAttribute("user");
String Make = request.getParameter("Make");
String Model = request.getParameter("Model");
String Year = request.getParameter("Year");
String VIM = request.getParameter("VIM");
String NumberSeats = request.getParameter("NumberSeats");
String LID = request.getParameter("LID");
System.out.println("Console");

if(Make==null){	
	//First time accessing page
	System.out.println("First time accessing Page");
}else{
	if(Make!=null && Model!=null && Year!=null && VIM!=null && NumberSeats!=null && LID!=null){
		if(Make.length() == 0 || Model.length() == 0 || Year.length() == 0 || VIM.length() == 0|| NumberSeats.length() == 0|| LID.length() == 0){
			System.out.println("Error ! ");
		}else{
			System.out.println("Insert and print out result of insertion ! ");
			
			if(carObj.addCar(x,Make,Model,Year,VIM, NumberSeats, LID)==false){
				System.out.println("insertion failed");
			}else{
				System.out.println("insertion succeeded");
			}
			
		}
	}
}



%>


<h3>Register For a New Car</h3>



	<!-- Form For Registering a New Car  -->
		<form method ='post' action="carManagement.jsp">
		  Make:<br>
		  <input type="text" name="Make">
		  <br>
		  Model:<br>
		  <input type="text" name="Model">
		  <br><br>
		  
		  Year:<br>
		  <input type="text" name="Year">
		  <br>
		  VIM<br>
		  <input type="text" name="VIM">
		  <br><br>
		  
		  Number Seats<br>
		  <input type="text" name="NumberSeats">
		  <br>
		  
		  License Plate<br>
		  <input type="text" name="LID">
		  <br><br>
		  
		  <input type="submit" value="Submit">
		</form> 


</body>
</html>