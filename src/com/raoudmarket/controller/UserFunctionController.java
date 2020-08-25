package com.raoudmarket.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.raoudmarket.dao.UserFunctionDaoImpl;
import com.raoudmarket.model.MeterModel;
import com.raoudmarket.model.UserModel;

@Controller
public class UserFunctionController {

	@Autowired
	UserFunctionDaoImpl ufdao; 
	
	@Autowired
	SessionController sccot;
	
	
	@ResponseBody
	@PostMapping("CreateUserGroup")
	public String CreateUserGroup(@RequestParam String name, String contact, String email, String address, String meter, String reading, HttpSession session) {
		String sn = sccot.CheckSession(session);
		if(sn == "success") {
			ufdao.CreateUserGroup(name, contact, email, address, meter, reading);
			return "success";
		}
		else
			return "Login";
	}

	@ResponseBody
	@PostMapping("CreateBill")
	public String CreateBill(@RequestParam String number, String reading, String date, HttpSession session) {
		String sn = sccot.CheckSession(session);
		if(sn == "success") {
			ufdao.CreateBill(number, reading, date);
			return "success";
		}
		else
			return "Login";
	}
	
	@ResponseBody
	@PostMapping("CreateMeter")
	public String CreateMeter(@RequestParam String number, String shop, String charge, HttpSession session) {
		String sn = sccot.CheckSession(session);
		if(sn == "success") {
			ufdao.CreateMeter(number, shop, charge);
			return "success";
		}
		else
			return "Login";
	}

	@ResponseBody
	@PostMapping("ViewUserGroup")
	public String ViewUserGroup(HttpSession session) {
		String sn = sccot.CheckSession(session);
		if(sn == "success") {
			List<UserModel> user = ufdao.ViewAllUserGroup();
			Gson gson = new Gson();
			String finals = gson.toJson(user);
			return finals;
		}
		else
			return "Login";
		 
	}
	
	@ResponseBody
	@PostMapping("ViewMeterList")
	public String ViewMeterList(HttpSession session) {
		String sn = sccot.CheckSession(session);
		if(sn == "success") {
			List<MeterModel> user = ufdao.ViewMeterList();
			Gson gson = new Gson();
			String finals = gson.toJson(user);
			return finals; 
		}
		else
			return "Login";
	}
}
