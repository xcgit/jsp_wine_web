package DB;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.sql.Statement;



public class connMysql {
	

	private String driverName= "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/wineShop?useUnicode = true&characterEncoding = gbk";
	private String user = "root";
	private String paswrd = "root";
	private Connection con = null;
	private Statement st =null;
	private ResultSet rs = null;
	private String sql;
	
	public  String s;
	
	
	public String getDriverName() {
		return driverName;
	
		
	}

	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPaswrd() {
		return paswrd;
	}

	public void setPaswrd(String paswrd) {
		this.paswrd = paswrd;
	}

	public Connection getCon() {
		return con;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	public Statement getSt() {
		return st;
	}

	public void setSt(Statement st) {
		this.st = st;
	}

	public ResultSet getRs() {
		return rs;
	}

	public void setRs(ResultSet rs) {
		this.rs = rs;
	}


	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}
	
	
	//链接数据库
	public Statement connec(){
		
		
	
			try {
				Class.forName(getDriverName());
				con =  DriverManager.getConnection(getUrl(),getUser(),getPaswrd());
				s="12";
				return con.createStatement();
			}  catch (Exception e) {
				// TODO Auto-generated catch block
				s="34";
				e.printStackTrace();
				return null;
			}
	}
	
	
	
	
	//查询
	public ResultSet select(){
		
		st = connec();
		try {
			return st.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	
	}

	public Boolean update() throws SQLException{
		st = connec();
		int b = -1;
		 b = st.executeUpdate(sql);
		System.out.println(sql);
		if(b!=-1){
			return true;
		}else return false;
	}
	public Boolean insert() throws SQLException{
		st = connec();
		int b = -1;
		 b = st.executeUpdate(sql);
		System.out.println(sql);
		if(b!=-1){
			return true;
		}else return false;
	}
	
	
	
	
	
	
}
