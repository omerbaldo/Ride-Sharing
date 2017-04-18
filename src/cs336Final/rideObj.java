package cs336Final;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

import com.mysql.jdbc.ResultSetMetaData;

import cs336Final.carObj.car;


public class rideObj {

	
	public static int addToDB(int userID, String from, String to, String locationfrom, String locationto, String regScheduled, String often, String car){

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
			String str = "INSERT INTO app.Ride (startTime, endTime, scheduled, rating, uid, locationStart, locationEnd,car,started) VALUES ("
					+ "\" " + from + "\", "
					+ "\" " + to + "\", "
					+ "\" " + regScheduled + "\", "
					+ "0, "
					+ userID + ", "
					+ "\" " + locationfrom + "\", "
					+ "\" " + locationto + "\", "
					+ "\" " + car + "\""
							+ ",0)";
		
			System.out.print(str);
			//Run the query against the DB
			int result = stmt.executeUpdate(str);
			
			
			
			str = "SELECT MAX(ride_id) FROM app.Ride";
			ResultSet rs = stmt.executeQuery(str);
			int requestId = 0;
			while(rs.next()){
				requestId = Integer.parseInt(rs.getString(1));
			}
			
			return requestId;
		}
		
		catch (Exception e)
		{
			System.out.println(e.toString());
			return -1;
		}
	}
	
	

	
	
	
	
	
	
	
	
	
	
	
	public static Date convertStringToDateObj(String str){
		String year = "";
		int i;
		for(i = 0; str.charAt(i) != '-';i++){
			year += str.charAt(i);
		}
		i++;

		String month = "";
		int j = i;
		for(; str.charAt(j) != '-';j++){
			month += str.charAt(j);
		}
		j++;

		String day = "";
		int k = j;
		for(; str.charAt(k) != 'T';k++){
			day += str.charAt(k);
		}
		k++;
		String hour = "";
		hour += str.charAt(k);
		hour += str.charAt(k+1);
		
		String minutes = "";
		minutes += str.charAt(k+3);
		minutes += str.charAt(k+4);
		
		Calendar myCal = Calendar.getInstance();

		myCal.set(Calendar.YEAR, Integer.parseInt(year.trim()));
		myCal.set(Calendar.MONTH, Integer.parseInt(month)-1);
		myCal.set(Calendar.DAY_OF_MONTH, Integer.parseInt(day));
		myCal.set(Calendar.HOUR_OF_DAY, Integer.parseInt(hour));
		myCal.set(Calendar.MINUTE, Integer.parseInt(minutes));
		
		Date theDate = myCal.getTime();
		
		return theDate;
	}
	
	
	
	
	public static ArrayList<ride> findRides(String start, String end, String date){
		try
		{
			String url = "jdbc:mysql://cs336dbinstance.cxvvrbjkmr4a.us-west-2.rds.amazonaws.com:3306";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "omerdeepcal", "wegotthis");
			Statement stmt = con.createStatement();
			
			//Step 1. find all cars with locations similar
			String str = "Select * From app.Ride R Where R.locationStart LIKE '%"
					+ start
					+ "%' and R.locationEnd LIKE '%"
					+ end
					+ "%'";
					
			System.out.println(str);

			ResultSet rs = stmt.executeQuery(str);
			
			ArrayList<ride> ridesList = new ArrayList<ride>();
			
			while (rs.next()) {      //for each row in the table 
				ride r = new ride();
				for(int i = 1; i <= 9;i++) {
					if(i==1){
						r.ride_id = Integer.valueOf(rs.getString(i));
					}else if(i==2){
						r.start = rs.getString(i);
					}else if(i==6){
						r.uid = Integer.valueOf(rs.getString(i));
					}else if(i==9){
						r.car = rs.getString(i);
					}
		        }
				//System.out.println("adding car " + r.car);
				ridesList.add(r);
			}


			//query all results and now check for date
			
			for(int i = ridesList.size()-1;i>=0;i--){
				ride c = ridesList.get(i);
				Date after = convertStringToDateObj(date);
				Date ride = convertStringToDateObj(c.start);
				if(ride.before(after)){
					ridesList.remove(i);
				}
			}
			
			
			return ridesList;
		}catch (Exception e){
			System.out.println(e.toString());
			return null;
		}	
		
		
	}
	

	
	
	
	

	
	public static boolean deleteToDB(int rideID){
		return false;
	}
	
	
	
	/**
	 * @param ride id, user id
	 * @return primary key of the ride request 
	 */
	public static int makeRideRequest(String rid ,int userId){
		
		System.out.println("Got here");
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
			String str = "INSERT INTO app.rideRequest(requester,ride_ID, accepted) VALUES ("
					+ userId + ","
					+ rid + ", 0)";

		
			System.out.print(str);
			//Run the query against the DB
			int result = stmt.executeUpdate(str);
			
			str = "SELECT MAX(ride_offer) FROM app.rideRequest";
			ResultSet rs = stmt.executeQuery(str);
			int requestId = 0;
			while(rs.next()){

				requestId = Integer.parseInt(rs.getString(1));
			}
			return requestId;
		}
		
		catch (Exception e)
		{
			System.out.println(e.toString());
			return 0;
		}
	}
	
	
	public static boolean checkAccepted(String rid){

		
		
		
		
		return false;	
		
	}
	
	
	/**
	 * Get all valid offers for ride
	 */
	public static ArrayList<rideOffer> getOffers(int rid){
		System.out.println("Gettin the offers");
		try
		{
			String url = "jdbc:mysql://cs336dbinstance.cxvvrbjkmr4a.us-west-2.rds.amazonaws.com:3306";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "omerdeepcal", "wegotthis");
			Statement stmt = con.createStatement();
			
			//Step 1. find all cars with locations similar
			String str = "Select * From app.rideRequest Where ride_ID = " + rid;
			ResultSet rs = stmt.executeQuery(str);
			
			ArrayList<rideOffer> rideOfferList = new ArrayList<rideOffer>();
			
			while (rs.next()) {      //for each row in the table 
				rideOffer ro = new rideOffer();
				for(int i = 1; i <= 3;i++) {
					if(i==1){
						ro.requestID = Integer.valueOf(rs.getString(i));
					}else if(i==2){
						ro.user_id = Integer.valueOf(rs.getString(i));
					}
		        }
				rideOfferList.add(ro);
				System.out.println("adding + " + ro.requestID);
			}
			return rideOfferList;
		}catch (Exception e){
			System.out.println(e.toString());
			return null;
		}	
	}
	
	
	
	/**
	 * 
	 * @param rideID: 		id of ride. we will mark it as started (-1 for not started, 1 for started, 2 for completed
	 * @param requestIDs	ids of accepted requests. we will mark them as accepted(1) or denied(-1). 
	 */
	public static void markStarted(int rideID,String requestIDs[]){	
		try{
			//part 1 update the ride
			String url = "jdbc:mysql://cs336dbinstance.cxvvrbjkmr4a.us-west-2.rds.amazonaws.com:3306";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "omerdeepcal", "wegotthis");
			Statement stmt = con.createStatement();
			
			//Step 1. find all cars with locations similar
				String str = "UPDATE app.Ride SET started = 1  WHERE ride_id = " + rideID;
				stmt.executeUpdate(str);
			
			//part 2 mark ride request as completed or denied
				str = "UPDATE app.rideRequest SET accepted = -1  WHERE ride_ID = " + rideID;
				stmt.executeUpdate(str);

				for(int i = 0; i<requestIDs.length; i++){
					str = "UPDATE app.rideRequest SET accepted = 1  WHERE ride_offer = " + requestIDs[i];
					stmt.executeUpdate(str);
				}		
		}catch(Exception e){
			
		}
	}
	
	
	/**
	 * Get status of a ride request. -1 for denial 1 for acceptance. 
	 */
	public static int getStatus(int requestID){
		
		try{
			//part 1 update the ride
			String url = "jdbc:mysql://cs336dbinstance.cxvvrbjkmr4a.us-west-2.rds.amazonaws.com:3306";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "omerdeepcal", "wegotthis");
			Statement stmt = con.createStatement();
			
			//Step 1. find all cars with locations similar
				String str = "SELECT accepted FROM app.rideRequest Where ride_offer = " + requestID;
				ResultSet st = stmt.executeQuery(str);
				int status = 0;
				while(st.next()){
					status = Integer.parseInt(st.getString(1));
				}
				return status;
			
		}catch(Exception e){
			return 0;
		}
	}
	
	
	

	public static ArrayList<ride> findRidesOfUser(int uid){
		try
		{
			String url = "jdbc:mysql://cs336dbinstance.cxvvrbjkmr4a.us-west-2.rds.amazonaws.com:3306";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "omerdeepcal", "wegotthis");
			Statement stmt = con.createStatement();
			
			//Step 1. find all cars with locations similar
			String str = "SELECT * FROM app.Ride Where uid = " + uid;
					
			System.out.println(str);

			ResultSet rs = stmt.executeQuery(str);
			
			ArrayList<ride> ridesList = new ArrayList<ride>();
			
			while (rs.next()) {      //for each row in the table 
				ride r = new ride();
				for(int i = 1; i <= 10;i++) {
					
					if(i == 1){
						r.ride_id = Integer.parseInt(rs.getString(i)); //ride id				1

					}else if(i == 2){
					    r.start = rs.getString(i); ; //start time			2

					}else if(i == 3){
						r.end = rs.getString(i); ; //end time				3

					}else if(i == 6){
						r.uid = Integer.parseInt(rs.getString(i));//driver id					6

					}else if(i == 7){
						r.locations = rs.getString(i); //location start 	7

					}else if(i == 8){
						r.locatione = rs.getString(i);  //location end 	8

					}else if(i == 9){
						r.car = rs.getString(i); //car.					9	

					}else if(i == 10){
						r.started = rs.getString(i); //has it been started 10

					}
					
					
					
					
					
					
					
					
					
					
		        }
				//System.out.println("adding car " + r.car);
				ridesList.add(r);
			}



			
			
			return ridesList;
		}catch (Exception e){
			System.out.println(e.toString());
			return null;
		}	
		
		
	}
	
	
	/**
	 * Get status of a ride request. -1 for denial 1 for acceptance. 
	 */
	public static void deleteRide(String rideID){
		
		try{
			//part 1 update the ride
			String url = "jdbc:mysql://cs336dbinstance.cxvvrbjkmr4a.us-west-2.rds.amazonaws.com:3306";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "omerdeepcal", "wegotthis");
			Statement stmt = con.createStatement();
			
			//Step 1. find all cars with locations similar
				String str = "DELETE FROM app.Ride WHERE ride_id = " + rideID;
				stmt.execute(str);
				System.out.println(str);
		}catch(Exception e){
		}
	}
	
	public static boolean isDriver(int userID, int rideID ){
		
		System.out.println("Checking if uid is a driver uid = " + userID + " and rideID = " + rideID);
		
		try{
			//part 1 update the ride
			String url = "jdbc:mysql://cs336dbinstance.cxvvrbjkmr4a.us-west-2.rds.amazonaws.com:3306";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "omerdeepcal", "wegotthis");
			Statement stmt = con.createStatement();
			
				String str = "SELECT COUNT(*) FROM app.Ride WHERE uid = " + userID + " and ride_id = " + rideID;
				ResultSet rs = stmt.executeQuery(str);
				int count = 0;
				
		
				while (rs.next()) {      //for each row in the table 
					count = rs.getInt(1);
				}
				
				System.out.println("count is " + count);
				if (count==1){
					return true; 
				}
				return false;
				
		}catch(Exception e){
		}
		
		return false;
	}
	
	
	
	
	
	public static ArrayList<Integer> getIDSFromRideRequesters(int rideID){
		System.out.println("ride id is " + rideID);
		try{
			//part 1 update the ride
			String url = "jdbc:mysql://cs336dbinstance.cxvvrbjkmr4a.us-west-2.rds.amazonaws.com:3306";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "omerdeepcal", "wegotthis");
			Statement stmt = con.createStatement();
			
				String str = "Select requester From app.rideRequest Where ride_ID = " + rideID + " and accepted = 1";
				ResultSet rs = stmt.executeQuery(str);
				ArrayList<Integer> ids = new ArrayList<Integer>();
		
				while (rs.next()) {      //for each row in the table 
					int i = rs.getInt(1);
					System.out.println("user " + i + " is a requester for ride " + rideID );
					ids.add(i);
				}
				return ids;
		}catch(Exception e){
		}
		
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	

	public static class rideOffer{
		
		public  int requestID; //ride id			1
		public  int user_id; //ride id			1
	}
	
	
	
	public static class ride{
		public  String start; //start time			2
		public  int ride_id; //ride id				1
		public  int uid;//driver id					6
		public  String car; //car.					9	
		public String end; //end time				3
		
		public String locations; //location start 	7
		public String locatione; //location end 	8
		public String started; //has it been started 10

		
		
		
		public String getCar(){
			return this.car;
		}	
	}
	
	
}
