<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cs336Final.LoginObject"%>
<%@ page import="cs336Final.RiderObject"%>
<%@ page import="cs336Final.DriverObject"%>
<%@ page import="cs336Final.rideObj"%>
<%@ page import="cs336Final.rideObj.ride"%>
<%@ page import="java.util.*"%>
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
  <form method ='post' action = "userProfile.jsp"><button class="tablinks" id="selected">User Profile</button></form>
  <form method ='post' action = "userGiveRide.jsp"><button class="tablinks">Give a Ride</button></form>
  <form method ='post' action = "userFindRide.jsp"><button class="tablinks">Find a Ride</button></form>
  <form method ='post' action = "carManagement.jsp"><button class="tablinks" >Cars</button></form>
  <form method ='post' action = "userLeaderboard.jsp"><button class="tablinks">Leaderboard</button></form>
  <form method ='post' action = "../Login.jsp"><button class="tablinks" style ="float: right;">Logout</button></form>
</div>
<link rel="stylesheet" type="text/css" href="user.css">

<%
session.setAttribute("user", (LoginObject) session.getAttribute("user"));
LoginObject x = (LoginObject) session.getAttribute("user");
String url = "jdbc:mysql://cs336dbinstance.cxvvrbjkmr4a.us-west-2.rds.amazonaws.com:3306";
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(url, "omerdeepcal", "wegotthis");
Statement stmt = con.createStatement();
ResultSet rs;	 %>

<p>
 Hey, Here at Ride Share we like to reward drivers for the hard work they have done. Here is how we 
 go about doing this. At the end of each semester, we calculate the total ad revenue. This is basically
 the total amount of times advertisements have been shown * 2$. So far in our semester we have the following ads 
 and the number of appearances they have had:  
</p>

<%	

try{
			String statement = "SELECT * FROM app.Advertisement";
			System.out.println(statement);
			rs = stmt.executeQuery(statement);		
			int total_num_of_appearances = 0;
			while(rs.next()){	
				total_num_of_appearances += Integer.parseInt(rs.getString(2));


%>

<h5> Ad " <% out.println(rs.getString(3));%> " appeared <% out.println(rs.getString(2)); %> times </h5>

<%
			}
			int total_ad_rev =  total_num_of_appearances*2;
			
			statement = "Select count(*) AS total From app.Driver";
			
			rs = stmt.executeQuery(statement);
			
			rs.next();
			int totaldrivers = rs.getInt(1);
			int split = total_ad_rev/totaldrivers;

		
%>
	Thus we have <% out.println(total_ad_rev); %> $ in total ad revenue. 
	Split between <% out.println(totaldrivers); %>  drivers is <% out.println(split);%> $ per driver at the end of this term. 
<%			 
		}catch(Exception e){
			e.printStackTrace();
		}


%>

</body>
</html>