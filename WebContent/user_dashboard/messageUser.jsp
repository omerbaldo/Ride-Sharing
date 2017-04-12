<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cs336Final.LoginObject"%>
<%@ page import="cs336Final.MessageObject"%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Send a Message</title>
</head>
<body>

<div class="tab">
  <button class="tablinks" id="selected">User Profile</button>
  <form method ='post' action = "userGiveRide.jsp"><button class="tablinks">Give a Ride</button></form>
  <form method ='post' action = "userFindRide.jsp"><button class="tablinks">Find a Ride</button></form>
  <form method ='post' action = "userCalendar.jsp"><button class="tablinks" >Calendar</button></form>
  <form method ='post' action = "carManagement.jsp"><button class="tablinks" >Cars</button></form>
  <form method ='post' action = "../Login.jsp"><button class="tablinks" style ="float: right;">Logout</button></form>
</div>

<link rel="stylesheet" type="text/css" href="user.css">
<link rel="stylesheet" type="text/css" href="dropdown.css">
<link rel="stylesheet" type="text/css" href="overflow.css">


<%
session.setAttribute("user", (LoginObject) session.getAttribute("user"));
LoginObject x = (LoginObject) session.getAttribute("user");
String To = request.getParameter("To");
String Subject = request.getParameter("Subject");
String Content = request.getParameter("Content");
String Date = request.getParameter("Date");
System.out.println("Console");


if(To == null){	
	//First time accessing page
	System.out.println("First time accessing Page");
}else{
	if(To!=null && Subject!=null && Content!=null && Date!=null){
		if(To.length() == 0 || Subject.length() == 0 || Content.length() == 0 || Date.length() == 0){
			System.out.println("Error ! ");
		}else{
			System.out.println("Insert and print out result of insertion ! ");
			
			if(MessageObject.sendmsg(x, To, Subject, Content, Date) == false){
				System.out.println("insertion failed");
			}else{
				System.out.println("insertion succeeded");
			}
			
		}
	}
}

%>


<h3>New Message</h3>

<!-- Form For Sending a New Email  -->
		<form method ='post' action="messageUser.jsp">
		  To (Enter User ID):<br>
		  <input type="text" name="To">
		  <br>
		  
		  Subject:<br>
		  <input type="text" name="Subject">
		  <br><br>
		  
		  Content:<br>
		  <input type="text" name="Content">
		  <br><br>
		  
		  Date<br>
		  <input type="text" name="Date">
		  <br><br>
		  
		  <input type="submit" value="Send">
		</form> 



</body>
</html>