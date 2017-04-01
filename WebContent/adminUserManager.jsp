<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336Final.admin"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Users</title>
</head>
<body>
<h1> Active Users</h1>
<table>
<%
ArrayList<String> a = admin.getUserNames();
ArrayList<String> b = admin.getUserPasswords();

for ( int i =0; i < admin.getUserNames().size() ; i++)
{
%>

<tr>
<td> <%=a.get(i)%></td>
<td><%=b.get(i)%> </td>
<td><button>Reset Password</button></td>
<td><button>Lock</button></td>
</tr>

<%       
}
%>

</table>
</body>
</html>