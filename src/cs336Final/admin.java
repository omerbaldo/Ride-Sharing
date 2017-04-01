package cs336Final;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class admin 
{
	public static ArrayList<String> getUserNames() throws SQLException
	{
		ArrayList<String> o = new ArrayList<String>();
		ResultSet r = sql.query("Select username from app.User").get();
		
		while (r.next())
		{
			o.add(r.getString(1));
		}
		return o;
		
		
	}
	public static ArrayList<String> getUserPasswords() throws SQLException
	{
		ArrayList<String> o = new ArrayList<String>();
		ResultSet r = sql.query("Select password from app.User").get();
		
		while (r.next())
		{
			o.add(r.getString(1));
		}
		return o;
		
	}

}
