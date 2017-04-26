<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="cs336Final.LoginObject"%>
    <%@ page import="cs336Final.rideObj"%>
    <%@ page import="cs336Final.RiderObject"%>
        <%@ page import="cs336Final.rideObj.rideOffer"%>
    
        <%@ page import="cs336Final.DriverObject"%>
    
	<%@ page import="java.util.*"%>
		<%@ page import="java.sql.*"%>
				<%@ page import="java.sql.ResultSet"%>
				<%@ page import="java.sql.SQLException"%>
		
		
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

	//adds the ratings for each driver
	session.setAttribute("user", (LoginObject) session.getAttribute("user"));
	LoginObject x = (LoginObject) session.getAttribute("user");
	
	Integer rideID = (Integer) session.getAttribute("ride_id");

	
	
	String url = "jdbc:mysql://cs336dbinstance.cxvvrbjkmr4a.us-west-2.rds.amazonaws.com:3306";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, "omerdeepcal", "wegotthis");
	Statement stmt = con.createStatement();
	
		try{
			String statement = "Select uid From app.Ride Where ride_id = " + rideID;
			ResultSet rs = stmt.executeQuery(statement);
			int uid = 0;
			while(rs.next()){
				uid = rs.getInt(1);
			}
			statement = "INSERT INTO `app`.`Ratings` (`giver`, `receiver`, `ratingstars`, `Comments`, `rideID`) VALUES ("
					+ x.getUser_id() + " ," + uid + " ," + request.getParameter("star") +" ,\"" + request.getParameter("comment") +"\" , " + rideID +")";
			
			System.out.println(statement);
			stmt.execute(statement);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	
	
	
	
	//redirect to a comment finalization page
	
	session.setAttribute("ride_id", (Integer) session.getAttribute("ride_id"));
	
	response.sendRedirect(request.getContextPath() + "/commentView.jsp");

%>

</body>
</html>