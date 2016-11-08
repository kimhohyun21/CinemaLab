package com.cinema.main.model;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.main.dao.*;

@Controller
public class MainModel {
	
	@RequestMapping("main.do")
	public String main(HttpServletRequest request){
				
		List<MainVO> plist=MainDAO.getMovieListData();
		List<MainVO> plist2=new ArrayList<>();
		for(MainVO vo : plist){
			String url=vo.getTrailer();
			url=url.substring(url.lastIndexOf("/")+1);
			vo.setTrailer(url);
			plist2.add(vo);
		}
		
		request.setAttribute("plist2", plist2);
		request.setAttribute("jsp", "default.jsp");

		
		return "main/main.jsp";
	}
}
