package com.raoudmarket.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.raoudmarket.model.MeterModel;
import com.raoudmarket.model.ProductModel;
import com.raoudmarket.model.ShopModel;
import com.raoudmarket.model.UserModel;
import com.raoudmarket.model.ViewBillModel;

@Repository
public class UserFunctionDaoImpl {

	@Autowired
	JdbcTemplate template;
	
	public String GetDate()
	{
		Date today = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	    df.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
	    String date = df.format(today);
	    return date;
	}
	
	public String GetDateTime(){
		Date today = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    df.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
	    String date = df.format(today);
	    return date;
	}
	
	public String GetCurrentYear()
	{
		Date today = new Date();
		DateFormat df = new SimpleDateFormat("yyyy");
	    df.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
	    String date = df.format(today);
	    return date;
	}
	
	public String GetCurrentMonth()
	{
		Date today = new Date();
		DateFormat df = new SimpleDateFormat("MM");
	    df.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
	    String date = df.format(today);
	    return date;
	}
	
	public String GetCurrentDay()
	{
		Date today = new Date();
		DateFormat df = new SimpleDateFormat("dd");
	    df.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
	    String date = df.format(today);
	    return date;
	}

	
	public String GetDateTime2()
	{
		Date today = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
	    df.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
	    String date = df.format(today);
	    return date;
	}
	
	
	public Number CreateUserGroup(String name, String contact, String email, String address, String meter) {
		String date = GetDateTime();
		String query= "insert into user_group (name, contact, email, address, meter_number, date) values('"+name+"', '"+contact+"', '"+email+"', '"+address+"', '"+meter+"', '"+date+"')";
		//template.update(query);
		
		KeyHolder keyHolder = new GeneratedKeyHolder();
		  template.update(
			  connection ->{
				  PreparedStatement ps = connection.prepareStatement(query, new String[]{"ID"});
				  return ps;
			  }, keyHolder );

		  return keyHolder.getKey();
	}
	
	public int CreateBill(String uid, String number, String reading, String pr_reading, String amount, String charge, String unit, String date) {
		String dates = GetDate();
		if(date.length()>5)
			dates = date;
		String query= "insert into meter_bill (user_id, meter_number, new_reading, previous_reading, amount, charge, unit, date) values('"+uid+"', '"+number+"', '"+reading+"', '"+pr_reading+"', '"+amount+"', '"+charge+"', '"+unit+"', '"+dates+"')";
		return template.update(query);
	}
	
	
	public int PreviousBillRecord(String uid, String number, String reading, String status) {
		String dates = GetDateTime2();
		String query= "insert into meter_bill (user_id, meter_number, previous_reading, date, status) values('"+uid+"', '"+number+"', '"+reading+"', '"+dates+"', '"+status+"')";
		return template.update(query);
	}
	
	public int PayPaymentIntoMeterBill(String uid, String meter, String reading, String amount, String pay, String remaining, String status) {
		String date = GetDateTime2();
		String query= "insert into meter_bill (user_id, meter_number, previous_reading, amount, pay, remaining, date, status) values('"+uid+"', '"+meter+"', '"+reading+"', '"+amount+"', '"+pay+"', '"+remaining+"', '"+date+"', '"+status+"')";
		return template.update(query);
	}

	public int CreateMeter(String uid, String number, String shop, String charge) {
		String dates = GetDate();
		String query= "insert into meter (user_id, meter_number, shop_name, charge, date) values('"+uid+"', '"+number+"', '"+shop+"', '"+charge+"', '"+dates+"')";
		return template.update(query);
	}
	
	public int CreateCompanyReading(String previous, String user, String total, String current, String balance) {
		String dates = GetDateTime2();
		String query= "insert into company_reading (previous_reading, user_reading, total_reading, current_reading, balance, date) values('"+previous+"', '"+user+"', '"+total+"', '"+current+"', '"+balance+"', '"+dates+"')";
		return template.update(query);
	}
	
	
	public int UpdateUserGroup(String uid, String name, String contact, String email, String address) {
		String date = GetDate();
		String query= "update user_group set name='"+name+"', contact='"+contact+"', email='"+email+"', address='"+address+"', updated_date = '"+date+"' where id ='"+uid+"'";
		return template.update(query);
	}
	
	public int UpdateMeterDetails(String mid, String shop, String charge) {
		String date = GetDate();
		String query= "update meter set shop_name='"+shop+"', charge='"+charge+"', updated_date = '"+date+"' where meter_number='"+mid+"'";
		return template.update(query);
	}

	public int UpdateMeterStatus(String mid, String status) {
		String date = GetDate();
		String query= "update meter set status='"+status+"', updated_date = '"+date+"' where meter_number='"+mid+"'";
		return template.update(query);
	}

	public int DeleteUserGroup(String uid) {
		String query= "delete from user_group where id ='"+uid+"'";
		return template.update(query);
	}
	
	public int PayPayment(String uid, String reading, String amount, String pay, String remaining, String status) {
		String dates = GetDateTime();
		String query= "insert into payment (user_id, reading, amount, pay, remaining, date, status) values('"+uid+"', '"+reading+"', '"+amount+"', '"+pay+"', '"+remaining+"', '"+dates+"', '"+status+"')";
		return template.update(query);
	}

	public int InsertShopDetails(String shop, String contact, String owner, String address, String bill_from, String bill_to, String file) {
		String date = GetDate();
		String query= "insert into shop_details (shop_name, contact, owner_name, address, bill_from, bill_to, file, date) values('"+shop+"', '"+contact+"', '"+owner+"', '"+address+"', '"+bill_from+"', '"+bill_to+"', '"+file+"', '"+date+"')";
		return template.update(query);
	}
	
	
	public int InsertProductDetails(String product, String file) {
		String date = GetDate();
		String query= "insert into product_details (name, image, date) values('"+product+"', '"+file+"', '"+date+"')";
		return template.update(query);
	}

	
	public List<UserModel> ViewAllUserGroup() {
		List<UserModel> query = template.query("select * from user_group", new RowMapper<UserModel>() {

			@Override
			public UserModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				UserModel um = new UserModel();
				um.setId(rs.getString("id"));
				um.setName(rs.getString("name"));
				um.setContact(rs.getString("contact"));
				um.setEmail(rs.getString("email"));
				um.setAddress(rs.getString("address"));
				um.setMeter_number(rs.getString("meter_number"));
				um.setStatus(rs.getString("status"));
				um.setDate(rs.getString("date"));
				um.setUpdated_date(rs.getString("updated_date"));
				return um;
			}
			
		});
		
		return query;
	}
	
	
	public List<MeterModel> ViewLastMeterDetails(String meter) {
		
		List<MeterModel> query = template.query("SELECT * FROM meter_bill WHERE meter_number='"+meter+"' ORDER BY DATE DESC LIMIT 1", new RowMapper<MeterModel>() {
			@Override
			public MeterModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				MeterModel mm = new MeterModel();
				mm.setId(rs.getString("id"));
				mm.setUser_id(rs.getString("user_id"));
				mm.setMeter_number(rs.getString("meter_number"));
				mm.setNew_reading(rs.getString("new_reading"));
				mm.setPrevious_reading(rs.getString("previous_reading"));
				mm.setAmount(rs.getString("amount"));
				mm.setPay(rs.getString("pay"));
				mm.setRemaining(rs.getString("remaining"));
				mm.setStatus(rs.getString("status"));
				mm.setDate(rs.getString("date"));
				return mm;
			}
			
		});
		
		return query.size()>0 ? query:null;
	}
	
	
	public List<MeterModel> ViewSpecificUserMeterBill(String uid) {
		
		List<MeterModel> query = template.query("SELECT * FROM meter_bill WHERE user_id='"+uid+"' ", new RowMapper<MeterModel>() {
			@Override
			public MeterModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				MeterModel mm = new MeterModel();
				mm.setId(rs.getString("id"));
				mm.setUser_id(rs.getString("user_id"));
				mm.setMeter_number(rs.getString("meter_number"));
				mm.setPrevious_reading(rs.getString("previous_reading"));
				mm.setNew_reading(rs.getString("new_reading"));
				mm.setAmount(rs.getString("amount"));
				mm.setPay(rs.getString("pay"));
				mm.setRemaining(rs.getString("remaining"));
				mm.setCharge(rs.getString("charge"));
				mm.setUnit(rs.getString("unit"));
				mm.setStatus(rs.getString("status"));
				mm.setDate(rs.getString("date"));
				return mm;
			}
			
		});
		
		return query.size()>0 ? query:null;
	}
	
	public String ViewSpecificUserRemainingBalance(String uid) {
		
		List<MeterModel> bill = template.query("SELECT SUM(amount) FROM meter_bill WHERE user_id ='"+uid+"' AND STATUS = 0", new RowMapper<MeterModel>() {
			@Override
			public MeterModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				MeterModel mm = new MeterModel();
				mm.setRemaining(rs.getString("sum(amount)"));
				return mm;
			}
		});
		
		List<MeterModel> pay = template.query("SELECT SUM(pay) FROM meter_bill WHERE user_id ='"+uid+"' AND STATUS = 1", new RowMapper<MeterModel>() {
			@Override
			public MeterModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				MeterModel mm = new MeterModel();
				mm.setRemaining(rs.getString("sum(pay)"));
				return mm;
			}
		});
		
		
		float rem;
		if(bill.size() > 0 && bill.get(0).getRemaining() != null) {
			if(pay.size() > 0 && pay.get(0).getRemaining() != null) {
				rem = Float.parseFloat(bill.get(0).getRemaining()) - Float.parseFloat(pay.get(0).getRemaining());
				return String.valueOf(rem);
			}
			else
				return bill.get(0).getRemaining();
		}
		
		return null;
	}
	
public List<UserModel> ViewSpecificUser(String id) {
		
		List<UserModel> query = template.query("select * from user_group where id = '"+id+"'", new RowMapper<UserModel>() {
			@Override
			public UserModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				UserModel um = new UserModel();
				um.setId(rs.getString("id"));
				um.setName(rs.getString("name"));
				um.setContact(rs.getString("contact"));
				um.setEmail(rs.getString("email"));
				um.setAddress(rs.getString("address"));
				um.setMeter_number(rs.getString("meter_number"));
				um.setStatus(rs.getString("status"));
				um.setDate(rs.getString("date"));
				return um;
			}
		});
		return query.size()>0 ? query:null;
	}
	
	
	public List<MeterModel> ViewMeterList() {
		List<MeterModel> query = template.query("select * from meter", new RowMapper<MeterModel>() {

			@Override
			public MeterModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				MeterModel mm = new MeterModel();
				mm.setId(rs.getString("id"));
				mm.setMeter_number(rs.getString("meter_number"));
				mm.setShop_name(rs.getString("shop_name"));
				mm.setCharge(rs.getString("charge"));
				mm.setStatus(rs.getString("status"));
				mm.setDate(rs.getString("date"));
				mm.setUpdated_date(rs.getString("updated_date"));
				return mm;
			}
			
		});
		
		return query;
	}
	
	
	public List<MeterModel> MainMeterPreviousReading() {
		String year= GetCurrentYear();
		String month = GetCurrentMonth();
		int lastMonth = Integer.parseInt(month)-1;
		String day = GetCurrentDay();
		
		List<MeterModel> query = template.query("SELECT * FROM company_reading WHERE DATE > '"+year+"-"+'0'+lastMonth+"-01' AND DATE < '"+year+"-"+'0'+lastMonth+"-31' ORDER BY id DESC LIMIT 0,1", new RowMapper<MeterModel>() {

			@Override
			public MeterModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				MeterModel mm = new MeterModel();
				mm.setId(rs.getString("id"));
				mm.setMeter_number(rs.getString("meter_number"));
				mm.setPrevious_reading(rs.getString("previous_reading"));
				mm.setUser_reading(rs.getString("user_reading"));
				mm.setTotal_reading(rs.getString("total_reading"));
				mm.setCurrent_reading(rs.getString("current_reading"));
				mm.setBalance(rs.getString("balance"));
				mm.setDate(rs.getString("date"));
				return mm;
			}
			
		});
		
		return query;
	}
	
	
	public Float MonthReading() {
		String year= GetCurrentYear();
		String month = GetCurrentMonth();
		
		//***************************		For Testing
		//int month1 = Integer.parseInt(month)-1;
		//month = "0"+String.valueOf(month1);
		//***************************		For Testing
		
		String day = GetCurrentDay();

		String PrevoiusReadingSumQuery = "SELECT SUM(previous_reading) FROM `meter_bill` WHERE DATE > '"+year+"-"+month+"-01' AND DATE < '"+year+"-"+month+"-31'  AND STATUS = 0";
		String NewReadingSumQuery = "SELECT SUM(new_reading) FROM `meter_bill` WHERE DATE > '"+year+"-"+month+"-01' AND DATE < '"+year+"-"+month+"-31'  AND STATUS = 0";

		//String PrevoiusReadingSumQuery = "SELECT SUM(previous_reading) FROM `meter_bill` WHERE DATE > '2020-12-1' AND DATE < '2020-12-31'  AND STATUS = 0";
		//String NewReadingSumQuery = "SELECT SUM(new_reading) FROM `meter_bill` WHERE DATE > '2020-12-1' AND DATE < '2020-12-31'  AND STATUS = 0";

		//System.out.println(PrevoiusReadingSumQuery);
		//System.out.println(NewReadingSumQuery);
		
		List<MeterModel> Prequery = template.query(PrevoiusReadingSumQuery, new RowMapper<MeterModel>() {
			@Override
			public MeterModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				MeterModel mm = new MeterModel();
				mm.setPrevious_reading(rs.getString("SUM(previous_reading)"));
				return mm;
			}
		});
		
		List<MeterModel> Newquery = template.query(NewReadingSumQuery, new RowMapper<MeterModel>() {
			@Override
			public MeterModel mapRow(ResultSet rs, int arg1) throws SQLException {
				MeterModel mm = new MeterModel();
				mm.setNew_reading(rs.getString("SUM(new_reading)"));
				return mm;
			}
		});
		
		Float final_reading;
		
		
		if(Newquery.size() > 0 && Newquery.get(0).getNew_reading() != null) {
			if(Prequery.size() > 0 && Prequery.get(0).getPrevious_reading() != null) {
				final_reading = Float.parseFloat(Newquery.get(0).getNew_reading()) - Float.parseFloat(Prequery.get(0).getPrevious_reading());
				return final_reading;
			}
			else
				return Float.parseFloat(Newquery.get(0).getNew_reading());
		}
		
		return null;
	}
	
	
	
	public List<MeterModel> ViewSpecMeterList(String mid) {
		List<MeterModel> query = template.query("select * from meter where meter_number = '"+mid+"'", new RowMapper<MeterModel>() {

			@Override
			public MeterModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				MeterModel mm = new MeterModel();
				mm.setId(rs.getString("id"));
				mm.setUser_id(rs.getString("user_id"));
				mm.setMeter_number(rs.getString("meter_number"));
				mm.setShop_name(rs.getString("shop_name"));
				mm.setCharge(rs.getString("charge"));
				mm.setStatus(rs.getString("status"));
				mm.setDate(rs.getString("date"));
				mm.setUpdated_date(rs.getString("updated_date"));
				return mm;
			}
			
		});
		
		return query;
	}

	public List<ShopModel> ViewAllShopDetails() {
		List<ShopModel> query = template.query("select * from shop_details", new RowMapper<ShopModel>() {

			@Override
			public ShopModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				ShopModel sm = new ShopModel();
				sm.setId(rs.getString("id"));
				sm.setShop_name(rs.getString("shop_name"));
				sm.setContact(rs.getString("contact"));
				sm.setOwner_name(rs.getString("owner_name"));
				sm.setAddress(rs.getString("address"));
				sm.setBill_from(rs.getString("bill_from"));
				sm.setBill_to(rs.getString("bill_to"));
				sm.setFile(rs.getString("file"));
				sm.setDate(rs.getString("date"));
				return sm;
			}
			
		});
		return query;
	}

	
	public List<ProductModel> ViewAllproductDetails() {
		List<ProductModel> query = template.query("select * from product_details", new RowMapper<ProductModel>() {

			@Override
			public ProductModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				ProductModel sm = new ProductModel();
				sm.setId(rs.getString("id"));
				sm.setName(rs.getString("name"));
				sm.setImage(rs.getString("image"));
				sm.setDate(rs.getString("date"));
				return sm;
			}
			
		});
		return query;
	}

	public List<ProductModel> fetchdataOfuserspent()
	{
		List<ProductModel> query = template.query("select * from product_details ", new RowMapper<ProductModel>() {

			@Override
			public ProductModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				ProductModel pm = new ProductModel();
				pm.setId(rs.getString("id"));
				pm.setName(rs.getString("name"));
				pm.setImage(rs.getString("image"));
				return pm;
			}
			
		});
		return query;
	}
	
	public int storeDataInUserSpent(String user_id,  String user_name, String product_name, String amount) {
		String dates = GetDateTime();
		String query= "insert into user_spent (user_id, user_name, product_name, amount, date) values('"+user_id+"', '"+user_name+"', '"+product_name+"', '"+amount+"', '"+dates+"')";
		return template.update(query);
	}

	
	public List<ViewBillModel> fetchuserviewbill(String id)
	{
		//List<ViewBillModel> query = template.query("select * from user_spent where id="+id+"", new RowMapper<ViewBillModel>() {
		List<ViewBillModel> query = template.query("SELECT user_spent.id, user_spent.user_id, user_spent.user_name, user_spent.product_name, user_spent.amount, user_spent.date, product_details.image\n"
				+ "FROM user_spent\n"
				+ "INNER JOIN product_details\n"
				+ "WHERE \n"
				+ "user_id = "+id+" \n"
				+ "AND user_spent.`product_name` = `product_details`.`name`\n"
				+ "GROUP BY user_spent.`id`", new RowMapper<ViewBillModel>() {
			@Override
			public ViewBillModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				ViewBillModel vm = new ViewBillModel();
				vm.setId(rs.getString("id"));
				vm.setUser_id(rs.getString("user_id"));
				vm.setUser_name(rs.getString("user_name"));
				vm.setProduct_name(rs.getString("product_name"));
				vm.setAmount(rs.getString("amount"));
				vm.setDate(rs.getString("date"));
				vm.setImage(rs.getString("image"));
				return vm;
			}
			
		});
		return query;
	}

	
	public List<UserModel> FetchUserDetails(String id)
	{
		List<UserModel> query = template.query("select * from user where id = '"+id+"'", new RowMapper<UserModel>() {

			@Override
			public UserModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				UserModel um = new UserModel();
				um.setId(rs.getString("id"));
				um.setName(rs.getString("name"));
				um.setDate(rs.getString("date"));
				return um;
			}
			
		});
		return query;
	}

	public List<UserModel> fetchusername(String id)
	{
		List<UserModel> query = template.query("select * from user where id="+id+"", new RowMapper<UserModel>() {

			@Override
			public UserModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				UserModel um = new UserModel();
				um.setId(rs.getString("id"));
				um.setName(rs.getString("name"));
				return um;
			}
			
		});
		return query;
	}

	
}// main class close
