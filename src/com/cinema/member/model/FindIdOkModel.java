package com.cinema.member.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.member.dao.*;

@Controller
public class FindIdOkModel {
	@RequestMapping("find_id_ok.do")
	public String memberJoin(HttpServletRequest request){
		try{
			request.setCharacterEncoding("EUC-KR");
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		MemberDAO dao=new MemberDAO();
		MemberVO vo=new MemberVO();
		
		String name=request.getParameter("name");
		String birth=request.getParameter("birth");
		String phone=request.getParameter("phone");
		
		vo.setName(name);
		vo.setBirth(birth);
		vo.setPhone(phone);
		
		String id=dao.memberFindId(vo);
		request.setAttribute("pwd", "ÆÐ½º");
		request.setAttribute("id", id);
		
		request.setAttribute("jsp", "../login/giveimpo.jsp");
		return "main/main.jsp";
	}
}
