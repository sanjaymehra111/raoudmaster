package com.raoudmarket.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;


import com.raoudmarket.model.AdminModel;
import com.raoudmarket.model.UserModel;
import com.raoudmarket.model.ViewBillModel;

@Repository
public class AdminLoginDaoImpl {

	@Autowired
	JdbcTemplate template;
	
	public String GetDate()
	{
		Date today = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	    df.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
	    String date = df.format(today);
	    return date;
	}
	
	public String AdminLoginCheck(String id, String pwd) {
		String sqlquery = "select * from admin where user_id='"+id+"' and password='"+pwd+"'";
		List<AdminModel> query = template.query(sqlquery, new RowMapper<AdminModel>() {

			@Override
			public AdminModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				AdminModel am = new AdminModel();
				am.setId(rs.getString("id"));
				am.setUser_id(rs.getString("user_id"));
				am.setPassword(rs.getString("password"));
				return am;
			}
			
		});
		
		if(query.size() > 0)
			return query.get(0).getUser_id().equals(id) && query.get(0).getPassword().equals(pwd) ? "success" : null;
		else
			return null;
	}
	
	
	/*
	 * public String UserLoginCheck(String id, String pwd) { String sqlquery =
	 * "select * from user where user_id='"+id+"' and password='"+pwd+"'";
	 * List<AdminModel> query = template.query(sqlquery, new RowMapper<AdminModel>()
	 * {
	 * 
	 * @Override public AdminModel mapRow(ResultSet rs, int arg1) throws
	 * SQLException { // TODO Auto-generated method stub AdminModel am = new
	 * AdminModel(); am.setId(rs.getString("id"));
	 * am.setUser_id(rs.getString("user_id"));
	 * am.setPassword(rs.getString("password")); return am; }
	 * 
	 * });
	 * 
	 * if(query.size() > 0) return query.get(0).getUser_id().equals(id) &&
	 * query.get(0).getPassword().equals(pwd) ? "success" : null; else return null;
	 * }
	 */	
	
	public String UserLoginCheck(String id, String pwd) {
		String sqlquery = "select * from user where name='"+id+"' and password='"+pwd+"'";
		List<UserModel> query = template.query(sqlquery, new RowMapper<UserModel>() {

			@Override
			public UserModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				UserModel am = new UserModel();
				am.setId(rs.getString("id"));
				am.setName(rs.getString("name"));
				am.setPassword(rs.getString("password"));
				return am;
			}
			
		});
		
		if(query.size() > 0)
			return query.get(0).getName().equals(id) && query.get(0).getPassword().equals(pwd) ? query.get(0).getId() : null;
		else
			return null;
	}

	public int CreateNewUser(String name, String pwd, String date) {
		date = GetDate();
		String query= "insert into user (name,password, date) values('"+name+"', '"+pwd+"', '"+date+"')";
		return template.update(query);
	}
	
	public List<UserModel> AdminViewUser()
	{
		List<UserModel> list = template.query("select * from user" , new RowMapper<UserModel>() {

			public UserModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				UserModel um = new UserModel();
				um.setId(rs.getString("id"));
				um.setName(rs.getString("name"));
				um.setDate(rs.getString("date"));
				return um;
			}
		});
		return list;
		
	}
	
	public List<ViewBillModel> adminviewbill() 
	{
	//	List<ViewBillModel> list = template.query("select * from user_spent group by date desc" , new RowMapper<ViewBillModel>() {
		List<ViewBillModel> list = template.query("SELECT user_spent.id, user_spent.user_id, user_spent.user_name, user_spent.product_name, user_spent.amount, user_spent.date, product_details.image FROM user_spent INNER JOIN product_details WHERE user_spent.`product_name` = `product_details`.`name` GROUP BY user_spent.`id`" , new RowMapper<ViewBillModel>() {
			public ViewBillModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				ViewBillModel v= new ViewBillModel();
				v.setId(rs.getString("id"));
				v.setUser_id(rs.getString("user_id"));
				v.setUser_name(rs.getString("user_name"));
				v.setProduct_name(rs.getString("product_name"));
				v.setCharge(rs.getString("amount"));
				v.setDate(rs.getString("date"));
				v.setImage(rs.getString("image"));
				return v;
			}
		});
		return list;

	}

}
