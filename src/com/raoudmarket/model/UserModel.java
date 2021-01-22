package com.raoudmarket.model;

import lombok.Data;

@Data
public class UserModel {

	String id;
	String name;
	String contact;
	String email;
	String address;
	String meter_number;
	String previous_reading;
	String status;
	String date;
	String updated_date;
	
	String password;
	
}
