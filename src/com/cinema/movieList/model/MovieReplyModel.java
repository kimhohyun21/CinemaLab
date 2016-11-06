package com.cinema.movieList.model;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.movieList.dao.MovieDAO;
import com.cinema.movieList.dao.MovieVO;

@Controller
public class MovieReplyModel {
	@RequestMapping("reply_ok.do")
	public String HandlerRequest(HttpServletRequest request){
		String no=request.getParameter("no");
		int mNo=Integer.parseInt(no);
		String sco=request.getParameter("score");
		int score=Integer.parseInt(sco);
		String reContent=request.getParameter("content");
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		Date regDate=new Date();
		
		MovieVO vo2=new MovieVO();
		vo2.setScore(score);
		vo2.setReContent(reContent);
		vo2.setRegDate(regDate);
		vo2.setId(id);
		vo2.setmNo(mNo);
		MovieDAO.replyInsert(vo2);
		
		request.setAttribute("vo2", vo2);
		request.setAttribute("jsp", "../movie/moviedetail.jsp");
		
		return "main/main.jsp";
	}
}
