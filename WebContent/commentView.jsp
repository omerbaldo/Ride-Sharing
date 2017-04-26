<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        
    <%@ page import="cs336Final.LoginObject"%>
    <%@ page import="cs336Final.rideObj"%>
    <%@ page import="cs336Final.RiderObject"%>
        <%@ page import="cs336Final.rideObj.rideOffer"%>
    
        <%@ page import="cs336Final.DriverObject"%>
    
	<%@ page import="java.util.*"%>
		<%@ page import="java.sql.*"%>
				<%@ page import="java.sql.ResultSet"%>
				<%@ page import="java.sql.SQLException"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="tab">
  	<form method ='post' action = "user_dashboard/userProfile.jsp"><button class="tablinks">User Profile</button></form>
  	<button class="tablinks" id="selected">Give a Ride</button>
	<form method ='post' action = "user_dashboard/userFindRide.jsp"><button class="tablinks">Find a Ride</button></form>
	  <form method ='post' action = "user_dashboard/carManagement.jsp" id="selected"><button class="tablinks" >Cars</button></form>
	<form method ='post' action = "../Login.jsp"><button class="tablinks" style ="float: right;">Logout</button></form>
</div>

<link rel="stylesheet" type="text/css" href="user_dashboard/user.css">
<link rel="stylesheet" type="text/css" href="user_dashboard/dropdown.css">
<link rel="stylesheet" type="text/css" href="user_dashboard/overflow.css">



<!-- Comment section -->
<h1>Comments, Refresh for new comments </h1>
<%

	//adds the ratings for each driver
	session.setAttribute("user", (LoginObject) session.getAttribute("user"));
	LoginObject x = (LoginObject) session.getAttribute("user");
	
	Integer rideID = (Integer) session.getAttribute("ride_id");
	String url = "jdbc:mysql://cs336dbinstance.cxvvrbjkmr4a.us-west-2.rds.amazonaws.com:3306";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, "omerdeepcal", "wegotthis");
	Statement stmt = con.createStatement();
	ResultSet rs;		
		
		try{
			String statement = "Select * From app.Ratings Where rideID = " + rideID + " and receiver = " + x.getUser_id();
			System.out.println(statement);
			rs = stmt.executeQuery(statement);			
			while(rs.next()){	
				System.out.println("col 1 " + rs.getInt(1));
				System.out.println("col 3 " + rs.getInt(3));
				System.out.println("col 4 " + rs.getString(4));

%>

<h3> Rating from: <% out.println(LoginObject.getUserName(rs.getInt(1))); %> </h3>
<h3> <% out.println(rs.getInt(3));%> Stars </h3>
<p><% out.println(rs.getString(4)); %> </p>

<%
			}
			con.close();

		}catch(Exception e){
			e.printStackTrace();
		}
	



%>







</body>
</html>