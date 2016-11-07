package com.cinema.customer.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.*;
import com.cinema.customer.dao.*;

@Controller
public class ContentModel{

	@RequestMapping("content.do")
	public String handlerRequest(HttpServletRequest request){
		String no = request.getParameter("no");
		String page= request.getParameter("page");
		customerVO vo = customerDAO.customerContent(Integer.parseInt(no));
		request.setAttribute("no", no);
		request.setAttribute("page", page);
		request.setAttribute("vo", vo);
		request.setAttribute("jsp", "list.jsp");
		request.setAttribute("jsp", "../customer/content.jsp");
		
		return "main/main.jsp";
		
	}

}
