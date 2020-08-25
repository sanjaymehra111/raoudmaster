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
		//System.out.println("sesson"+ sn);
		if(sn == "success")
			return "AdminDashboard";
		else
			return "Login";
	}

	@RequestMapping("login")
	public String Login(HttpSession session, HttpServletResponse response){
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		String sn = sccot.CheckSession(session);
		if(sn == "success")
			return "AdminDashboard";
		else
			return "Login";
	}
	
	@RequestMapping("admincreatebill")
	public String AdminCreateBill(HttpSession session, HttpServletResponse response){
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		String sn = sccot.CheckSession(session);
		if(sn == "success")
			return "AdminCreateBill";
		else
			return "Login";
	}
	
	@RequestMapping("admincreatemeter")
	public String AdminCreateMeter(HttpSession session, HttpServletResponse response){
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		String sn = sccot.CheckSession(session);
		if(sn == "success")
			return "AdminCreateMeter"; 
		else
			return "Login";
	}
	
	@RequestMapping("admincreateusergroup")
	public String AdminCreateUserGroup(HttpSession session, HttpServletResponse response){
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		String sn = sccot.CheckSession(session);
		if(sn == "success")
			return "AdminCreateUserGroup"; 
		else
			return "Login";
	}
	
	@RequestMapping("admindashboard")
	public String AdminDashboard(HttpSession session, HttpServletResponse response){
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		String sn = sccot.CheckSession(session);
		if(sn == "success")
			return "AdminDashboard"; 
		else
			return "Login";
	}
	
	@RequestMapping("adminmeterlist")
	public String AdminMeterList(HttpSession session, HttpServletResponse response){
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		String sn = sccot.CheckSession(session);
		if(sn == "success")
			return "AdminMeterList"; 
		else
			return "Login";
	}
	
	@RequestMapping("adminusergroup")
	public String AdminUserGroup(HttpSession session, HttpServletResponse response){
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		String sn = sccot.CheckSession(session);
		if(sn == "success")
			return "AdminUserGroup"; 
		else
			return "Login";
	}
	
	@RequestMapping("companyreadingreport")
	public String CompanyReading_Report(HttpSession session, HttpServletResponse response){
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		String sn = sccot.CheckSession(session);
		if(sn == "success")
			return "CompanyReading_Report"; 
		else
			return "Login";
	}

	@RequestMapping("companyreadings")
	public String CompanyReadings(HttpSession session, HttpServletResponse response){
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		String sn = sccot.CheckSession(session);
		if(sn == "success")
			return "CompanyReadings"; 
		else
			return "Login";
	}
	
	@RequestMapping("createshopdetails")
	public String CreateShopDetails(HttpSession session, HttpServletResponse response){
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		String sn = sccot.CheckSession(session);
		if(sn == "success")
			return "CreateShopDetails"; 
		else
			return "Login";
	}
	
	@RequestMapping("downloadmeterreport")
	public String DownloadMeterReport(HttpSession session, HttpServletResponse response){
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		String sn = sccot.CheckSession(session);
		if(sn == "success")
			return "DownloadMeterReport"; 
		else
			return "Login";
	}
	
	@RequestMapping("downloadreport")
	public String DownloadReport(HttpSession session, HttpServletResponse response){
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		String sn = sccot.CheckSession(session);
		if(sn == "success")
			return "DownloadReport"; 
		else
			return "Login";
	}
	
	@RequestMapping("viewshopdetails")
	public String ViewShopDetails(HttpSession session, HttpServletResponse response){
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		String sn = sccot.CheckSession(session);
		if(sn == "success")
			return "ViewShopDetails"; 
		else
			return "Login";
	}
	

	@RequestMapping("logout")
	public String logout(HttpSession session){
		sccot.TerminateSession(session);
		return "Login";
		
	}

}
