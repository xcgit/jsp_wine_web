package cart_wine;

import java.sql.ResultSet;
import java.sql.SQLException;

import DBconnect.DBconnectSql;

public class wine {
	private String wId;
	private String wName;
	private String wPrice;
	private String wClassify;
	private String wPlace;
	private String wDegree;
	private String wBrand;
	private String wTaste;
	private String wFormat;
	private String wPicture;
	
	
	public void get_wine(DBconnectSql db) throws SQLException{
		ResultSet rs = db.select();
		
		while(rs.next()){
			
				wId = rs.getString("wId");
				wName=rs.getString("wName");
				wPrice=rs.getString("wPrice");
				wClassify=rs.getString("wClassify");
				wPlace=rs.getString("wPlace");
				wDegree=rs.getString("wDegree");
				wFormat=rs.getString("wFormat");
				wTaste=rs.getString("wTaste");
				wBrand=rs.getString("wBrand");
				wPicture=rs.getString("wPicture");
				wName=rs.getString("wName");
				wName=rs.getString("wName");
				
				
		}
		
		}


	public String getwId() {
		return wId;
	}


	public void setwId(String wId) {
		this.wId = wId;
	}


	public String getwName() {
		return wName;
	}


	public void setwName(String wName) {
		this.wName = wName;
	}


	public String getwPrice() {
		return wPrice;
	}


	public void setwPrice(String wPrice) {
		this.wPrice = wPrice;
	}


	public String getwClassify() {
		return wClassify;
	}


	public void setwClassify(String wClassify) {
		this.wClassify = wClassify;
	}


	public String getwPlace() {
		return wPlace;
	}


	public void setwPlace(String wPlace) {
		this.wPlace = wPlace;
	}


	public String getwDegree() {
		return wDegree;
	}


	public void setwDegree(String wDegree) {
		this.wDegree = wDegree;
	}


	public String getwBrand() {
		return wBrand;
	}


	public void setwBrand(String wBrand) {
		this.wBrand = wBrand;
	}


	public String getwTaste() {
		return wTaste;
	}


	public void setwTaste(String wTaste) {
		this.wTaste = wTaste;
	}


	public String getwFormat() {
		return wFormat;
	}


	public void setwFormat(String wFormat) {
		this.wFormat = wFormat;
	}


	public String getwPicture() {
		return wPicture;
	}


	public void setwPicture(String wPicture) {
		this.wPicture = wPicture;
	}
	}
	
	
	
	

