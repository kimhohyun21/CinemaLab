package com.cinema.search.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.member.dao.*;

@Controller
public class SearchIdOkModel {
	@RequestMapping("searchId_ok.do")
	public String searchId_ok(HttpServletRequest request){
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
		
		request.setAttribute("jsp", "../search/giveimpo.jsp");
		return "main/main.jsp";
	}
}
