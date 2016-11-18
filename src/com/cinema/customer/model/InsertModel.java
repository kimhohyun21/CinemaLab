package com.cinema.customer.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;

@Controller
public class InsertModel{

	@RequestMapping("insert.do")
	public String handlerRequest(HttpServletRequest request){
		//insert.jsp의 내용을 jsp로 함축
		request.setAttribute("jsp", "../customer/insert.jsp");
		return "main/main.jsp";
	}
}
