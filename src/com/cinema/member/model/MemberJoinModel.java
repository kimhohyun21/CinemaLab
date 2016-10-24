package com.cinema.member.model;

import javax.servlet.http.HttpServletRequest;
import com.cinema.member.dao.*;
import java.util.List;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;

@Controller
public class MemberJoinModel {
	
	@RequestMapping("member.do") //회원가입 뷰로~
	public String memberJoin(HttpServletRequest request){
		
		
		/*List<MemberVO> ss=new MemberDAO().memberOverlab();
		
		for(MemberVO s:ss){
			System.out.println(s);
		}*/
		request.setAttribute("jsp", "../login/memberjoin.jsp");		
		return "main/main.jsp";
	}
}
