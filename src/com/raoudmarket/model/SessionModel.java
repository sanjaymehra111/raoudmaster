package com.raoudmarket.model;

import lombok.Data;

@Data
public class SessionModel {

	String session_id;
	String user_id;
	String type;
	String menu;
	long time;
	
	
}
