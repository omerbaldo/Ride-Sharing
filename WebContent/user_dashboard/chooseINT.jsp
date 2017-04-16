<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@ page import="cs336Final.LoginObject"%>
    <%@ page import="cs336Final.carObj"%>
    <%@ page import="cs336Final.carObj.car"%>
    
	<%@ page import="java.util.*"%>
    
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
session.setAttribute("ride_id", (Integer) Integer.parseInt(request.getParameter("rideid")));
response.sendRedirect(request.getContextPath() + "/user_dashboard/rides/rideGiving.jsp");

%>


</body>
</html>