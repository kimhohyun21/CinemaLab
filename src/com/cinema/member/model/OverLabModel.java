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
	public String memberJoin(HttpServletRequest reqeust){
		String id=reqeust.getParameter("id");
		int check=MemberDAO.memberOverlab(id);
		System.out.println(id);
		if(id==""){
			check=1;			
		}else{
			if(check==0){
				HttpSession session=reqeust.getSession(); 
				session.setAttribute("ok", "ok");
			}else{
				check=1;
			}
		}
		reqeust.setAttribute("check", check);
		return "login/join_ok.jsp";
	}
}
