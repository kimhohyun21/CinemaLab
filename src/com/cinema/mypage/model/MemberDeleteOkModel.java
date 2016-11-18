package com.cinema.mypage.model;

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
			
			String strno=request.getParameter("no");
			int no=Integer.parseInt(strno);
			MemberVO vo=MemberDAO.memberGetAllImfor(no);
			//DB값
			String db_pwd=vo.getPwd();			
			//입력값
			String pwd=request.getParameter("pwd");
			
			int check=3;
			
			if(db_pwd.equals(pwd)){
				MemberDAO.memberDelete(vo);
				HttpSession session=request.getSession();
				//저장됬던 세션날리기
				session.invalidate();
				check=1;
			}else{
				check=0;
			}
			request.setAttribute("check", check);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		
		
		return "mypage/delete_ok.jsp";
	}
}
