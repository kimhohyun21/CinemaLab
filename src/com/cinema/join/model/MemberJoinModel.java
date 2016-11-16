package com.cinema.join.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cinema.member.dao.*;
import java.util.List;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;

@Controller
public class MemberJoinModel {
	
	@RequestMapping("join.do") //회원가입 뷰로~
	public String join(HttpServletRequest request){
		
		request.setAttribute("jsp", "../join/memberjoin.jsp");		
		return "main/main.jsp";
	}
}
