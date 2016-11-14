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
			
			System.out.println(title+"   2");
			System.out.println(poster+"   3");
			System.out.println(grade+"   4");
			System.out.println(type+"   5");
			System.out.println(runtime);
			System.out.println(year);
			System.out.println(month);
			System.out.println(day);
			System.out.println(content);
			System.out.println(director);
			System.out.println(genre);
			System.out.println(cast);
			System.out.println(trailer);
			
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
			System.out.println("통과2");
			request.setAttribute("jsp", "../movie/movieList.jsp");
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		
			
		return "main/main.jsp";
	}
}

