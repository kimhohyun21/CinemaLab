package com.cinema.mypage.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.member.dao.MemberVO;

@Controller
public class MemberDeleteModel {
	@RequestMapping("memberDelete.do")
	public String memberDelete(HttpServletRequest request){
		
		request.setAttribute("jsp", "../mypage/mypage.jsp");
		request.setAttribute("jsp2", "../mypage/delete.jsp");
		return "main/main.jsp";
	}
}
