package cs336Final;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Optional;

public class AdObj
{
	int id;
	int timesSeen;
	String title;
	
	public AdObj(int id, int timesSeen, String title)
	{
		this.id =id;
		this.timesSeen = timesSeen;
		this.title = title;
	}
	
	public int getId()
	{
		return this.id;
	}
	
	public void setId(int id)
	{
		this.id = id;
	}
	public int getSeen()
	{
		return this.timesSeen;
	}
	
	public void setSeen(int seen)
	{
		this.timesSeen = seen;
	}
	
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getTitle()
	{
		return this.title;
	}
	
	public static ArrayList<AdObj> getAdList() throws SQLException
	{
		Optional<ResultSet> result = sql.query("SELECT * FROM app.Advertisement");
		
		if (!result.isPresent())
			return new ArrayList<AdObj>();
		else
		{
			ResultSet r = result.get();
			
			ArrayList<AdObj> ret = new ArrayList<>();
			while (r.next())
			{
				ret.add(new AdObj(r.getInt(1), r.getInt(2), r.getString(3)));
			}
			return ret;
		}
		
	}
	
	public static void addAd(String title)
	{
		String q = "INSERT INTO app.Advertisement (Num_Appearances, Ad_Title) VALUES ('0', '"+title+"')";
		
		try
		{
			
		
			String url = "jdbc:mysql://cs336dbinstance.cxvvrbjkmr4a.us-west-2.rds.amazonaws.com:3306";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "omerdeepcal", "wegotthis");
			//Create a SQL statement
			
			PreparedStatement stmt = con.prepareStatement("INSERT INTO app.Advertisement (Num_Appearances, Ad_Title) VALUES (?,?)");
			
			stmt.setInt(1, 0);
			stmt.setString(2, title);	
			stmt.executeUpdate();
				
		}
		
		catch (Exception e)
		{
			System.out.println(e.toString());
			
		}
		
		sql.upd(q);
		
	}
	public static void deleteAd(int id)
	{
		String q = "DELETE FROM app.Advertisement WHERE Ad_Id='"+id+"'";
		sql.upd(q);
		
	}
	
	public static String getRandomAd() throws SQLException
	{
		ArrayList<AdObj> ads = getAdList();
		
		if (ads.size() == 0)
		{
			return "";
		}
		else
		{
			AdObj serve = ads.get(0);
			
			for (AdObj x: ads)
			{
				if (x.getSeen() > serve.getSeen())
					serve = x;
			}
			
			int nw = serve.getSeen() + 1;
			sql.upd("UPDATE app.Advertisement SET Num_Appearances="+Integer.toString(nw)+" WHERE Ad_Id="+serve.getId());
			
			return serve.getTitle();
		}
			
	}
}
