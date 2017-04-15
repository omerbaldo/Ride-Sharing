<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cs336Final.LoginObject"%>
<%@ page import="cs336Final.MessageObject"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.util.*" %>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Send a Message</title>
</head>
<body>

<div class="tab">
  <button class="tablinks" id="selected">User Profile</button>
  <form method ='post' action = "userGiveRide.jsp"><button class="tablinks">Give a Ride</button></form>
  <form method ='post' action = "userFindRide.jsp"><button class="tablinks">Find a Ride</button></form>
  <form method ='post' action = "userCalendar.jsp"><button class="tablinks" >Calendar</button></form>
  <form method ='post' action = "carManagement.jsp"><button class="tablinks" >Cars</button></form>
  <form method ='post' action = "../Login.jsp"><button class="tablinks" style ="float: right;">Logout</button></form>
</div>

<link rel="stylesheet" type="text/css" href="user.css">
<link rel="stylesheet" type="text/css" href="dropdown.css">
<link rel="stylesheet" type="text/css" href="overflow.css">


<%
session.setAttribute("user", (LoginObject) session.getAttribute("user"));
LoginObject x = (LoginObject) session.getAttribute("user");
String To = request.getParameter("To");
String Subject = request.getParameter("Subject");
String Content = request.getParameter("Content");
System.out.println("Console");


if(To == null){	
	//First time accessing page
	System.out.println("First time accessing Page");
}else{
	if(To!=null && Subject!=null && Content!=null){
		if(To.length() == 0 || Subject.length() == 0 || Content.length() == 0){
			System.out.println("Error ! ");
		}else{
			System.out.println("Insert and print out result of insertion ! ");
			
			if(MessageObject.sendmsg(x, To, Subject, Content) == false){
				System.out.println("insertion failed");
			}else{
				System.out.println("insertion succeeded");
			}
			
		}
	}
}

%>


<h3>New Message</h3>

<!-- Form For Sending a New Email  -->
		<form method ='post' action="messageUser.jsp">
		  To (Enter User ID): <br>
		  <input type="text" name="To">
		  <br>
		  Subject: <br>
		  <input type="text" name="Subject">
		  <br>
		  <br>
		  Content <br>
		  <textarea name="Content" cols="40" rows="5">
		  </textarea>
		  <br>
		  <br>
		  <input type="submit" value="Send">
		</form> 
		
<br>
<br>

<h3>Inbox</h3>

<!-- Form For Displaying all Inbox Emails  -->
		<form method = 'post'>
			
			<table border="2">
			   <tr>
			        <td>FROM</td>
			        <td>SUBJECT</td>
			        <td>CONTENT</td>
			        <td>DATE RECEIVED</td>
			   </tr>
			   <%
			   try
			   {
			       Class.forName("com.mysql.jdbc.Driver");
			       String url="jdbc:mysql://cs336dbinstance.cxvvrbjkmr4a.us-west-2.rds.amazonaws.com:3306";
			       String username="omerdeepcal";
			       String password="wegotthis";
			       int userid = x.getUser_id();
			       String query="select * from `app`.`SEND_EMAIL`, `app`.`User` where SEND_EMAIL.To = " + userid + " and User.user_id = SEND_EMAIL.From";
			       Connection conn=DriverManager.getConnection(url, username, password);
			       Statement stmt=conn.createStatement();
			       ResultSet rs=stmt.executeQuery(query);
			       
			      
			       
			       Deque<String> usq = new ArrayDeque<String>();
			       Deque<String> subq = new ArrayDeque<String>();
			       Deque<String> contq = new ArrayDeque<String>();
			       Deque<String> dateq = new ArrayDeque<String>();
			       
			       while(rs.next())
			       {
			    	   usq.push(rs.getString("username"));
			    	   subq.push(rs.getString("Subject"));
			    	   contq.push(rs.getString("Content"));
			    	   dateq.push(rs.getString("Date"));
			       }
			       
			       
			       while(usq.peek() != null)
			       {
			    	   
			   %>
			           <tr><td><%=usq.pop() %></td>
			           <td><%=subq.pop() %></td>
			           <td><%=contq.pop()%></td>
			           <td><%=dateq.pop()%></td></tr>
			
			   <%
			       }
			   %>
			   </table>
			   <%
			        rs.close();
			        stmt.close();
			        conn.close();
			   }
			   catch(Exception e)
			   {
			        e.printStackTrace();
			   }
			   %>
			   
		</form>




</body>
</html>