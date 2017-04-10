package cs336Final;

import java.sql.ResultSet;
import java.sql.SQLException;

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
		
		
	
	
	
	
	
	
	
	
}
