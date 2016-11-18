package com.cinema.join.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.member.dao.MemberDAO;

@Controller
public class MemberIDOverLabModel {
	
	@RequestMapping("idOverlab.do") 
	public String idOverlab(HttpServletRequest request){
		String id=request.getParameter("id");
		HttpSession session=request.getSession(); 
		int check=MemberDAO.memberOverlab(id);
		
			if(check==0){
				session.setAttribute("overCheckId", id);//�ߺ��ƴ� ID����
				session.setAttribute("vvvv", "üũ�Ϸ�");	//üũ�Ϸᰪ ������ ��ưŬ��x
			}else{
				check=1;
		}
		request.setAttribute("check", check);
		return "join/join_ok.jsp";
	}
}
