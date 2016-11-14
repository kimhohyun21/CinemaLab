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
		//���� ����Ʈ �̾ƿ���
		List<MovieVO> list=AdminDAO.adminMovieAllList();
		
		// Opendata �ȿ� �ð� �����
		for(MovieVO vo:list){
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			String Date = sdf.format(vo.getOpendate());
			vo.setDate(Date);
		}
		
		//������ ����
		String sPage=request.getParameter("page");
		if(sPage==null)sPage="1";
		int page=Integer.parseInt(sPage);
		
		
		request.setAttribute("list", list);
		request.setAttribute("jsp","../adminpage/menubar.jsp");
		request.setAttribute("jsp2", "../adminpage/movielist.jsp");
		return "main/main.jsp";
	}
}
