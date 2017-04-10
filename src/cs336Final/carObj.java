package cs336Final;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class carObj {

	public carObj() {
		// TODO Auto-generated constructor stub
	}
	public static Boolean addCar(LoginObject user, String Make, String Model, String Year, String VIM, String n, String LID){
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
			str += "(" + LID.hashCode() +",";
			str += "\"" + Make +"\",";
			str += "\"" + Model +"\",";
			str += "" + Year + ",";
			str += "\"" + VIM + "\",";
			str += "" + n + ",";
			str += "" + UID + ")";					
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

}
