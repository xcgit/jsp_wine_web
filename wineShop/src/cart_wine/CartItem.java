package cart_wine;

import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.LinkedHashMap;
import java.util.Map;

import DBconnect.DBconnectSql;

public class CartItem {
	private String  cQuantity;
	private String  c_w_Id;
	private String c_u_Id;
	
	int i = 0;
	
	public boolean add_cart() throws SQLException{
		DBconnectSql db = new DBconnectSql();
		String sql = "select cQuantity from cartItem where c_u_Id='"+c_u_Id+"' and c_w_Id='"+c_w_Id+"';";
		//System.out.println(sql);
		db.setSql(sql);	
		ResultSet rs = db.select();
		int q_=0;
		if(rs.next()){
			q_= Integer.parseInt(rs.getString(1));
		}
		int q = Integer.parseInt(cQuantity)+q_;
		
		if(q!=Integer.parseInt(cQuantity)){
		
		sql = "update  cartItem set cQuantity="+q+" where c_u_Id='"+c_u_Id+"' and c_w_Id='"+c_w_Id+"';";
		System.out.println(sql);
		
		}else{
			sql = "insert into cartItem value("+q+",'"+c_w_Id+"','"+c_u_Id+"');";
			//System.out.println(sql);
		}
		
		db.setSql(sql);
		db.upd_wine();
		
		
			/*try {
				if(rs.next()){
					String cQuan = rs.getString(1);
					sql = "update from cartItem set cQuantity="+(Integer.parseInt(cQuan)+Integer.parseInt(cQuantity))+";";
					System.out.println("124356");
					return db.add_wine();
				}else{
					int q = Integer.parseInt(cQuantity);
					sql = "insert into cartItem value("+q+",'"+c_w_Id+"','"+c_u_Id+"');";
					db.setSql(sql);	
					db.add_wine();
					System.out.println("222124356");
					return db.add_wine();
					
				}
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
			return true;
		
		
		
		
		
	}
	

	

public Map<String,wine> getW() throws SQLException{
	Map<String,wine> map=new LinkedHashMap<String,wine>();
	DBconnectSql db = new DBconnectSql();
	String sql = "select * from cartItem where c_u_Id='"+c_u_Id+"';";
	db.setSql(sql);
	ResultSet rs = db.select();
	int i = 0;
	
	while(rs.next()){
		String s ="";
		i = i +1;
		s= s+i;
		 sql="select * from wine where wId='"+rs.getString("c_w_Id")+"';";
		// System.out.println(sql);
		 db.setSql(sql);
		 wine w =new wine();
		ResultSet re = db.select();
		while(re.next()){
			w.setwId(re.getString("wId"));
			w.setwName(re.getString("wName"));
			w.setwClassify(re.getString("wClassify"));
			w.setwBrand(re.getString("wBrand"));
			w.setwDegree(re.getString("wDegree"));
			w.setwFormat(re.getString("wFormat"));
			w.setwPrice(re.getString("wPrice"));
			w.setwPlace(re.getString("wPlace"));
			w.setwTaste(re.getString("wTaste"));
			w.setwPicture(re.getString("wPicture"));
		} 
		map.put(s, w);
		
		// System.out.println(map.get(s).getwName());
	}
	
	
	return map;
	
}

//根据id 获取cartitem的数量
	public String quantity(String c_w_Id) throws SQLException{
		
		String sql = "select cQuantity from cartItem where c_u_Id='"+c_u_Id+"' and c_w_Id='"+c_w_Id+"';";
		DBconnectSql db =new DBconnectSql();
		db.setSql(sql);
		ResultSet rs = db.select();
		if(rs.next()){
			return rs.getString("cQuantity");
		}
		 return null;
		
	}

	public Boolean del_cart(String c_u_Id,String c_w_Id ){
		String sql = "delete from cartItem where c_u_Id='"+c_u_Id+"' and c_w_Id='"+c_w_Id+"';";
		DBconnectSql db = new DBconnectSql();
		//System.out.print(sql);
		db.setSql(sql);
		return db.del_wine();
	}
	
		
//添加合计方法
	
	public float mul(String s,String q){
		return Float.parseFloat(s)*Float.parseFloat(q);
	} 
	
	public String getcQuantity() {
		return cQuantity;
	}

	public void setcQuantity(String cQuantity) {
		this.cQuantity = cQuantity;
	}

	public String getC_w_Id() {
		return c_w_Id;
	}

	public void setC_w_Id(String c_w_Id) {
		this.c_w_Id = c_w_Id;
	}

	public String getC_u_Id() {
		return c_u_Id;
	}

	public void setC_u_Id(String c_u_Id) {
		this.c_u_Id = c_u_Id;
	}

	
}



