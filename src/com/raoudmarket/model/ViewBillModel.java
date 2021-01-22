package com.raoudmarket.model;

import lombok.Data;

@Data
public class ViewBillModel {
	String id;
	String user_id;
	String user_name;
	String product_name;
	String charge;
	String amount;
	String date;
	String image;
}
