package com.cinema.login.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;

@Controller
public class MemberLogin {
	@RequestMapping("login.do") //�α��� ���~
	public String login(HttpServletRequest reqeust){
		reqeust.setAttribute("jsp", "../login/login.jsp");
		
		return "main/main.jsp";
	}
}
