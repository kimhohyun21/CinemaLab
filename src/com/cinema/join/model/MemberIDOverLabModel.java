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
				session.setAttribute("overCheckId", id);//중복아닌 ID저장
				session.setAttribute("vvvv", "체크완료");	//체크완료값 없으면 버튼클릭x
			}else{
				check=1;
		}
		request.setAttribute("check", check);
		return "join/join_ok.jsp";
	}
}
