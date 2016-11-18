package com.cinema.mypage.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.member.dao.MemberDAO;
import com.cinema.member.dao.MemberVO;

@Controller
public class MemberModifyModel {
	
	@RequestMapping("memberModify.do")
	public String memberModify(HttpServletRequest request){
		String strno=request.getParameter("no");
		int no=Integer.parseInt(strno);		
		MemberVO vo=MemberDAO.memberGetAllImfor(no);
		String birth=vo.getBirth();
		String phone=vo.getPhone();
		String name=vo.getName();
		
		// 입력폼 맞추기  )1998-11-11 => 19981111
		birth=birth.replace("-", "");
		phone=phone.replace("-", "");
		
		request.setAttribute("name", name);
		request.setAttribute("phone", phone);
		request.setAttribute("birth", birth);
		
		request.setAttribute("jsp", "../mypage/mypage.jsp");
		request.setAttribute("jsp2", "../mypage/modify.jsp");
		
		return "main/main.jsp";
	}
}
