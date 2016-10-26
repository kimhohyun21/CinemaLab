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
		int b=Integer.parseInt(no);
		MovieVO vo=MovieDAO.getmoviedetail(b);
		String url=vo.getTrailer();
		url=url.substring(url.lastIndexOf("/")+1);
		request.setAttribute("url", url);
		request.setAttribute("vo", vo);
		request.setAttribute("jsp", "../movie/moviedetail.jsp");
		
		return "main/main.jsp";
	}
}
