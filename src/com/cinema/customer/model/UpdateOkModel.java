package com.cinema.customer.model;

import javax.servlet.http.*;
import com.cinema.controller.*;
import com.cinema.customer.dao.*;

@Controller
public class UpdateOkModel{

	@RequestMapping("update_ok.do")
	public String handlerRequest(HttpServletRequest request){
		try{
			request.setCharacterEncoding("EUC-KR");
			String content=request.getParameter("content");
			String subject=request.getParameter("subject");
			String strNo=request.getParameter("no");
			String strPage=request.getParameter("page");
			int no=Integer.parseInt(strNo);
			
			System.out.println("얼굴값을 못한대");
			
			customerVO vo = new customerVO();
			vo.setQcontent(content);
			vo.setQsubject(subject);
			vo.setQno(no);
			customerDAO.customerUpdate_ok(vo);
			request.setAttribute("page", strPage);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		
		return "customer/update_ok.jsp";
	}

}
