package com.cinema.admin.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.admin.dao.AdminDAO;
import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.movieList.dao.MovieVO;

@Controller
public class AdminModifyMovieListModel {
	@RequestMapping("Amodifymovielist.do")
	public String modifyMovieList(HttpServletRequest request){
		System.out.println("@µé¾î¿È@");
		String sno=(String) request.getAttribute("no");
		int no = Integer.parseInt(sno);
		System.out.println("Ãâ¹ßÇÔ");
		MovieVO vo=AdminDAO.adminMovieModify(no);
		System.out.println("µ¹¾Æ¿È");
		request.setAttribute("vo", vo);
		request.setAttribute("jsp", "../adminpage/menubar.jsp");
		request.setAttribute("jsp2", "../adminpage/moviemodify.jsp");
		return "main/main.jsp";
	}
}
