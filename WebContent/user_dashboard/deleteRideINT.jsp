<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="cs336Final.LoginObject"%>
<%@ page import="cs336Final.RiderObject"%>
<%@ page import="cs336Final.DriverObject"%>
<%@ page import="cs336Final.rideObj"%>
<%@ page import="cs336Final.rideObj.ride"%>
<%@ page import="java.util.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Deleting a ride</title>
</head>
<body>
<%
//Gets current user
System.out.println("here");
session.setAttribute("user", (LoginObject) session.getAttribute("user"));
LoginObject x = (LoginObject) session.getAttribute("user");
rideObj.deleteRide(request.getParameter("rideid"));
response.sendRedirect(request.getContextPath() + "/user_dashboard/userProfile.jsp");

%>


</body>
</html>