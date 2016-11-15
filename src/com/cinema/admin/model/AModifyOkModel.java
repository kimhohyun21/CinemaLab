package com.cinema.admin.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.cinema.admin.dao.AdminDAO;
import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.movieList.dao.MovieVO;

@Controller
public class AModifyOkModel {
	@RequestMapping("Amodify_Ok.do")
	public String modifyOk(HttpServletRequest request) {
		try {
			// 정보가져오기
			request.setCharacterEncoding("EUC-KR");
			
			String sno=request.getParameter("no");
			int no=Integer.parseInt(sno);
			System.out.println(no+"   1");
			String title = request.getParameter("title");
			String poster = request.getParameter("poster");
			String grade = request.getParameter("grade");
			String type = request.getParameter("type");
			String runtime = request.getParameter("runtime");
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			String day = request.getParameter("day");
			String content = request.getParameter("content");
			String director = request.getParameter("director");
			String genre = request.getParameter("genre");
			String cast = request.getParameter("cast");
			String trailer = request.getParameter("trailer");
						
			// opendate만들기
			String sopendate = year + "-" + month + "-" + day + " 00:00:00";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date opendate = sdf.parse(sopendate);
			
			// 저장
			MovieVO vo=new MovieVO();
			vo.setmNo(no);
			vo.setTitle(title);
			vo.setPoster(poster);
			vo.setGrade(grade);
			vo.setType(Integer.parseInt(type));
			vo.setRuntime(runtime+"분");
			vo.setContent(content);
			vo.setDirector(director);
			vo.setGenre(genre);
			vo.setCast(cast);
			vo.setTrailer(trailer);
			vo.setOpendate(opendate);			
			AdminDAO.adminMovieModify(vo);			
			
			request.setAttribute("no", no);
			
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		
		
			
		return "adminpage/station.jsp";
	}
}

