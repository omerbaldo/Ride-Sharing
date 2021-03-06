package cs336Final;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class RiderObject {

	public RiderObject() {
	}
	
	/* Amount of Rides the user took. 			 
		SELECT r.rides_taken
		FROM app.User u, app.Rider r
		WHERE u.user_id = r.uid 
	 */
	
	public static int amountOfRidesTaken(LoginObject user) throws SQLException{	
		String str = "SELECT r.rides_taken FROM app.Rider r WHERE r.uid = " + user.getUser_id();
		//Run the query against the DB
		int amount_of_rides = 0;
		System.out.println("user id " + user.getUser_id());
	
		try{
			ResultSet result = sql.query(str).get();
			result.next();
			amount_of_rides = result.getInt(1);
		}catch (Exception e){
			return 0;
		}
		
		return amount_of_rides;
	}
		
	

	
	
	
	public static boolean addRider(LoginObject user) throws SQLException{	
		System.out.println("Adding a driver ");
		try
		{
			String url = "jdbc:mysql://cs336dbinstance.cxvvrbjkmr4a.us-west-2.rds.amazonaws.com:3306";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "omerdeepcal", "wegotthis");
			//Create a SQL statement
			Statement stmt = con.createStatement();

			String queryDriver = "SELECT COUNT(*) From app.Rider Where uid = " + user.getUser_id();
		

			System.out.println(queryDriver);
			ResultSet r = stmt.executeQuery(queryDriver);
			int amount = 0;
			while(r.next()){
				amount = Integer.parseInt(r.getString(1));
			}
			
			if(amount != 0){

				queryDriver = "SELECT rides_taken From app.Rider Where uid = " + user.getUser_id();
				r = stmt.executeQuery(queryDriver);
				
				while(r.next()){
					amount = Integer.parseInt(r.getString(1));
				}
				amount++;
				
				queryDriver = "";
				queryDriver += "UPDATE app.Rider SET rides_taken ="
						+ amount
						+ " WHERE uid = " + user.getUser_id();
				System.out.println("query is " + queryDriver);
				
				stmt.executeUpdate(queryDriver);
				con.close();
				return true;
			}

			//Populate SQL statement with an actual query. It returns a single number. The number of beers in the DB.
			String str = "INSERT INTO app.Rider (uid,rides_taken) VALUES (";
			str += user.getUser_id() + ",1);";
			
			
			System.out.print(str);
			//Run the query against the DB
			int result = stmt.executeUpdate(str);
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
