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
		int type2=Integer.parseInt(type);
		List<MovieVO> list=MovieDAO.getmovieList(type2);
		request.setAttribute("list", list);
		request.setAttribute("jsp", "../movie/movieList.jsp");
		
		return "main/main.jsp";
	}
}
