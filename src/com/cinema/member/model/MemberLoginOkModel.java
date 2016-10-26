package com.cinema.member.model;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.member.dao.*;

@Controller
public class MemberLoginOkModel {
	
	@RequestMapping("login_ok.do") // 로그인 체크
	public String memberJoin(HttpServletRequest request){
		try{
			request.setCharacterEncoding("EUC-KR");
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		
		MemberDAO dao=new MemberDAO();
		String check="";
		int idcheck=dao.memberIdCheck(id);
		
		if(idcheck==0){
			check="idnot";
		}else{
			MemberVO vo=(MemberVO) dao.memberGetImfor(id);			
			if(pwd.equals(vo.getPwd())){
				HttpSession session=request.getSession();
				/*session.setAttribute("id", id);
				session.setAttribute("pwd", pwd);
				session.setAttribute("name", vo.getName());
				session.setAttribute("phone", vo.getPhone());
				session.setAttribute("birth", vo.getBirth());
				session.setAttribute("no", vo.getNo());*/
				session.setAttribute("mvo", vo);
				check="ok";
			}else{
				check="pwdnot";
			}
		}
		request.setAttribute("check", check);		
		
		
		return "login/loginok.jsp";		
	}
}
