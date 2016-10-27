package com.cinema.reserve.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;

@Controller
public class ReserveModel3 {
	@RequestMapping("reserve3.do")
	public String main(HttpServletRequest request){
		
		return "reserve/reserve3.jsp";
	}

}
