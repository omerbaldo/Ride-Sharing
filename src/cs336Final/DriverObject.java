package cs336Final;

import java.sql.ResultSet;
import java.sql.SQLException;

public class DriverObject {

	public DriverObject() {
		// TODO Auto-generated constructor stub
	}

	
	public static int amountOfRidesGiven(LoginObject user) throws SQLException{	
		String str = "SELECT d.Ridesgiven FROM app.Driver d WHERE d.uid = " + user.getUser_id();
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
