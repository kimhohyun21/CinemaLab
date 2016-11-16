package com.cinema.login.model;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.member.dao.*;

@Controller
public class MemberLoginOkModel {
	
	@RequestMapping("login_ok.do") // 로그인 체크
	public String login_Ok(HttpServletRequest request){
		try{
			request.setCharacterEncoding("EUC-KR");
		}catch(Exception ex){
			ex.printStackTrace();
		}		
		
		String check="";
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String loginType=request.getParameter("loginType");
		
		int idcheck=MemberDAO.memberIdCheck(id);
		
		if(idcheck==0){
			check="idnot";
		}else{
			MemberVO vo = MemberDAO.memberGetImfor(id);			
			if(pwd.equals(vo.getPwd())){
				HttpSession session=request.getSession();
				//패스워드 초기화
				vo.setPwd("");
				//회원정보 저장(name,no,id,admin)
				session.setAttribute("mvo", vo);
				check="ok";
			}else{
				check="pwdnot";
			}
		}
		// 로그인하기 이전 URL
		String url=request.getHeader("referer");		
		request.setAttribute("url", url);
		request.setAttribute("loginType", loginType);
		request.setAttribute("check", check);		
		
		
		return "login/login_ok.jsp";		
	}
}
