package com.cinema.mypage.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.member.dao.MemberVO;

@Controller
public class MemberModifyModel {
	
	@RequestMapping("memberModify.do")
	public String memberModify(HttpServletRequest request){
		HttpSession session=request.getSession();
		MemberVO mvo=(MemberVO) session.getAttribute("mvo");
		
		String birth=mvo.getBirth();
		String phone=mvo.getPhone();
		birth=birth.replace("-", "");
		phone=phone.replace("-", "");
		mvo.setBirth(birth);
		mvo.setPhone(phone);
		
		request.setAttribute("jsp", "../mypage/mypage.jsp");
		request.setAttribute("jsp2", "../mypage/modify.jsp");
		
		return "main/main.jsp";
	}
}
