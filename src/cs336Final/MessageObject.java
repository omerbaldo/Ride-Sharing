package cs336Final;

import java.sql.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

public class MessageObject {

	public MessageObject() {
		// TODO Auto-generated constructor stub
	}
	public static Boolean sendmsg(LoginObject user, String To, String Subject, String Content){
		try
		{
			
		
			String url = "jdbc:mysql://cs336dbinstance.cxvvrbjkmr4a.us-west-2.rds.amazonaws.com:3306";
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "omerdeepcal", "wegotthis");
			//Create a SQL statement
			//Statement stmt = con.createStatement();
			
			System.out.println("Trying to insert" + To + Subject + Content);
			String From = Integer.toString(user.getUser_id());
			String Date = new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(new java.util.Date());
			 
			PreparedStatement updatemsgs = con.prepareStatement(
			         "insert into `app`.`SEND_EMAIL` (`From`, `To`, `Subject`, `Content`, `Date`) values(?,?,?,?,?)");
			      
			      updatemsgs.setString(1, From);
			      updatemsgs.setString(2, To);
			      updatemsgs.setString(3, Subject);
			      updatemsgs.setString(4, Content);
			      updatemsgs.setString(5, Date);

			      updatemsgs.executeUpdate();
			con.close();
			return true;
		}
		
		catch (Exception e)
		{
			System.out.println(e.toString());
			return false;
		}
		
	}
	
}