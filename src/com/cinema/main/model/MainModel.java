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
		
		//상영 중인 영화 정보 얻어오기
		List<MainVO> plist=MainDAO.getMovieListData();
		List<MainVO> plist2=new ArrayList<>();
		for(MainVO vo : plist){
			String url=vo.getTrailer();
			url=url.substring(url.lastIndexOf("/")+1);
			vo.setTrailer(url);
			plist2.add(vo);
		}
		
		request.setAttribute("plist2", plist2);
		request.setAttribute("jsp", "Main_Default.jsp");

		
		return "main/main.jsp";
	}
}
