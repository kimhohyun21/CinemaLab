package com.cinema.customer.model;

import javax.servlet.http.*;
import com.cinema.controller.*;
import com.cinema.customer.dao.*;

@Controller
public class UpdateOkModel{

	@RequestMapping("update_ok.do")
	public String handlerRequest(HttpServletRequest request){
		try{
			String content=request.getParameter("content");
			String subject=request.getParameter("subject");
			String strNo=request.getParameter("no");
			String strPage=request.getParameter("page");
			int no=Integer.parseInt(strNo);
			
			CustomerVO vo = new CustomerVO();
			vo.setQcontent(content);
			vo.setQsubject(subject);
			vo.setQno(no);
			
			CustomerDAO.customerUpdate_ok(vo);
			
			request.setAttribute("page", strPage);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		
		return "customer/update_ok.jsp";
	}

}
