<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336Final.loginClass"%>
<%@ page import="cs336Final.LoginObject"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lock</title>
</head>
<body>

<%

	session.setAttribute("user", (LoginObject) session.getAttribute("user"));

	String user = request.getParameter("username");
	String pass = request.getParameter("password");
	
	LoginObject.lock(user);
	
	System.out.println(user);
	
	response.sendRedirect(request.getContextPath() + "/adminUserManager.jsp");

%>
</body>
</html>