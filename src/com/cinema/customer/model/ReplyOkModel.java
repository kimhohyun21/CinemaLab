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
		try {
			//작성한 내용 불러오기
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
			vo.setGroup_step(pvo.getGroup_step()+1);
			vo.setGroup_tab(pvo.getGroup_tab()+1);
			vo.setNo(no);
			vo.setRoot(qno);
			vo.setQsubject(subject);
			vo.setQcontent(content);
			CustomerDAO.customerReply(vo);
			
		} catch (Exception e) {			
			System.out.println(e.getMessage());
		}		
		
		
		
		return "customer/reply_ok.jsp";
	
	}
}
