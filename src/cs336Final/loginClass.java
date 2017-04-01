package cs336Final;

 
import java.io.*;
import java.util.*;
import java.sql.*;
//import javax.servlet.http.*;
//import javax.servlet.*;

public class loginClass 
{
	public static boolean login (String username, String password)
	{
		try
		{
			
		
			String url = "jdbc:mysql://cs336dbinstance.cxvvrbjkmr4a.us-west-2.rds.amazonaws.com:3306";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "omerdeepcal", "wegotthis");
			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Populate SQL statement with an actual query. It returns a single number. The number of beers in the DB.
			String str = "SELECT user_id FROM app.User where password = '"+password.trim() +"' and username = '"+username.trim()+"'";
			//Run the query against the DB
			ResultSet result = stmt.executeQuery(str);
			
			
			if (getRows(result) == 0)
			{
				return false;
			}
			else
			{
				return true;
			}
			
		}
		
		catch (Exception e)
		{
			System.out.println(e.toString());
			return false;
		}
		
	}
	
	private static int getRows(ResultSet res){
	    int totalRows = 0;
	    try {
	        res.last();
	        totalRows = res.getRow();
	        res.beforeFirst();
	    } 
	    catch(Exception ex)  {
	        return 0;
	    }
	    return totalRows ;    
	}
	
}
