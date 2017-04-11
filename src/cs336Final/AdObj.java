package cs336Final;

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
	
	
	
	
}
