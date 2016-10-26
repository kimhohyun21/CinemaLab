package com.cinema.member.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.member.dao.MemberDAO;
import com.cinema.member.dao.MemberVO;

@Controller
public class FindPwdOkModel {
	@RequestMapping("find_pwd_ok.do")
	public String memberJoin(HttpServletRequest request){
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
		
		vo.setPhone(phone);
		vo.setName(name);
		vo.setId(id);
		
		String pwd=MemberDAO.memberFindPwd(vo);
		request.setAttribute("id", "ÆÐ½º");
		request.setAttribute("pwd", pwd);
		
		request.setAttribute("jsp", "../login/giveimpo.jsp");
		return "main/main.jsp";
	}
}
