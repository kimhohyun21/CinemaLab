package com.cinema.join.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.member.dao.*;

@Controller
public class MemberJoinOkModel {
	
	@RequestMapping("join_ok.do") //회원등록
	public String join_ok(HttpServletRequest request){
		int countid=0;
		try{
			request.setCharacterEncoding("EUC-KR");
			String id=request.getParameter("id");
			String pwd=request.getParameter("pwd");
			String name=request.getParameter("name");
			String phone=request.getParameter("phone");
			String birth=request.getParameter("birth");
			
			phone=phone.substring(0, 3)+"-"+phone.substring(3,7)+"-"+phone.substring(7,11);
			birth=birth.substring(0, 4)+"-"+birth.substring(4,6)+"-"+birth.substring(6,8);
						
			MemberVO vo=new MemberVO();
			vo.setId(id);
			vo.setPwd(pwd);
			vo.setName(name);
			vo.setPhone(phone);
			vo.setBirth(birth);
			MemberDAO.memberInsert(vo);
			
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		request.setAttribute("join", "가입성공");
		request.setAttribute("jsp", "../login/login.jsp");

		return "main/main.jsp";
	}
}
