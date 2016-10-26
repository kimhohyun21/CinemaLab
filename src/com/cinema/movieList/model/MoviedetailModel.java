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
		String url=vo.getTrailer();
		System.out.println(url);
		url=url.substring(url.lastIndexOf("/")+1);
		System.out.println(url);
		request.setAttribute("url", url);
		request.setAttribute("vo", vo);
		request.setAttribute("jsp", "../movie/moviedetail.jsp");
		return "main/main.jsp";
	}
}
