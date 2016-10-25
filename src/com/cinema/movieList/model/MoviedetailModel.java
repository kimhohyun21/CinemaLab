package com.cinema.movieList.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.movieList.dao.*;

@Controller
public class MoviedetailModel {
	
	@RequestMapping("moviedetail.do")
	public String HandlerRequest(HttpServletRequest request){
		String no=request.getParameter("no");
		int a=Integer.parseInt(no);
		
		MovieVO vo=MovieDAO.getmoviedetail(a);
		
		request.setAttribute("vo", vo);
		request.setAttribute("jsp", "../movie/moviedetail.jsp");
		return "main/main.jsp";
	}
}
