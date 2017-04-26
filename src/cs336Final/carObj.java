package cs336Final;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class carObj {

	public carObj() {
		// TODO Auto-generated constructor stub
	}
	public static Boolean addCar(LoginObject user, String Make, String Model, String Year, String VIM, String n, String LID){
		
		LID = LID.trim();
		try
		{
			String url = "jdbc:mysql://cs336dbinstance.cxvvrbjkmr4a.us-west-2.rds.amazonaws.com:3306";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "omerdeepcal", "wegotthis");
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			System.out.println("Trying to insert" + Make + Model + Year + VIM + n);
			String UID = Integer.toString(user.getUser_id());
			 
			//Populate SQL statement with an actual query. It returns a single number. The number of beers in the DB.
			String str = "INSERT INTO app.Car(Lincense_Plate, make, model, year,VIM,Number_Seats,UID) VALUES";
			str += "(\"" + LID +"\",";
			str += "\"" + Make +"\",";
			str += "\"" + Model +"\",";
			str += "" + Year + ",";
			str += "\"" + VIM + "\",";
			str += "" + n + ",";
			str += "" + UID + ")";					
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
	
	
	
	public static ArrayList<car> getCars(LoginObject user){
		
		if(user==null){
			System.out.println("USER IS NULL");
		}
		
		System.out.println("Here !!" + user.getUser_id());
		
		try
		{
			String url = "jdbc:mysql://cs336dbinstance.cxvvrbjkmr4a.us-west-2.rds.amazonaws.com:3306";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "omerdeepcal", "wegotthis");
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			String UID = Integer.toString(user.getUser_id());
			 
			//Populate SQL statement with an actual query. It returns a single number. The number of beers in the DB.
			String str = "Select * From app.Car Where UID = " + user.getUser_id();	
			System.out.print(str);
			//Run the query against the DB
			ResultSet rs = stmt.executeQuery(str);
			ArrayList<car> al = new ArrayList<car>();
			while (rs.next()) {      //for each row in the table   
				
				car c = new car(); 
				for(int i = 1; i < 8;i++) {
					if(i==1){
						c.Lincense = rs.getString(i);
					}else if(i==2){
						c.Make = rs.getString(i);;
					}else if(i==3){
						c.Model = rs.getString(i);;
					}else if(i==4){
						c.year = Integer.valueOf(rs.getString(i));
					}else if (i==7){
						c.user_id = Integer.valueOf(rs.getString(i));
					}
		        }
				al.add(c);
			}
			con.close();
			
			return al;
		}
		
		catch (Exception e)
		{
			System.out.println(e.toString());
			return null;
		}	
	}
		
	
	
	public static Boolean deleteCar(String LID){
		System.out.println("Deleting a car");
		try
		{
			String url = "jdbc:mysql://cs336dbinstance.cxvvrbjkmr4a.us-west-2.rds.amazonaws.com:3306";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "omerdeepcal", "wegotthis");
			Statement stmt = con.createStatement();
			String str = "DELETE FROM app.Car WHERE Lincense_Plate = \"" + LID +"\";";	
			boolean rs = stmt.execute(str);
			System.out.println(str);
			System.out.println(rs);
			con.close();
			return rs;
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
			return false;
		}	
	}
	
	
	
	

	
	public static car getCar(String lin){
		lin = lin.trim();
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
			String str = "Select * From app.Car Where Lincense_Plate Like \"%"
					+ lin + "%\"";
				
			System.out.print(str);
			//Run the query against the DB
			ResultSet rs = stmt.executeQuery(str);
			ArrayList<car> al = new ArrayList<car>();
			while (rs.next()) {      //for each row in the table   
				
				car c = new car(); 
				for(int i = 1; i < 8;i++) {
					if(i==1){
						c.Lincense = rs.getString(i);
					}else if(i==2){
						c.Make = rs.getString(i);;
					}else if(i==3){
						c.Model = rs.getString(i);;
					}else if(i==4){
						c.year = Integer.valueOf(rs.getString(i));
					}else if (i==7){
						c.user_id = Integer.valueOf(rs.getString(i));
					}
		        }
				al.add(c);
			}
			
			con.close();
			return al.get(0);
		}
		
		catch (Exception e)
		{
			System.out.println(e.toString());
			return null;
		}	
	}
		
	
	


	public static class car{
		public int user_id;
		public String Make;
		public String Model;
		public String Lincense; 
		public int year;
		public car(){}
	}

}


