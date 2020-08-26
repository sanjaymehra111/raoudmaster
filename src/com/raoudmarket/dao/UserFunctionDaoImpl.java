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

import com.raoudmarket.model.MeterModel;
import com.raoudmarket.model.UserModel;

@Repository
public class UserFunctionDaoImpl {

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
	
	public String GetDateTime()
	{
		Date today = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    df.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
	    String date = df.format(today);
	    return date;
	}
	
	
	public int CreateUserGroup(String name, String contact, String email, String address, String meter, String reading) {
		String date = GetDateTime();
		String query= "insert into user_group (name, contact, email, address, meter, reading, date) values('"+name+"', '"+contact+"', '"+email+"', '"+address+"', '"+meter+"', '"+reading+"', '"+date+"')";
		return template.update(query);
	}
	
	public int CreateBill(String number, String reading, String date) {
		String dates = GetDate();
		if(date.length()>5)
			dates = date;
		String query= "insert into meter_bill (number, reading, date) values('"+number+"', '"+reading+"', '"+dates+"')";
		return template.update(query);
	}
	
	public int CreateMeter(String number, String shop, String charge) {
		String dates = GetDate();
		String query= "insert into meter (number, shop_name, charge, date) values('"+number+"', '"+shop+"', '"+charge+"', '"+dates+"')";
		return template.update(query);
	}
	
	
	public List<UserModel> ViewAllUserGroup() {
		List<UserModel> query = template.query("select * from user_group", new RowMapper<UserModel>() {

			@Override
			public UserModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				UserModel um = new UserModel();
				um.setId(rs.getString("id"));
				um.setName(rs.getString("name"));
				um.setContact(rs.getString("contact"));
				um.setEmail(rs.getString("email"));
				um.setAddress(rs.getString("address"));
				um.setMeter(rs.getString("meter"));
				um.setReading(rs.getString("reading"));
				um.setStatus(rs.getString("status"));
				um.setDate(rs.getString("date"));
				return um;
			}
			
		});
		
		return query;
	}
	
	
	public List<UserModel> ViewMeterDetails(String meter) {
		List<UserModel> query = template.query("select * from user_group where meter = '"+meter+"'", new RowMapper<UserModel>() {

			@Override
			public UserModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				UserModel um = new UserModel();
				um.setId(rs.getString("id"));
				um.setName(rs.getString("name"));
				um.setContact(rs.getString("contact"));
				um.setEmail(rs.getString("email"));
				um.setAddress(rs.getString("address"));
				um.setMeter(rs.getString("meter"));
				um.setReading(rs.getString("reading"));
				um.setStatus(rs.getString("status"));
				um.setDate(rs.getString("date"));
				return um;
			}
			
		});
		
		return query.size()>1 ? query:null;
	}
	
	
	public List<MeterModel> ViewMeterList() {
		List<MeterModel> query = template.query("select * from meter", new RowMapper<MeterModel>() {

			@Override
			public MeterModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				MeterModel mm = new MeterModel();
				mm.setId(rs.getString("id"));
				mm.setNumber(rs.getString("number"));
				mm.setShop_name(rs.getString("shop_name"));
				mm.setCharge(rs.getString("charge"));
				mm.setStatus(rs.getString("status"));
				mm.setDate(rs.getString("date"));
				return mm;
			}
			
		});
		
		return query;
	}
	
}
