package cs336Final;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class registrationClass 
{
	public static boolean register (String username, String password, String email, String phone, String address)
	{
		String split_second = email.substring(email.indexOf("@")+1);

		System.out.println("domain is " + split_second);
		
		//check if email is Rutger's email
		if(!(split_second.equalsIgnoreCase("rutgers.edu")|| split_second.equalsIgnoreCase("scarletmail.rutgers.edu")||split_second.equalsIgnoreCase("cs.rutgers.edu"))){
			return false;
		}
			
			
	
		
		try
		{
			
		
			String url = "jdbc:mysql://cs336dbinstance.cxvvrbjkmr4a.us-west-2.rds.amazonaws.com:3306";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "omerdeepcal", "wegotthis");
			//Create a SQL statement
			
			PreparedStatement stmt = con.prepareStatement("INSERT INTO app.User (typeofuser,username,password,email,address,phone_number,age,active) VALUES(?,?,?,?,?,?,?,?)");
			
			stmt.setInt(1, 3);
			stmt.setString(2, username);
			stmt.setString(3, password);
			stmt.setString(4, email);
			stmt.setString(5, address);
			stmt.setString(6, phone);
			stmt.setInt(7, 30);
			stmt.setInt(8, 1);
	
			stmt.executeUpdate();
			con.close();

			return true;
		}
		
		catch (Exception e)
		{
			System.out.println(e.toString());
			return false;
		}
		
	}
	public static boolean registerSupport (String username, String password, String email, String phone, String address)
	{
		
		try
		{
			
		
			String url = "jdbc:mysql://cs336dbinstance.cxvvrbjkmr4a.us-west-2.rds.amazonaws.com:3306";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "omerdeepcal", "wegotthis");
			//Create a SQL statement
			
			PreparedStatement stmt = con.prepareStatement("INSERT INTO app.User (typeofuser,username,password,email,address,phone_number,age,active) VALUES(?,?,?,?,?,?,?,?)");
			
			stmt.setInt(1, 2);
			stmt.setString(2, username);
			stmt.setString(3, password);
			stmt.setString(4, email);
			stmt.setString(5, address);
			stmt.setString(6, phone);
			stmt.setInt(7, 30);
			stmt.setInt(8, 1);
	
			stmt.executeUpdate();
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
