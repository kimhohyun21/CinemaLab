package com.cinema.member.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.member.dao.MemberVO;

@Controller
public class MemberDeleteModel {
	@RequestMapping("delete.do")
	public String memberdelete(HttpServletRequest request){
		
		request.setAttribute("jsp", "../login/mypage.jsp");
		request.setAttribute("jsp2", "../login/delete.jsp");
		return "main/main.jsp";
	}
}
