package util.dbhelper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBconn {
	private static Connection dbConn;
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
		if(dbConn == null){			
			String driverName="com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306";
			String id = "test1111";
			String pwd ="test1111";
			
			Class.forName(driverName);		
			dbConn = DriverManager.getConnection(url, id, pwd);
		}				
		return dbConn;
	}
	
	
	public static void close() throws SQLException{
		if(dbConn!=null){
			if(!dbConn.isClosed()){
				dbConn.close();
			}			
		}
		dbConn = null;			
	}
	
}
