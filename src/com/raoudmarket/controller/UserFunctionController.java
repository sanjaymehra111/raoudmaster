package com.raoudmarket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.raoudmarket.dao.UserFunctionDaoImpl;

@Controller
public class UserFunctionController {

	@Autowired
	UserFunctionDaoImpl ufdao; 
	
	@ResponseBody
	@PostMapping("CreateUserGroup")
	public String CreateUserGroup(@RequestParam String name, String contact, String email, String address, String meter, String reading) {
		//System.out.println(" name :"+ name+ " contact:"+ contact+ " email:"+ email + " address:"+ address+ " meter:"+ meter+ " reading:"+ reading);
		ufdao.CreateUserGroup(name, contact, email, address, meter, reading);
		return "success"; 
	}
	
}
