package DBconnect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



public class DBconnectSql {
private String driveName = "com.mysql.jdbc.Driver";
private Connection con = null;
private String url = "jdbc:mysql://localhost:3306/wineShop?useUnicode = true&characterEncoding = gbk";
private String user = "root";
private String password = "root";
private String sql;
private Statement st = null;
private ResultSet rs = null;
	
private String s="234";

	public String getDriveName() {
	return driveName;
}

public void setDriveName(String driveName) {
	this.driveName = driveName;
}

public Connection getCon() {
	return con;
}

public void setCon(Connection con) {
	this.con = con;
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

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public String getSql() {
	return sql;
}

public void setSql(String sql) {
	this.sql = sql;
}

public ResultSet getRs() {
	return rs;
}

public void setRs(ResultSet rs) {
	this.rs = rs;
}

	public Statement connectSql(){
	
	
	try {
		Class.forName(getDriveName());
		con=DriverManager.getConnection(getUrl(), getUser(), getPassword());
		s="111";
		return con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
		 //ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE 是得到的结果集可以自由移动
	} catch (Exception e) {
		// TODO Auto-generated catch block
		s="333";
		e.printStackTrace();
	}
	return null;
}
	//查询
	public ResultSet select(){
		st = connectSql();
		try {
			rs =st.executeQuery(getSql());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
		
	} 
	
	public Boolean add_wine(){
		st = connectSql();
		try {
			int i = st.executeUpdate(sql);
			
			if(i==1){
				st.close();
				con.close();
				//System.out.println("添加成功");
				return true;
			}else {
				st.close();
				con.close();
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}
	
	public Boolean upd_wine(){
		st = connectSql();
		
		try {
			int i = st.executeUpdate(sql);
			if(i==1){
				st.close();
				con.close();
				//System.out.println("修改成功");
				return true;
				
			}else{
				st.close();
				con.close();
				return false;
			}	
		
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return false;
		
	}
	public Boolean del_wine(){
		st = connectSql();
		
		try {
			int i = st.executeUpdate(sql);
			if(i==1){
				st.close();
				con.close();
				//System.out.println("修改成功");
				return true;
				
			}else{
				st.close();
				con.close();
				return false;
			}	
		
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return false;
		
	}
	
	
	public String Sys(){
		System.out.println(s);
		return s;
	}
	
}
