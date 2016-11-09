package com.cinema.customer.model;

import com.cinema.customer.dao.customerVO;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.customer.dao.*;

@Controller
public class ReplyOkModel{
	
	@RequestMapping("reply_ok.do")
	public String handlerRequest(HttpServletRequest request){		
		System.out.println("널 너무 사랑해서");
		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (Exception e) {			
			System.out.println(e.getMessage());
		}
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String strno = request.getParameter("no");
		int no=Integer.parseInt(strno);
		customerVO vo = new customerVO();
		vo.setName(name);
		vo.setNo(no);
		vo.setQsubject(subject);
		vo.setQcontent(content);
		customerDAO.customerReply(no, vo);
		
		return "customer/reply_ok.jsp";
	
	}
}
