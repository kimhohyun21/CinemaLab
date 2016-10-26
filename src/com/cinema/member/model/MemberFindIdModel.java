package com.cinema.member.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;

@Controller
public class MemberFindIdModel {
	@RequestMapping("find_id.do")
	public String memberJoin(HttpServletRequest request){
		request.setAttribute("jsp", "../login/findid.jsp");
		return "main/main.jsp";
	}
}
