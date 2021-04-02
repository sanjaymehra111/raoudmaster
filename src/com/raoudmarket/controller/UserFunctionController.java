package com.raoudmarket.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.raoudmarket.dao.AdminLoginDaoImpl;
import com.raoudmarket.dao.UniqueCodeGenerator;
import com.raoudmarket.dao.UserFunctionDaoImpl;
import com.raoudmarket.model.MeterModel;
import com.raoudmarket.model.ProductModel;
import com.raoudmarket.model.SessionModel;
import com.raoudmarket.model.ShopModel;
import com.raoudmarket.model.UserModel;
import com.raoudmarket.model.ViewBillModel;

@Controller
public class UserFunctionController {

	@Autowired
	UserFunctionDaoImpl ufdao; 
	
	@Autowired
	SessionController sccot;
	
	@Autowired
	UniqueCodeGenerator ucdao;
	
	@Autowired
	AdminLoginDaoImpl aldao;
	
	@Autowired
	PasswordEncryption pdc;

	public String GetDateTime(){
		Date today = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
	    df.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
	    String date = df.format(today);
	    return date;
	}

	
	@ResponseBody
	@PostMapping("CreateUserGroup")
	public String CreateUserGroup(@RequestParam String name, String contact, String email, String address, String meter, String charge, String shop, String reading, HttpSession session) {
		String sn = sccot.CheckSession(session, "admin");
		if(sn == "success") {
			List<MeterModel> user = ufdao.ViewSpecMeterList(meter);
			if(user.size() > 0) {
				return "meter_exist";
			}
			else {
				Number number = ufdao.CreateUserGroup(name, contact, email, address, meter);
				ufdao.PreviousBillRecord(number.toString(), meter, reading, "2");
				ufdao.CreateMeter(number.toString(), meter, shop, charge);
				return "success";
			}
		}
		else
			return "Login Error";
	}

	@ResponseBody
	@PostMapping("CreateBill")
	public String CreateBill(@RequestParam String number, String reading, HttpSession session) {
		String date = GetDateTime();

		String sn = sccot.CheckSession(session, "admin");
		if(sn == "success") {
			List<MeterModel> meter = ufdao.ViewLastMeterDetails(number);

			if(meter != null) {
				int pr;
				if(meter.get(0).getNew_reading() != null)
					pr = Integer.parseInt(meter.get(0).getNew_reading());
				else
					pr = Integer.parseInt(meter.get(0).getPrevious_reading());
				
					if(pr >= Integer.parseInt(reading))
						return "reading_error";
				
					int charge=200;
					int unit=9;
					
					//String remaining = ufdao.ViewSpecificUserRemainingBalance(meter.get(0).getUser_id());
					//System.out.println("rem : " +remaining);
					
					String[] dt_new = date.split("T");
					String[] dt_pr = meter.get(0).getDate().split("T");
					
					//System.out.println(dt_pr[0]);
					
					String diff = String.valueOf(ChronoUnit.MONTHS.between(LocalDate.parse(dt_pr[0]).withDayOfMonth(1),LocalDate.parse(dt_new[0]).withDayOfMonth(1)));
					
					//System.out.println("diff : "+diff);
					if(Integer.parseInt(diff) > 0)
						charge = charge*Integer.parseInt(diff);
					
					//System.out.println("chrg : "+charge);
					
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
		String sn = sccot.CheckSession(session, "admin");
		if(sn == "success") {
			ufdao.CreateMeter("", number, shop, charge);
			return "success";
		}
		else
			return "Login Error";
	}
	
	@ResponseBody
	@PostMapping("CreateCompanyReading")
	public String CreateCompanyReading(@RequestParam String previous, String user, String total, String current, String balance, HttpSession session) {
		String sn = sccot.CheckSession(session, "admin");
		if(sn == "success") {
			ufdao.CreateCompanyReading(previous, user, total, current, balance);
			return "success";
		}
		else
			return "Login Error";
	}

	@ResponseBody
	@PostMapping("ViewUserGroup")
	public String ViewUserGroup(HttpSession session) {
		String sn = sccot.CheckSession(session, "admin");
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
	@PostMapping("ViewUserGroupAllDetails")
	public JsonArray ViewUserGroupAllDetails(HttpSession session) throws JSONException {
		String sn = sccot.CheckSession(session, "admin");
		JsonArray final_list = new JsonArray();
		if(sn == "success") {
			List<UserModel> user = ufdao.ViewAllUserGroup();
			for(int i=0; i<user.size(); i++) {
				JsonObject js = new JsonObject();
				String remaining = ufdao.ViewSpecificUserRemainingBalance(user.get(i).getId());
				List<MeterModel> meter = ufdao.ViewLastMeterDetails(user.get(i).getMeter_number());
				js.addProperty("name", user.get(i).getName());
				js.addProperty("contact", user.get(i).getContact());
				js.addProperty("meter", user.get(i).getMeter_number());
				js.addProperty("remaining", remaining);
				//if(meter != null) {
					if(meter.get(0).getNew_reading() != null)
						js.addProperty("reading", meter.get(0).getNew_reading());
					else
						js.addProperty("reading", meter.get(0).getPrevious_reading());
					js.addProperty("amount", meter.get(0).getAmount());
					js.addProperty("pay", meter.get(0).getPay());
				//}
				final_list.add(js);
			}

			return final_list;
		}
		else
			return null;
	}

	
	
	@ResponseBody
	@PostMapping("ViewUserMeterAllDetails")
	public JsonArray ViewUserMeterAllDetails(HttpSession session) throws JSONException {
		String sn = sccot.CheckSession(session, "admin");
		JsonArray final_list = new JsonArray();
		if(sn == "success") {
			List<UserModel> user = ufdao.ViewAllUserGroup();
			for(int i=0; i<user.size(); i++) {
				JsonObject js = new JsonObject();
				List<MeterModel> meter = ufdao.ViewSpecMeterList(user.get(i).getMeter_number());
				js.addProperty("name", user.get(i).getName());
				js.addProperty("contact", user.get(i).getContact());
				js.addProperty("meter", user.get(i).getMeter_number());
				js.addProperty("shop", meter.get(0).getShop_name());
				js.addProperty("charge", meter.get(0).getCharge());
				js.addProperty("status", meter.get(0).getStatus());
				final_list.add(js);
			}

			return final_list;
		}
		else
			return null;
	}
	
	
	@ResponseBody
	@PostMapping("ViewMeterList")
	public String ViewMeterList(HttpSession session) {
		String sn = sccot.CheckSession(session, "admin");
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
	@PostMapping("GetReadingReport")
	public String GetReadingReport(HttpSession session) {
		String sn = sccot.CheckSession(session, "admin");
		if(sn == "success") {
			Gson gson = new Gson();
			List<MeterModel> previousReading = ufdao.MainMeterPreviousReading();
			String monthReading = String.valueOf(ufdao.MonthReading());
			
			if(monthReading == "null"){
				monthReading = "0";
			}
			
			String preR = gson.toJson(previousReading);
			String newR = gson.toJson(monthReading);
			
			String finealDetails = "["+preR+", "+newR+"]";
			
			return finealDetails; 
		}
		else
			return "Login Error";
	}

	@ResponseBody
	@PostMapping("ViewSpecMeterList")
	public String ViewSpecMeterList(@RequestParam String mid, HttpSession session) {
		String sn = sccot.CheckSession(session, "admin");
		if(sn == "success") {
			List<MeterModel> user = ufdao.ViewSpecMeterList(mid);
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
		String sn = sccot.CheckSession(session, "admin");
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
		String sn = sccot.CheckSession(session, "admin");
		if(sn == "success") {
			List<UserModel> user = ufdao.ViewSpecificUser(id);
			List<MeterModel> meter = ufdao.ViewSpecificUserMeterBill(id);
			String remaining = ufdao.ViewSpecificUserRemainingBalance(id);
			Gson gson = new Gson();
			String us = gson.toJson(user);
			String mt = gson.toJson(meter);
			String finals = '['+us+','+mt+','+remaining+']';
			return finals; 
		}
		else
			return "Login Error";
	}
	
	
	
	@ResponseBody
	@PostMapping("UpdateUserGroup")
	public String UpdateUserGroup(@RequestParam String uid, String name, String contact, String email, String address, HttpSession session) {
		String sn = sccot.CheckSession(session, "admin");
		if(sn == "success") {
			ufdao.UpdateUserGroup(uid, name, contact, email, address);
			return "success"; 
		}
		else
			return "Login Error";
	}
	
	@ResponseBody
	@PostMapping("UpdateMeterDetails")
	public String UpdateMeterDetails(@RequestParam String mid, String shop, String charge, HttpSession session) {
		String sn = sccot.CheckSession(session, "admin");
		if(sn == "success") {
			ufdao.UpdateMeterDetails(mid, shop, charge);
			return "success"; 
		}
		else
			return "Login Error";
	}
	
	@ResponseBody
	@PostMapping("UpdateMeterStatus")
	public String UpdateMeterStatus(@RequestParam String mid, String status, HttpSession session) {
		String sn = sccot.CheckSession(session, "admin");
		if(sn == "success") {
			ufdao.UpdateMeterStatus(mid, status);
			return "success"; 
		}
		else
			return "Login Error";
	}
	
	
	
	
	
	@ResponseBody
	@PostMapping("DeleteUserGroup")
	public String DeleteUserGroup(@RequestParam String uid, HttpSession session) {
		String sn = sccot.CheckSession(session, "admin");
		if(sn == "success") {
			ufdao.DeleteUserGroup(uid);
			return "success"; 
		}
		else
			return "Login Error";
	}
	
	@ResponseBody
	@PostMapping("MakePayment")
	public String MakePayment(@RequestParam String uid, String amount, String date, HttpSession session) {
		String sn = sccot.CheckSession(session, "admin");
		if(sn == "success") {
			int pr;
			String pr_rem = ufdao.ViewSpecificUserRemainingBalance(uid);
			
			//System.out.println("previous : "+ pr_rem +" amount : "+ amount);
			
			if(pr_rem == null || Float.parseFloat(pr_rem) < Float.parseFloat(amount))
				return "amoun_error";
			
			float nw_rem = Float.parseFloat(pr_rem) - Float.parseFloat(amount); 
			
			List<UserModel> user = ufdao.ViewSpecificUser(uid);
			List<MeterModel> meter = ufdao.ViewLastMeterDetails(user.get(0).getMeter_number());

			if(meter.get(0).getNew_reading() != null)
				pr = Integer.parseInt(meter.get(0).getNew_reading());
			else
				pr = Integer.parseInt(meter.get(0).getPrevious_reading());
			ufdao.PayPayment(uid, String.valueOf(pr), pr_rem, amount, String.valueOf(nw_rem), "1");
			ufdao.PayPaymentIntoMeterBill(uid, meter.get(0).getMeter_number(), String.valueOf(pr), pr_rem, amount, String.valueOf(nw_rem), "1", date);
			return "success"; 
		}
		else
			return "Login Error";
	}
	
	@ResponseBody
	@PostMapping("InsertShopDetails")
	public String InsertShopDetails(@RequestParam String shop, String contact, String name, String address, String from, String to, @RequestParam(value="file", required=false) CommonsMultipartFile[] file, HttpSession session) throws IOException {
		String sn = sccot.CheckSession(session, "admin");
		if(sn == "success") {
			//String path = "D:/ServiceOnWay/Images/eclipseimages";
			String path = "/home/pcsetupvsss/public_html/UploadedFiles/shop/";
			
			String finalfile = ""; 
			
			if(file != null) {
				for(int i=0; i<file.length; i++) { 
					String files = ucdao.GetUniqueCode()+"-"+file[i].getOriginalFilename();
					byte[] bytes = file[i].getBytes();
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(path+ File.separator+ files)));
					stream.write(bytes);
					stream.flush();
					stream.close();
					finalfile+=files+",";
				}
			}
			String files = finalfile.replaceAll(",$", "");
			ufdao.InsertShopDetails(shop, contact, name, address, from, to, files);
			return "success"; 
		}
		else
			return "Login Error";
	}

	
	@ResponseBody
	@PostMapping("InsertproductDetails")
	public String InsertproductDetails(@RequestParam String product, @RequestParam(value="file", required=false) CommonsMultipartFile file, HttpSession session) throws IOException {
		String sn = sccot.CheckSession(session, "admin");
		if(sn == "success") {
			//String path = "c:/UploadedFiles/ProductImages/";
			String path = "/home/pcsetupvsss/public_html/UploadedFiles/ProductImages/";
			
			String finalfile = ""; 
			
			if(file != null) {
					String files = ucdao.GetUniqueCode()+"-"+file.getOriginalFilename();
					byte[] bytes = file.getBytes();
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(path+ File.separator+ files)));
					stream.write(bytes);
					stream.flush();
					stream.close();
					finalfile+=files+",";
				}
			String files = finalfile.replaceAll(",$", "");
			ufdao.InsertProductDetails(product, files);
			return "success"; 
		}
		else
			return "Login Error";
	}

	
	@ResponseBody
	@PostMapping("ViewAllShopDetails")
	public String ViewAllShopDetails(HttpSession session) {
		String sn = sccot.CheckSession(session, "admin");
		if(sn == "success") {
			List<ShopModel> shop = ufdao.ViewAllShopDetails();
			Gson gson = new Gson();
			String finals = gson.toJson(shop);
			return finals; 
		}
		else
			return "Login Error";
	}

	
	@ResponseBody
	@PostMapping("ViewAllproductDetails")
	public String ViewAllproductDetails(HttpSession session) {
		String sn = sccot.CheckSession(session, "admin");
		if(sn == "success") {
			List<ProductModel> shop = ufdao.ViewAllproductDetails();
			Gson gson = new Gson();
			String finals = gson.toJson(shop);
			return finals; 
		}
		else
			return "Login Error";
	}

	@ResponseBody
	@PostMapping("CreateNewUser")
	public String CreateNewUser(@RequestParam String name, String password,String date)
	{
		String new_pwd = pdc.PasswordEncrypt(password);
		aldao.CreateNewUser(name, new_pwd , date);
		return "Data Stored";
		
	}
	
	
	@ResponseBody
	@PostMapping("ViewAllUserDetails")
	public String AdminViewUser()
	{
		Gson gson = new Gson();
		List<UserModel> data = aldao.AdminViewUser();
		String FinalData = gson.toJson(data);
		if(data!=null)
			return FinalData;
		else
			return "error";
	}
	
	@ResponseBody
	@PostMapping("fetchdataOfViewBill")
	  public String fetchData(){
		Gson gson = new Gson();
		List<ViewBillModel> data = aldao.adminviewbill();
		String FinalData = gson.toJson(data);
		
		if(data!=null)
			return FinalData;
		else
			return "error";
		
	  }
	
	@ResponseBody
	@PostMapping("fetchdataOfuserspent")
	public String fetchdataOfuserspent()
	{
		Gson gson = new Gson();
		List<ProductModel> data = ufdao.fetchdataOfuserspent();
		String FinalData = gson.toJson(data);
		
		if(data!=null)
			return FinalData;
		else
			return "error";
	}
	

	  @ResponseBody
	  @PostMapping("storeDataInUserSpent")
	  public String storeDataInUserSpent(@RequestParam String product_name, String amount, String text , HttpSession session,HttpServletResponse response){
		  SessionModel sm = (SessionModel) session.getAttribute("AdminSession");
		  //System.out.println("ID : "+sm.getUser_id());
		  List<UserModel> userData = ufdao.FetchUserDetails(sm.getUser_id());
		  //System.out.println("ID : "+userData.get(0).getName());
		  ufdao.storeDataInUserSpent(sm.getUser_id(), userData.get(0).getName(), product_name ,amount,text);
		  return "Data Stored";
		  
	  }
	  
	 
	
	@ResponseBody
	@PostMapping("fetchdataOfUserViewBill")
	  public String fetchDataOfUserViewBill(HttpSession session){
		Gson gson = new Gson();
		SessionModel sm = (SessionModel) session.getAttribute("AdminSession");
		List<ViewBillModel> data = ufdao.fetchuserviewbill(sm.getUser_id());
		String FinalData = gson.toJson(data);
		
		if(data!=null)
			return FinalData;
		else
			return "error";
		
	  }
	
	@ResponseBody
	@PostMapping("fetchusername")
	  public String fetchusername(HttpSession session){
		Gson gson = new Gson();
		SessionModel sm = (SessionModel) session.getAttribute("AdminSession");
		List<UserModel> data = ufdao.fetchusername(sm.getUser_id());
		String FinalData = gson.toJson(data);
		
		if(data!=null)
			return FinalData;
		else
			return "error";
		
	  }
	
	@ResponseBody
	@PostMapping("deletedata") 
	public String deletedata(@RequestParam String id){
		ufdao.deletedata(id);
		return "success";
	}
	
}// main class close
