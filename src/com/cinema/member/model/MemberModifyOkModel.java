package com.cinema.member.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;

@Controller
public class MemberModifyOkModel {
	public String memberModify_Ok(HttpServletRequest request){
		
		
		
		request.setAttribute("jsp", "../login/mypage.jsp");
		return "main/main.jsp";
	}
}
