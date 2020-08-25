package com.raoudmarket.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@Autowired
	SessionController sccot;
	
	@RequestMapping("/")
	public String IndexPage(HttpSession session, HttpServletResponse response) {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		String sn = sccot.CheckSession(session);
		if(sn != null)
			return "admindashboard";
		else
			return "Login";
	}

	@RequestMapping("login")
	public String Login(HttpSession session, HttpServletResponse response){
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		String sn = sccot.CheckSession(session);
		if(sn != null)
			return "admindashboard";
		else
			return "Login";
	}
	
	@RequestMapping("admincreatebill")
	public String AdminCreateBill(HttpSession session, HttpServletResponse response){
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		return "AdminCreateBill"; 
	}
	
	@RequestMapping("admincreatemeter")
	public String AdminCreateMeter(HttpSession session, HttpServletResponse response){
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		return "AdminCreateMeter"; 
	}
	
	@RequestMapping("admincreateusergroup")
	public String AdminCreateUserGroup(HttpSession session, HttpServletResponse response){
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		return "AdminCreateUserGroup"; 
	}
	
	@RequestMapping("admindashboard")
	public String AdminDashboard(HttpSession session, HttpServletResponse response){
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		return "AdminDashboard"; 
	}
	
	@RequestMapping("adminmeterlist")
	public String AdminMeterList(HttpSession session, HttpServletResponse response){
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		return "AdminMeterList"; 
	}
	
	@RequestMapping("adminusergroup")
	public String AdminUserGroup(HttpSession session, HttpServletResponse response){
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		return "AdminUserGroup"; 
	}
	
	@RequestMapping("companyreadingreport")
	public String CompanyReading_Report(HttpSession session, HttpServletResponse response){
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		return "CompanyReading_Report"; 
	}

	@RequestMapping("companyreadings")
	public String CompanyReadings(HttpSession session, HttpServletResponse response){
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		return "CompanyReadings"; 
	}
	
	@RequestMapping("createshopdetails")
	public String CreateShopDetails(HttpSession session, HttpServletResponse response){
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		return "CreateShopDetails"; 
	}
	
	@RequestMapping("downloadmeterreport")
	public String DownloadMeterReport(HttpSession session, HttpServletResponse response){
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		return "DownloadMeterReport"; 
	}
	
	@RequestMapping("downloadreport")
	public String DownloadReport(HttpSession session, HttpServletResponse response){
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		return "DownloadReport"; 
	}
	
	@RequestMapping("viewshopdetails")
	public String ViewShopDetails(HttpSession session, HttpServletResponse response){
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		return "ViewShopDetails"; 
	}
	

	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "Login";
	}

}
