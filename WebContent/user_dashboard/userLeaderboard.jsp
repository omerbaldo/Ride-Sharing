<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336Final.LoginObject"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
		<%@ page import="java.sql.*"%>
				<%@ page import="java.sql.ResultSet"%>
				<%@ page import="java.sql.SQLException"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Leader Board</title>
</head>
<body>
<div class="tab">
   <form method ='post' action = "userProfile.jsp"><button class="tablinks">User Profile</button></form>
  <form method ='post' action = "userGiveRide.jsp"><button class="tablinks">Give a Ride</button></form>
  <form method ='post' action = "userFindRide.jsp"><button class="tablinks">Find a Ride</button></form>
  <form method ='post' action = "carManagement.jsp"><button class="tablinks" >Cars</button></form>
  <form method ='post' action = "userLeaderboard.jsp"><button id="selected" class="tablinks">Leaderboard</button></form>
  <form method ='post' action = "../Login.jsp"><button class="tablinks" style ="float: right;">Logout</button></form>
</div>
<link rel="stylesheet" type="text/css" href="user.css">

<%
session.setAttribute("user", (LoginObject) session.getAttribute("user"));

String str = "Select U.username, D.Ridesgiven From app.Driver D, app.User U Where U.user_id = D.uid ORDER BY D.Ridesgiven DESC";
String url = "jdbc:mysql://cs336dbinstance.cxvvrbjkmr4a.us-west-2.rds.amazonaws.com:3306";
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(url, "omerdeepcal", "wegotthis");
Statement stmt = con.createStatement();
ResultSet rs;		

%>

<h1>Leader Board Rankings</h1>
<p> Note: Leader board is ranked based on a rides given 
	If you have not given a ride yet, you are not ranked. 
</p>

<table>
<tr>
	<th>Rank</th>
	<th>Name</th>
	<th>Rides Given</th>
</tr>

<%

try{
	rs = stmt.executeQuery(str);	
	int i = 1;
	while(rs.next()){	
%>

<tr>
	<th><% out.println(i); %></th>
	<th><% out.println(rs.getString(1)); %></th>
	<th><% out.println(rs.getString(2)); %></th>
</tr>

<%
i++;
}}
catch(Exception e){
	e.printStackTrace();
}

%>



</table>

</body>
</html>