package com.cinema.member.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.member.dao.*;

@Controller
public class MemberReservePageModel {
	@RequestMapping("reservePage.do")
	public String reservePage(HttpServletRequest request){
		HttpSession session=(HttpSession) request.getSession();
		MemberVO vo=(MemberVO) session.getAttribute("mvo");
		int no=vo.getNo();
		System.out.println(no);
		System.out.println("√‚πﬂ");
		List<MemberReserveListVO> list=MemberDAO.memberReserveList(no);		
		for(MemberReserveListVO vo1 : list){
			System.out.println(vo1.getRyear());
		}		
		request.setAttribute("list", list);
		request.setAttribute("jsp", "../login/mypage.jsp");
		request.setAttribute("jsp2", "../login/reservePage.jsp");
		
		return "main/main.jsp";
	}
}
