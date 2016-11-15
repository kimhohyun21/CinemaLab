package com.cinema.admin.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;

@Controller
public class AMovieInsertModel {
	@RequestMapping("AmovieInsert.do")
	public String movieInsert(HttpServletRequest request){
		
		
		request.setAttribute("jsp", "../adminpage/menubar.jsp");
		request.setAttribute("jsp2", "../adminpage/movieInsert.jsp");
		return "main/main.jsp";
	}
}
