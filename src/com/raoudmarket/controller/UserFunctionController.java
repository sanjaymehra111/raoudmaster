package com.raoudmarket.controller;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
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
			Number number = ufdao.CreateUserGroup(name, contact, email, address, meter);
			ufdao.PreviousBillRecord(number.toString(), meter, reading, "1");
			return "success";
		}
		else
			return "Login Error";
	}

	@ResponseBody
	@PostMapping("CreateBill")
	public String CreateBill(@RequestParam String number, String reading, String date, HttpSession session) {
		String sn = sccot.CheckSession(session);
		if(sn == "success") {
			List<MeterModel> meter = ufdao.ViewMeterDetails(number);
			if(meter != null) {
				int pr;
				int charge=200;
				int unit=9;
				
				String[] dt_new = date.split("T");
				String[] dt_pr = meter.get(0).getDate().split("T");
				
				String diff = String.valueOf(ChronoUnit.MONTHS.between(LocalDate.parse(dt_pr[0]).withDayOfMonth(1),LocalDate.parse(dt_new[0]).withDayOfMonth(1)));
				
				System.out.println("diff : "+diff);
				if(diff != "0")
					charge = charge*Integer.parseInt(diff);
				
				System.out.println("chrg : "+charge);
				if(meter.get(0).getNew_reading() != null)
					pr = Integer.parseInt(meter.get(0).getNew_reading());
				else
					pr = Integer.parseInt(meter.get(0).getPrevious_reading());
				
				float cr = Float.parseFloat(reading);
				float total_amount = (cr-pr)*unit+charge;
				ufdao.CreateBill(meter.get(0).getUser_id(), number, reading, String.valueOf(pr), String.valueOf(total_amount), String.valueOf(charge), String.valueOf(unit), date);
			}
			else {
				return "meter_error";
			}
			return "success";
		}
		else
			return "Login Error";
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
			return "Login Error";
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
			return "Login Error";
		 
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
			return "Login Error";
	}
	
	
	@ResponseBody
	@PostMapping("ViewSpecificUser")
	public String ViewSpecificUser(@RequestParam String id, HttpSession session) {
		String sn = sccot.CheckSession(session);
		if(sn == "success") {
			List<UserModel> user = ufdao.ViewSpecificUser(id);
			Gson gson = new Gson();
			String finals = gson.toJson(user);
			return finals; 
		}
		else
			return "Login Error";
	}
	
	@ResponseBody
	@PostMapping("ViewSpecificUserMeterBill")
	public String ViewSpecificUserMeterBill(@RequestParam String id, HttpSession session) {
		String sn = sccot.CheckSession(session);
		if(sn == "success") {
			List<UserModel> user = ufdao.ViewSpecificUser(id);
			List<MeterModel> meter = ufdao.ViewSpecificUserMeterBill(id);
			Gson gson = new Gson();
			String finals1 = gson.toJson(user);
			String finals2 = gson.toJson(meter);
			String finals = '['+finals1+','+finals2+']';
			return finals; 
		}
		else
			return "Login Error";
	}
	
	
	
	@ResponseBody
	@PostMapping("UpdateUserGroup")
	public String UpdateUserGroup(@RequestParam String uid, String name, String contact, String email, String address, HttpSession session) {
		String sn = sccot.CheckSession(session);
		if(sn == "success") {
			ufdao.UpdateUserGroup(uid, name, contact, email, address);
			return "success"; 
		}
		else
			return "Login Error";
	}
	
	
	@ResponseBody
	@PostMapping("DeleteUserGroup")
	public String DeleteUserGroup(@RequestParam String uid, HttpSession session) {
		String sn = sccot.CheckSession(session);
		if(sn == "success") {
			ufdao.DeleteUserGroup(uid);
			return "success"; 
		}
		else
			return "Login Error";
	}
	
	@ResponseBody
	@PostMapping("MakePayment")
	public String MakePayment(@RequestParam String uid, String amount, HttpSession session) {
		String sn = sccot.CheckSession(session);
		if(sn == "success") {
			return "success"; 
		}
		else
			return "Login Error";
	}
	
	
	
}
