package com.cinema.member.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.member.dao.MemberDAO;

@Controller
public class OverLabModel {
	
	@RequestMapping("overlab.do") 
	public String memberJoin(HttpServletRequest request){
		String id=request.getParameter("id");
		int check=MemberDAO.memberOverlab(id);
		System.out.println(id);
		if(id==""){
			check=1;			
		}else{
			if(check==0){
				HttpSession session=request.getSession(); 
				session.setAttribute("ok", "사용가능한 ID입니다 ^^");
				session.setAttribute("overCheckId", id);
				//request.setAttribute("ok", "ok");
			}else{
				check=1;
			}
		}
		request.setAttribute("check", check);
		return "login/join_ok.jsp";
	}
}
