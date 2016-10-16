package com.cinema.main.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.main.dao.*;

@Controller
public class MainModel {
	
	@RequestMapping("main.do")
	public String main(HttpServletRequest request){
		
		return "main/main.jsp";
	}
}
