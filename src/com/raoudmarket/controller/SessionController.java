package com.raoudmarket.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import com.itextpdf.io.IOException;
import com.raoudmarket.model.SessionModel;

@Repository
public class SessionController {

	public String CreateSession(String id, String type, HttpSession session) throws IOException {
		try {
			SessionModel sm = new SessionModel();
			sm.setSession_id(session.getId());
			sm.setType(type);
			sm.setUser_id(id);
			sm.setTime(session.getCreationTime());
			session.setAttribute("AdminSession", sm);
			return "success";
		}
		catch(Exception e) {
			System.out.println("Exception "+ e);
			return "error";
		}
	}
	
	public String CheckSession(HttpSession session, String type ) throws IOException {
		try {
			SessionModel sn = (SessionModel) session.getAttribute("AdminSession");
			//System.out.println("sess : "+sn);
			if(sn != null){
				if(sn.getType().equals(type))
					return "success";
				else
					return "error";
			}
			else
				return "error";
				//return "success";
		}
		catch(Exception e) {
			System.out.println("Exception "+ e);
			return "error";
		}
	}
	
	public String TerminateSession(HttpSession session) throws IOException {
		try {
			session.removeAttribute("UserSessionData");
			session.invalidate();
			return "success";
		}
		catch(Exception e) {
			System.out.println("Exception "+ e);
			return "error";
		}
	}
	
}
