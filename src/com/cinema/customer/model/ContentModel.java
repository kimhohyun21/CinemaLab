package com.cinema.customer.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.customer.dao.*;

@Controller
public class ContentModel{

	@RequestMapping("content.do")
	public String handlerRequest(HttpServletRequest request){
		String no = request.getParameter("no");
		customerVO vo = customerDAO.customerContent(Integer.parseInt(no));
		
		request.setAttribute("vo", vo);
		request.setAttribute("jsp", "list.jsp");
		request.setAttribute("jsp", "../customer/content.jsp");
		
		return "main/main.jsp";
		
	}

}
