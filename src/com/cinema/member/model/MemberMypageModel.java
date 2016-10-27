package com.cinema.member.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;

@Controller
public class MemberMypageModel {
	@RequestMapping("mypage.do")
	public String mypage(HttpServletRequest request){
		request.setAttribute("jsp", "../login/mypage.jsp");
		return "main/main.jsp";
	}
}
