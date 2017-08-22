package order;

import java.sql.ResultSet;
import java.sql.SQLException;

import cart_wine.wine;

import DBconnect.DBconnectSql;

public class order {
	private String w_o_Id;
	private String w_user;
	private String w_wId;
	private int w_quant;
	private String w_place;
	private short state;
	

	
	
	public String getW_o_Id() {
		return w_o_Id;
	}




	public void setW_o_Id(String w_o_Id) {
		this.w_o_Id = w_o_Id;
	}




	public String getW_user() {
		return w_user;
	}




	public void setW_user(String w_user) {
		this.w_user = w_user;
	}




	public String getW_wId() {
		return w_wId;
	}




	public void setW_wId(String w_wId) {
		this.w_wId = w_wId;
	}




	public int getW_quant() {
		return w_quant;
	}




	public void setW_quant(int w_quant) {
		this.w_quant = w_quant;
	}




	public String getW_place() {
		return w_place;
	}




	public void setW_place(String w_place) {
		this.w_place = w_place;
	}




	public short getState() {
		return state;
	}




	public void setState(short state) {
		this.state = state;
	}

	
	public ResultSet get_order(short st){
		String sql = "select * from w_order where state='"+st+"';";
		System.out.println(sql);
		DBconnectSql db = new DBconnectSql();
		db.setSql(sql);

		ResultSet rst = db.select();
		return rst;
		
	}
	
	public ResultSet get_order_(String userId,short stat){
		String sql = "select * from w_order where w_user='"+userId+"' and state="+stat+";";
		System.out.println(sql);
		DBconnectSql db = new DBconnectSql();
		db.setSql(sql);

		ResultSet rst = db.select();
		return rst;
		
	}
	//Á½¸östate
	public ResultSet get_order_2(String userId,short stat,short stat_){
		String sql = "select * from w_order where w_user='"+userId+"' and (state="+stat+" or state = "+stat_+ ");";
		System.out.println(sql);
		DBconnectSql db = new DBconnectSql();
		db.setSql(sql);

		ResultSet rst = db.select();
		return rst;
		
	}
	

	public wine get_wine() throws SQLException{
		String sql = "select * from wine where wId='"+w_wId+"';";
		DBconnectSql db = new DBconnectSql();
		db.setSql(sql);
		ResultSet rs = db.select();
		wine w = new wine();
		while(rs.next()){
			w.setwId(rs.getString("wId"));
			w.setwName(rs.getString("wName"));
			w.setwPrice(rs.getString("wPrice"));
			w.setwClassify(rs.getString("wClassify"));
			w.setwPlace(rs.getString("wPlace"));
			w.setwDegree(rs.getString("wDegree"));
			w.setwFormat(rs.getString("wFormat"));
			w.setwTaste(rs.getString("wTaste"));
			w.setwBrand(rs.getString("wBrand"));
			w.setwPicture(rs.getString("wPicture"));
		
		}
		return w;
	}
	
	
	public Boolean upd_state(){
		String sql = "update  w_order set state="+state+" where w_o_Id='"+w_o_Id+"';";
		DBconnectSql db = new DBconnectSql();
		db.setSql(sql);
		return db.upd_wine();
		//System.out.println(sql);
		 
	}
	

	public Boolean add_order(){
		String sql = "insert into w_order value ('"+w_o_Id+"','"+w_user+"','"+w_wId
				+"',"+w_quant+",'"+w_place+"',"+state+");";
		DBconnectSql db = new DBconnectSql();
		db.setSql(sql);
		
	//	System.out.println(sql);
		//return null;
		return db.add_wine();
		
	}
	
	public ResultSet get_order() throws SQLException{
		String sql = "select * from w_order where w_o_Id='"+w_o_Id+"';";
		DBconnectSql db =new DBconnectSql();
		db.setSql(sql);
		ResultSet rs = db.select();
		
		
		return rs;
	}

	
	public Boolean del_order(){
		String sql = "delete from w_order where w_o_Id='"+w_o_Id+"';";
		DBconnectSql db = new DBconnectSql();
		db.setSql(sql);
		return db.del_wine();
		
	}
	
}
