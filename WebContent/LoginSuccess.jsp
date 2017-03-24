<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336Final.loginClass"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String user = request.getParameter("Username");
		String pass = request.getParameter("Password");
		
		boolean res = loginClass.login(user, pass);
		
		if (res)
			out.print("<h1>Login Worked<h1>");
		else
			out.print("<h1>Login Failed<h1>");
			
	%>
</body>
</html>