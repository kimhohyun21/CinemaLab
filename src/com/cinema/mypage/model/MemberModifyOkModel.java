package com.cinema.mypage.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		
		HttpSession session=request.getSession();
		MemberVO vo=(MemberVO) session.getAttribute("mvo");
		
		int no=vo.getNo();
		String db_pwd=MemberDAO.memberGetPwd(no);
		
		boolean pCheck=false;
		if(db_pwd.equals(pwd)){
			pCheck=true;
			phone=phone.substring(0, 3)+"-"+phone.substring(3,7)+"-"+phone.substring(7,11);
			birth=birth.substring(0, 4)+"-"+birth.substring(4,6)+"-"+birth.substring(6,8);
			
			vo.setPwd(pwd);
			vo.setName(name);
			vo.setPhone(phone);
			vo.setBirth(birth);
			MemberDAO.memberModify(vo);			
			session.setAttribute("mvo", vo);			
		}else{
			pCheck=false;
			System.out.println("false!");
		}
		request.setAttribute("pCheck", pCheck);
		
		return "login/modify_ok.jsp";
	}
}
