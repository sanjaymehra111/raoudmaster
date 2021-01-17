package com.raoudmarket.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.raoudmarket.dao.AdminLoginDaoImpl;

@Controller
public class LoginController {

	@Autowired
	PasswordEncryption pdc;
	
	@Autowired
	AdminLoginDaoImpl aldao;
	
	@Autowired
	SessionController sccot;
	
	@ResponseBody
	@PostMapping("AdminLoginCheck")
	public String AdminLoginCheck(@RequestParam String id, String pwd, HttpSession session) {
		
		String new_pwd = pdc.PasswordEncrypt(pwd); 
		String check = aldao.AdminLoginCheck(id, new_pwd);
		if(check != null) {
			String sc_msg = sccot.CreateSession(id, "admin", session);
			if(sc_msg == "success") {
				return "success";
			}
			else
				return "error";
		}
		else
			return "Login Error";
	}
	
	@ResponseBody
	@PostMapping("UserLoginCheck")
	public String UserLoginCheck(@RequestParam String id, String pwd, HttpSession session) {
		
		String new_pwd = pdc.PasswordEncrypt(pwd); 
		String check = aldao.UserLoginCheck(id, new_pwd);
		if(check != null) {
			String sc_msg = sccot.CreateSession(id, "user", session);
			if(sc_msg == "success") {
				return "success";
			}
			else
				return "error";
		}
		else
			return "Login Error";
	}


}
