package com.raoudmarket.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.raoudmarket.model.AdminModel;

@Repository
public class AdminLoginDaoImpl {

	@Autowired
	JdbcTemplate template;
	
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
}
