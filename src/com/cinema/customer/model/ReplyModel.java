package com.cinema.customer.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;

@Controller
public class ReplyModel{

	@RequestMapping("reply.do")
	public String handlerRequest(HttpServletRequest request){
		//no,page 불러오기
		String no = request.getParameter("no");
		String page = request.getParameter("page");
		//no,page값 저장
		request.setAttribute("page", page);
		request.setAttribute("no", no);
		request.setAttribute("jsp", "../customer/reply.jsp");
		return "main/main.jsp";
	}
}
