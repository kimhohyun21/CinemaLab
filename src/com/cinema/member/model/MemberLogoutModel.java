package com.cinema.member.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;

import oracle.net.aso.h;

@Controller
public class MemberLogoutModel {
	@RequestMapping("logout.do")
	public String memeberLogout(HttpServletRequest request){
		/*String overCheckId=(String) session.getAttribute("overCheckId");
		String id=(String) session.getAttribute("ok");
		String mvo=(String) session.getAttribute("mvo");*/
		HttpSession session=request.getSession();		
		if(session !=null){
			session.invalidate();			
		}
		return "main.do";
	}
}
