package com.cinema.admin.model;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cinema.admin.dao.AdminDAO;
import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.movieList.*;
import com.cinema.movieList.dao.MovieVO;

@Controller
public class AMovieListModel {
	@RequestMapping("Amovielist.do")
	public String movieList(HttpServletRequest request){
		//무비 리스트 뽑아오기
		List<MovieVO> list=AdminDAO.adminMovieAllList();
		
		// Opendata 안에 시간 지우기
		for(MovieVO vo:list){
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			String Date = sdf.format(vo.getOpendate());
			vo.setDate(Date);
		}
		
		//페이지 재료들
		String sPage=request.getParameter("page");
		if(sPage==null)sPage="1";
		int page=Integer.parseInt(sPage);
		
		
		request.setAttribute("list", list);
		request.setAttribute("jsp","../adminpage/menubar.jsp");
		request.setAttribute("jsp2", "../adminpage/movielist.jsp");
		return "main/main.jsp";
	}
}
