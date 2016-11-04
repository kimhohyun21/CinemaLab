package com.cinema.movieList.model;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.movieList.dao.*;

@Controller
public class MovieListModel {
	
	@RequestMapping("movieList.do")
	public String movieList(HttpServletRequest request){
				
		String type=request.getParameter("type");
		if(type==null)
			type="1";
		int a=Integer.parseInt(type);
		List<MovieVO> list=MovieDAO.getmovieList(a);
		request.setAttribute("list", list);
		String url3="http://www.lottecinema.co.kr//LCHS/Image/Bg/bg_grade_15.png";
		request.setAttribute("jsp", "../movie/movieList.jsp");
		request.setAttribute("url3", url3);
		
		return "main/main.jsp";
	}
}
