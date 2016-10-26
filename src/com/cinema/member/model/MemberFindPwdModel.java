package com.cinema.member.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;

@Controller
public class MemberFindPwdModel {
	@RequestMapping("find_pwd.do")
	public String memberJoin(HttpServletRequest request){
		request.setAttribute("jsp", "../login/findpwd.jsp");
		return "main/main.jsp";
	}
}
