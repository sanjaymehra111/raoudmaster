package com.raoudmarket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String IndexPage()
	{
		return "Login";
	}

	@RequestMapping("Login")
	public String Login()
	{
		return "Login"; 
	}
	
	@RequestMapping("AdminCreateBill")
	public String AdminCreateBill()
	{
		return "AdminCreateBill"; 
	}
	
	@RequestMapping("AdminCreateMeter")
	public String AdminCreateMeter()
	{
		return "AdminCreateMeter"; 
	}
	
	@RequestMapping("AdminCreateUserGroup")
	public String AdminCreateUserGroup()
	{
		return "AdminCreateUserGroup"; 
	}
	
	@RequestMapping("AdminDashboard")
	public String AdminDashboard()
	{
		return "AdminDashboard"; 
	}
	
	@RequestMapping("AdminMeterList")
	public String AdminMeterList()
	{
		return "AdminMeterList"; 
	}
	
	@RequestMapping("AdminUserGroup")
	public String AdminUserGroup()
	{
		return "AdminUserGroup"; 
	}
	
	@RequestMapping("CompanyReading_Report")
	public String CompanyReading_Report()
	{
		return "CompanyReading_Report"; 
	}

	@RequestMapping("CompanyReadings")
	public String CompanyReadings()
	{
		return "CompanyReadings"; 
	}
	
	@RequestMapping("CreateShopDetails")
	public String CreateShopDetails()
	{
		return "CreateShopDetails"; 
	}
	
	@RequestMapping("DownloadMeterReport")
	public String DownloadMeterReport()
	{
		return "DownloadMeterReport"; 
	}
	
	@RequestMapping("DownloadReport")
	public String DownloadReport()
	{
		return "DownloadReport"; 
	}
	
	@RequestMapping("ViewShopDetails")
	public String ViewShopDetails()
	{
		return "ViewShopDetails"; 
	}
	

	@RequestMapping("Dashboard")
	public String Dashboard()
	{
		return "Dashboard"; 
	}
	
	@RequestMapping("logout")
	public String logout()
	{
		return "logout"; 
	}

}
