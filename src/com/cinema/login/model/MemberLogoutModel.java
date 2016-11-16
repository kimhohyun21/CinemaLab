package com.cinema.login.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;

import oracle.net.aso.h;

@Controller
public class MemberLogoutModel {
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request){
		HttpSession session=request.getSession();		
		if(session !=null){
			//历厘等 技记力芭
			session.invalidate();			
		}
		return "main.do";
	}
}
