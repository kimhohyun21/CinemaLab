package com.cinema.customer.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;

@Controller
public class InsertModel{

	@RequestMapping("insert.do")
	public String handlerRequest(HttpServletRequest request){
		request.setAttribute("jsp", "../customer/insert.jsp");
		System.out.println("¿Ô´Ï?");
		return "main/main.jsp";
	}
}
