package cs336Final;

public class LoginObject 
{
	private int user_id;
	private int typeofuser;
	private String username;
	private String password;
	private String email;
	private String address;
	
	public LoginObject(int user_id, int typeofuser, String username, String password, String email, String address)
	{
		this.setUser_id(user_id);
		this.typeofuser = typeofuser;
		this.username = username;
		this.password = password;
		this.setEmail(email);
		this.setAddress(address);
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
}
