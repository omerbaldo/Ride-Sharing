package cs336Final;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

public class rideObj {

	/**
	 * false if ride is over
	 */
	
	public static boolean addToDB(int rideID, Date from, Date to, int locationfrom, int locationto, boolean regScheduled, int often){
		/**
		 * 0 for rating, 
		 */		
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
			String str = "INSERT INTO app.Ride (ride_id,date,Ad_income) VALUES (";			
			
			System.out.print(str);
			//Run the query against the DB
			int result = stmt.executeUpdate(str);
			
			return true;
		}
		
		catch (Exception e)
		{
			System.out.println(e.toString());
			return false;
		}
	}
	
	public static boolean deleteToDB(int rideID){
		return false;
	}
}