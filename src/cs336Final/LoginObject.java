package cs336Final;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LoginObject 
{
	private int user_id;
	private int typeofuser;
	private String username;
	private String password;
	private String email;
	private String address;
	private String phone;
	private int age;
	private int active;
	
	public LoginObject(int user_id, int typeofuser, String username, String password, String email, String address, String phone, int age, int active)
	{
		this.user_id = user_id;
		this.typeofuser = typeofuser;
		this.username = username;
		this.password = password;
		this.email = email;
		this.address = address;
		this.active = active;
		this.age = age;
		this.phone = phone;
	}
	
	public void setUsername(String username)
	{
		this.username = username;
	}
	
	public void setPassword(String password)
	{
		this.password = password;
	}
	
	public String getUsername()
	{
		return this.username;
	}
	public String getPassword()
	{
		return this.password;
	}
	
	public int getUserType()
	{
		return this.typeofuser;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	
	
	/*********
	 * ----------------------
	 * Static Methods
	 */
	
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
			String phone = result.getString(7);
			int age = result.getInt(8);
			int x = result.getInt(9);
			return new LoginObject(a, b , n , p , e , add, phone, age, x);
			
			
		}
		
		catch (Exception e)
		{
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
	
	public static String getUserName(int uid){
		
		try{
			String str = "SELECT username FROM app.User where user_id = " + uid;
		
			ResultSet result = sql.query(str).get();
			String name = null;
			while(result.next()){
				name = result.getString(1);
				// TODO Auto-generated catch block
			}
			return name;
		} catch (Exception e) {
				e.printStackTrace();
				return null;
		}
		
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
	public static void lock(String username)
	{
		sql.upd("UPDATE app.User SET active='0' WHERE username='"+username+"'");
	}
	
	public static ArrayList<LoginObject> getUsers() throws SQLException
	{
		ArrayList<LoginObject> o = new ArrayList<>();
		ResultSet result = sql.query("Select * from app.User").get();
		
		while (result.next())
		{
			int a = result.getInt(1);
			int b = result.getInt(2);
			String n = result.getString(3);
			String p = result.getString(4);
			
			String e = result.getString(5);
			String add = result.getString(6);
			String phone = result.getString(7);
			int age = result.getInt(8);
			int x = result.getInt(9);
			o.add(new LoginObject(a, b , n , p , e , add, phone, age, x));
		}
		return o;
	}
	public static void lock(String username, int active)
	{
		sql.upd("UPDATE app.User SET active='"+active+"' WHERE username='"+username+"'");
	}
	public static void reset(String username)
	{
		sql.upd("UPDATE app.User SET password='password' WHERE username='"+username+"'");
	}
	
	
	public static boolean setInactive(LoginObject l)
	{
		return false;
		
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	 
}
