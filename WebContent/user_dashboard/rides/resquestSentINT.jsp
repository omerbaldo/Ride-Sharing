<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="cs336Final.rideObj"%>
    <%@ page import="cs336Final.rideObj.ride"%>
    <%@ page import="cs336Final.carObj.car"%>
    <%@ page import="cs336Final.carObj"%>
    
    <%@ page import="cs336Final.LoginObject"%>
    
    <%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>




<% 
//Login
	session.setAttribute("user", (LoginObject) session.getAttribute("user"));
	LoginObject x = (LoginObject) session.getAttribute("user");

//Add to ride offering table
	String ride_id = request.getParameter("rid");
	int requestID = rideObj.makeRideRequest(ride_id, x.getUser_id());
	System.out.println("request id is " + requestID);
	
	session.setAttribute("requestID", (Integer) requestID);
	session.setAttribute("ride_id", (Integer) Integer.parseInt(ride_id));

//redirect
	response.sendRedirect(request.getContextPath() + "/user_dashboard/rides/requestSent.jsp");

%>
</body>
</html>