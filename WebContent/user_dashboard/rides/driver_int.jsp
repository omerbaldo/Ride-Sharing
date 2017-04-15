<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cs336Final.LoginObject"%>
<%@ page import="cs336Final.rideObj"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>



<%
session.setAttribute("user", (LoginObject) session.getAttribute("user"));
LoginObject x = (LoginObject) session.getAttribute("user");
int ride_id = Integer.parseInt(request.getParameter("ride_id"));
System.out.println("ride id is " + ride_id);
String[] requestIDS = request.getParameterValues("requests");

for(String s : requestIDS){
	System.out.println("request ids are " + s);
}

rideObj.markStarted(ride_id,requestIDS);

//redirect
response.sendRedirect(request.getContextPath() + "/user_dashboard/rides/rideOccuring.jsp");


%>
<!-- 
	Here
		1) mark ride as started
		2) mark ride request as accepted and all other ones as denied
		3) redirect to drive page
 -->






</body>
</html>