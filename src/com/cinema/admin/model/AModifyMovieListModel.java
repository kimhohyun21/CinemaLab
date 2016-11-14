package com.cinema.admin.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.cinema.admin.dao.AdminDAO;
import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.movieList.dao.MovieVO;

@Controller
public class AModifyMovieListModel {
	@RequestMapping("Amodifymovielist.do")
	public String modifyMovieList(HttpServletRequest request){
		String sno=(String) request.getParameter("no");	
		int no = Integer.parseInt(sno);		
		
		
		//영화정보들 가져오기
		MovieVO vo=AdminDAO.adminMovieData(no);
		
		SimpleDateFormat yearF=new SimpleDateFormat("yyyy");
		SimpleDateFormat monthF=new SimpleDateFormat("MM");
		SimpleDateFormat dayF=new SimpleDateFormat("dd");
		String year = yearF.format(vo.getOpendate());
		String month = monthF.format(vo.getOpendate());
		String day = dayF.format(vo.getOpendate());
		
		/*// 줄거리 공백조정
		String content=vo.getContent();
		content.replaceAll("\r\n", "<br>");
		content.replaceAll("\u0020", " ");
		vo.setContent(content);*/
		
		// 상영시간 '분'빼기
		String runtime=vo.getRuntime().replaceAll("분", "");
		vo.setRuntime(runtime);
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("vo", vo);
		request.setAttribute("jsp", "../adminpage/menubar.jsp");
		request.setAttribute("jsp2", "../adminpage/moviemodify.jsp");
		return "main/main.jsp";
	}
}
