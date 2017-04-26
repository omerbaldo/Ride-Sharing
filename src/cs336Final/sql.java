package cs336Final;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Optional;

public class sql 
{
	public static Optional<ResultSet> query(String q)
	{
		Optional<ResultSet> o =  Optional.empty();
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
	
			//Run the query against the DB
			ResultSet result = stmt.executeQuery(q);
			
			o = Optional.ofNullable(result);
			
			return o;
			
		}
		catch (Exception e)
		{
			e.printStackTrace();
			return o;
		}
		
	}
	
	public static int upd(String q)
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
	
			//Run the query against the DB
			int result = stmt.executeUpdate(q);
			
			return result;

			
		}
		catch (Exception e)
		{
			e.printStackTrace();
			return 0;
			
		}
		
	}

}
