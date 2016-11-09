package com.cinema.customer.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;

@Controller
public class ReplyModel{

	@RequestMapping("reply.do")
	public String handlerRequest(HttpServletRequest request){
		String no = request.getParameter("no");
		String page = request.getParameter("page");
		request.setAttribute("page", page);
		request.setAttribute("no", no);
		request.setAttribute("jsp", "../customer/reply.jsp");
		System.out.println("°«¼±ºó");
		return "main/main.jsp";
	}
}
