<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336Final.LoginObject"%>
<%@ page import="cs336Final.loginClass"%>
<%@ page import="cs336Final.AdObj"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adding Ad</title>
</head>
<body>
<%
	session.setAttribute("user", (LoginObject) session.getAttribute("user"));

	String t = request.getParameter("adTitle");
	
	AdObj.addAd(t);
	
	response.sendRedirect(request.getContextPath() + "/system_support/systemSupportAd.jsp");
%>
</body>
</html>