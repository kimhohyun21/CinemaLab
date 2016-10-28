package com.cinema.member.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.member.dao.MemberDAO;
import com.cinema.member.dao.MemberVO;

@Controller
public class MemberModifyOkModel {
	@RequestMapping("modify_ok.do")
	public String memberModify_Ok(HttpServletRequest request){
		try{
			request.setCharacterEncoding("EUC-KR");
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		
		String pwd=request.getParameter("pwd");
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String birth=request.getParameter("birth");
		phone=phone.substring(0, 3)+"-"+phone.substring(3,7)+"-"+phone.substring(7,11);
		birth=birth.substring(0, 4)+"-"+birth.substring(4,6)+"-"+birth.substring(6,8);
					
		MemberVO vo=new MemberVO();
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setPhone(phone);
		vo.setBirth(birth);
		
		//MemberDAO.
		
		request.setAttribute("jsp", "../login/mypage.jsp");
		return "main/main.jsp";
	}
}
