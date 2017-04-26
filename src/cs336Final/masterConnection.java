package cs336Final;
import java.sql.Connection;
import java.sql.DriverManager;

public class masterConnection {

	static Connection conn;
	
	public static void init(){
		try{
			if(conn == null){
				String url = "jdbc:mysql://cs336dbinstance.cxvvrbjkmr4a.us-west-2.rds.amazonaws.com:3306";
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(url, "omerdeepcal", "wegotthis");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public masterConnection() {
		// TODO Auto-generated constructor stub
	}

}
