package cs336Final;

public class LoginObject 
{
	private String username;
	private String password;
	private boolean isAdmin;
	
	public LoginObject(String username, String password, boolean isAdmin)
	{
		this.username = username;
		this.password = password;
		this.isAdmin = isAdmin;
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
	
	public boolean getIsAdmin()
	{
		return this.isAdmin;
	}
}
