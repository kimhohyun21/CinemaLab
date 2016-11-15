package com.cinema.customer.model;

import com.cinema.customer.dao.CustomerVO;
import com.cinema.member.dao.MemberVO;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.customer.dao.*;

@Controller
public class ReplyOkModel{
	
	@RequestMapping("qreply_ok.do")
	public String handlerRequest(HttpServletRequest request){		
		System.out.println("널 너무 사랑해서");
		try {
			request.setCharacterEncoding("EUC-KR");
			String content = request.getParameter("content");
			String subject = request.getParameter("subject");
			String strno = request.getParameter("no");
			int qno=Integer.parseInt(strno);
			HttpSession session = request.getSession();
			MemberVO mvo=(MemberVO) session.getAttribute("mvo");
			int no=mvo.getNo();
			CustomerVO pvo=CustomerDAO.customerGroupData(qno);
			CustomerDAO.StepUpdate(pvo);
			
			CustomerVO vo = new CustomerVO();
			vo.setGroup_id(pvo.getGroup_id());
			System.out.println(pvo.getGroup_id());
			vo.setGroup_step(pvo.getGroup_step()+1);
			System.out.println(pvo.getGroup_step()+1);
			vo.setGroup_tab(pvo.getGroup_tab()+1);
			System.out.println(pvo.getGroup_tab()+1);
			vo.setNo(no);
			System.out.println(no);
			vo.setRoot(qno);
			System.out.println(qno);
			vo.setQsubject(subject);
			System.out.println(subject);
			vo.setQcontent(content);
			System.out.println(content);
			CustomerDAO.customerReply(vo);
			
		} catch (Exception e) {			
			System.out.println(e.getMessage());
		}		
		
		
		
		return "customer/reply_ok.jsp";
	
	}
}
