package com.cinema.member.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;

@Controller
public class MemberChagePwdModel {
	@RequestMapping("changepwd.do")
	public String ChangePwdModel(HttpServletRequest request){
		request.setAttribute("jsp", "../login/mypage.jsp");
		request.setAttribute("jsp2", "../login/change_pwd.jsp");
		return "main/main.jsp";
	}
	
}
