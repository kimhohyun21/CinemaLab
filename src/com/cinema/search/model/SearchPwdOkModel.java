package com.cinema.search.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.member.dao.MemberDAO;
import com.cinema.member.dao.MemberVO;

@Controller
public class SearchPwdOkModel {
	@RequestMapping("searchPwd_ok.do")
	public String searchPwd_ok(HttpServletRequest request){
		try{
			request.setCharacterEncoding("EUC-KR");
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		MemberVO vo=new MemberVO();
		
		String name=request.getParameter("name");
		String id=request.getParameter("id");
		String phone=request.getParameter("phone");		
		phone=phone.substring(0, 3)+"-"+phone.substring(3,7)+"-"+phone.substring(7,11);
		System.out.println(id);
		
		vo.setPhone(phone);
		vo.setName(name);
		vo.setId(id);
		System.out.println(vo.getId());
		String pwd=MemberDAO.memberFindPwd(vo);
		System.out.println(pwd);
		request.setAttribute("id", "ÆÐ½º");
		request.setAttribute("pwd", pwd);		
		
		request.setAttribute("jsp", "../search/giveimpo.jsp");
		return "main/main.jsp";
	}
}
