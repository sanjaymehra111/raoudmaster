package com.raoudmarket.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

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
	
}
