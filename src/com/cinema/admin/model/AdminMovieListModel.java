package com.cinema.admin.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.movieList.*;

@Controller
public class AdminMovieListModel {
	@RequestMapping("Amovielist.do")
	public String movieList(HttpServletRequest request){
		
		
		request.setAttribute("jsp","../adminpage/movielist.jsp");
		return "main/main.jsp";
	}
}
