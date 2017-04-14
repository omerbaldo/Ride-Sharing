<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336Final.registrationClass"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
</head>
<body>
	<%
		
		String user = request.getParameter("username");
		String pass = request.getParameter("password");
		String add = request.getParameter("address");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		boolean res = registrationClass.register(user,pass, email, phone, add);
		
		if (res)
			out.print("<h1>Register Worked<h1>");
		else
			out.print("<h1>Register Failed. Possibly a duplicate user<h1>");
			
	%>
</body>
</html>