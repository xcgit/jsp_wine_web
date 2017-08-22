package Filter;

import java.sql.ResultSet;

import DB.connMysql;

public class filter {
	private String classify="";
	private String price="";
	private String degree="";
	
	
	//Àà±ð¹ýÂË
	public ResultSet filte(){
		if(classify.equals("")){
			
		}
		
		String sql = "select * from wine where classify ='"+classify+"';";
		connMysql c = new connMysql();
		c.setSql(sql);
		return c.select();
	} 
}
