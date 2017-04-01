<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336Final.loginClass"%>
<%@ page import="cs336Final.LoginObject"%>
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
		int t = loginClass.userType(user, pass);
		
		
		if (res)
		{
			if (t == 1)
			{
				LoginObject u = new LoginObject(user, pass, true);
			
				/*
				request.setAttribute("user" , u );
				request.getHeader("POOOP");
				request.getRequestDispatcher("/adminDashboard.jsp").forward(request, response);
				*/
			
				session.setAttribute("user", u);
				response.sendRedirect(request.getContextPath() + "/adminDashboard.jsp");
				
				
			}
			else
			{
				
				LoginObject u = new LoginObject(user, pass, false);
				
				/*
				request.setAttribute("user" , u );
				request.getRequestDispatcher("/user_dashboard/userDashboard.jsp").forward(request, response);
				*/
				session.setAttribute("user", u);
				response.sendRedirect(request.getContextPath() + "/user_dashboard/userDashboard.jsp");
			}
			
		}
		else
			out.print("<h1>Login Failed<h1>");
			
	%>
</body>
</html>