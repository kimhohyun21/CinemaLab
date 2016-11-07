package com.cinema.mypage.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;

@Controller
public class MemberChagePwdModel {
	@RequestMapping("memberChangepwd.do")
	public String memberChangePwd(HttpServletRequest request){
		request.setAttribute("jsp", "../mypage/mypage.jsp");
		request.setAttribute("jsp2", "../mypage/change_pwd.jsp");
		return "main/main.jsp";
	}
	
}
