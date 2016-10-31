package com.cinema.theater.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;

@Controller
public class TheaterModel {
	@RequestMapping("theater.do")
	public String main(HttpServletRequest request){
		
		
		request.setAttribute("jsp", "../theater/theater.jsp");
		
		return "main/main.jsp";
	}
}
