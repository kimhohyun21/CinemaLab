package com.cinema.member.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;

@Controller
public class MemberLogin {
	@RequestMapping("login.do") //·Î±×ÀÎ ºä·Î~
	public String memberJoin(HttpServletRequest reqeust){
		reqeust.setAttribute("jsp", "../login/login.jsp");
		
		return "main/main.jsp";
	}
}
