package com.cinema.customer.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;

@Controller
public class ReplyModel{

	@RequestMapping("reply.do")
	public String handlerRequest(HttpServletRequest request){
		request.setAttribute("jsp", "../customer/reply.jsp");
		System.out.println("°«¼±ºó");
		return "main/main.jsp";
	}
}
