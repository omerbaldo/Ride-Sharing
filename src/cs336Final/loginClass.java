package cs336Final;

 
import java.util.*;
import java.sql.*;
//import javax.servlet.http.*;
//import javax.servlet.*;

public class loginClass 
{
	public static boolean login (String username, String password)
	{
		try
		{	String str = "SELECT user_id FROM app.User where password = '"+password.trim() +"' and username = '"+username.trim()+"'";
			//Run the query against the DB
		
			
			ResultSet result = sql.query(str).get();
			
			
			
			if (getRows(result) == 0)
			{
				return false;
			}
			else
			{
				return true;
			}
			
		}
		
		catch (Exception e)
		{
			System.out.println(e.toString());
			return false;
		}
		
	}
	public static LoginObject getUser(String username, String password)
	{
		LoginObject o = null;
		try
		{	
			String str = "SELECT * FROM app.User where password = '"+password.trim() +"' and username = '"+username.trim()+"'";
			
			ResultSet result = sql.query(str).get();
			result.next();
			
			int a = result.getInt(1);
			int b = result.getInt(2);
			String n = result.getString(3);
			String p = result.getString(4);
			
			String e = result.getString(5);
			String add = result.getString(6);
			int x = result.getInt(9);
			return new LoginObject(a, b , n , p , e , add, x);
			
			
		}
		
		catch (Exception e)
		{
			System.out.println(e);
			return o;
		}
		
	}
	
	private static int getRows(ResultSet res)
	{
	    int totalRows = 0;
	    try {
	        res.last();
	        totalRows = res.getRow();
	        res.beforeFirst();
	    } 
	    catch(Exception ex)  {
	        return 0;
	    }
	    return totalRows ;    
	}
	public static int userType (String username, String password)
	{
		try
		{	
			String str = "SELECT typeofuser FROM app.User where password = '"+password.trim() +"' and username = '"+username.trim()+"'";
			//Run the query against the DB
		
			ResultSet result = sql.query(str).get();
			result.next();
			return result.getInt(1);
			
		}
		
		catch (Exception e)
		{
			System.out.println(e.toString());
			return 3;
		}
		
	}
	
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
