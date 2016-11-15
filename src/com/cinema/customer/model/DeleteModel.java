package com.cinema.customer.model;

import javax.servlet.http.*;
import com.cinema.controller.*;
import com.cinema.customer.dao.*;

@Controller
public class DeleteModel{

	@RequestMapping("delete.do")
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
			CustomerDAO.customerDelete(vo);
			request.setAttribute("page", strPage);
			System.out.println(no);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		
		return "customer/delete.jsp";
	}

}
