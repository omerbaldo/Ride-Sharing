package cs336Final;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

import com.mysql.jdbc.ResultSetMetaData;

import cs336Final.carObj.car;


public class rideObj {

	
	public static boolean addToDB(int userID, String from, String to, String locationfrom, String locationto, String regScheduled, String often, String car){

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
			String str = "INSERT INTO app.Ride (startTime, endTime, scheduled, rating, uid, locationStart, locationEnd,car) VALUES ("
					+ "\" " + from + "\", "
					+ "\" " + to + "\", "
					+ "\" " + regScheduled + "\", "
					+ "0, "
					+ userID + ", "
					+ "\" " + locationfrom + "\", "
					+ "\" " + locationto + "\", "
					+ "\" " + car + "\" )";
		
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
					+ rid + ", -1)";

		
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
	
	/*
	
	public ArrayList<rideOffer> getOffers(String rid){
		try
		{
			String url = "jdbc:mysql://cs336dbinstance.cxvvrbjkmr4a.us-west-2.rds.amazonaws.com:3306";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "omerdeepcal", "wegotthis");
			Statement stmt = con.createStatement();
			
			//Step 1. find all cars with locations similar
			String str = "Select * From app.rideRequest Where ride_ID = " + rid;
			ResultSet rs = stmt.executeQuery(str);
			
			ArrayList<rideOffer> ridesList = new ArrayList<rideOffer>();
			
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
	
	*/
	public static class rideOffer{
		
		public  int requestID; //ride id			1
		public  int user_id; //ride id			1
		public  int leaderBoardRank; //ride id			1
	}
	
	
	
	public static class ride{
		public  String start; //start time		2
		public  int ride_id; //ride id			1
		public  int uid;//driver id				6
		public  String car; //car.				9	
	
		public String getCar(){
			return this.car;
		}	
	}
	
	
}