package cs336Final;

public class LoginObject 
{
	private String username;
	private String password;
	private int userType;
	
	public LoginObject(String username, String password, int userType)
	{
		this.username = username;
		this.password = password;
		this.userType = userType;
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
		return this.userType;
	}
}
