package com.cinema.member.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;

import com.cinema.member.dao.*;

@Controller
public class MemberDeleteOkModel {
	@RequestMapping("delete_ok.do")
	public String delete_ok(HttpServletRequest request){
		try{
			request.setCharacterEncoding("EUC-KR");
			HttpSession session=request.getSession();
			MemberVO vo=(MemberVO) session.getAttribute("mvo");								
			String pwd=request.getParameter("pwd");
			System.out.println(pwd+"@@@@");
			System.out.println(vo.getPwd());
			System.out.println(vo.getNo());
			
			String db_pwd=MemberDAO.memberFindPwd(vo);
			System.out.println(db_pwd);
			int check=3;
			
			if(db_pwd.equals(pwd)){
				MemberDAO.memberDelete(vo);
				session.invalidate();
				check=1;
			}else{
				check=0;
			}
			request.setAttribute("check", check);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		
		
		return "login/delete_ok.jsp";
	}
}
