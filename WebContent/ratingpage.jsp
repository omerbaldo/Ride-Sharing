<%@ page
language="java" 
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" 
import="java.sql.DriverManager,
java.sql.Connection, 
cs336Final.LoginObject,
java.sql.PreparedStatement, 
java.sql.ResultSet, 
java.sql.SQLException"
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Give a Rating</title>
</head>
<body>

<%
session.setAttribute("user", (LoginObject) session.getAttribute("user"));
LoginObject x = (LoginObject) session.getAttribute("user");
String option = request.getParameter("number");
int giver = x.getUser_id();
String Comment = request.getParameter("Comments");
%>

<h2>We hope you had a joyful ride</h2>
<form>
<h3>Rating</h3>
<p><input type="radio" name="number" value="5"> 5 : Awesome!</p>
<p><input type="radio" name="number" value="4"> 4 : Good! </p>
<p><input type="radio" name="number" value="3"> 3 : Average! </p>
<p><input type="radio" name="number" value="2"> 2 : Could have been better! </p>
<p><input type="radio" name="number" value="1"> 1 : Mediocre! </p>
<br>
Comments (Optional) <br>
<textarea name="Comments" cols="40" rows="5">
</textarea>
<br>
<br>
<input type="submit" value="Submit">
</form>
<br>

<%! 
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://cs336dbinstance.cxvvrbjkmr4a.us-west-2.rds.amazonaws.com:3306";
String username="omerdeepcal";
String password="wegotthis";
Connection con;
ResultSet rs;
PreparedStatement ps;
%>
<%
try
{
Class.forName(driver);
con = DriverManager.getConnection(url,username,password);
}
catch(ClassNotFoundException cx)
{
out.println(cx);
}

if(option !=(null))
{ 
try{

String sql = "INSERT INTO `app`.`Ratings`(`giver`, `ratingstars`, `Comments`) VALUES(?,?,?)";
ps= con.prepareStatement(sql);
ps.setInt(1, giver);
ps.setString(2, option);
ps.setString(3, Comment);
int i = ps.executeUpdate();
if(i != 0)
{
out.println("Your rating has been submitted successfully. Thank You!");
}
else
out.println("Sorry your rating cannot be submitted right now.");

%>
<p>Your submitted rating is
<%= option %></p>
<%
}
catch(Exception e)
{
out.println(e);
}
finally
{
if(rs != null)
{
rs.close();
}
if(ps != null)
{
ps.close();
}
if(con != null)
{
con.close();
}
}
} 
%>
</body>
</html>