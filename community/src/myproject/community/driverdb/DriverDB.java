package myproject.community.driverdb;
import java.sql.*;
public class DriverDB {
	
	//드라이버 로딩, db연결 메서드
	public static Connection driverdbcon() throws ClassNotFoundException, SQLException{
		Connection recon = null; 
		Class.forName("com.mysql.jdbc.Driver");
		
		String jdbcDriver = "jdbc:mysql://localhost:3306/community?useUnicode=true&characterEncoding=UTF-8";
		String dbUser = "dbid02rhc";
		String dbPass = "dbpw02rhc";
		recon = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		return recon;
	}
}
	
