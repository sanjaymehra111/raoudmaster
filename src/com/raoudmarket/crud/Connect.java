package com.raoudmarket.crud;

import org.springframework.jdbc.core.JdbcTemplate;

public class Connect {

public JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
}
