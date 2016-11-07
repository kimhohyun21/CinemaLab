package com.cinema.movieList.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.movieList.dao.*;

@Controller
public class MoviedetailModel {
	
	@RequestMapping("moviedetail.do")
	public String HandlerRequest(HttpServletRequest request){
		String no=request.getParameter("no");
		int b=Integer.parseInt(no);
		MovieVO vo=MovieDAO.getmoviedetail(b);
		List<MovieVO> list = MovieDAO.getmoviecharacter(b);
		String url=vo.getTrailer();
		url=url.substring(url.lastIndexOf("/")+1);
		
		request.setAttribute("url", url);
		request.setAttribute("list", list);
		request.setAttribute("vo", vo);
		request.setAttribute("jsp", "../movie/moviedetail.jsp");
		
		//댓글 부분
		String mNo=request.getParameter("no");	//영화 key
		List<MovieVO> replyList=MovieDAO.getReplyData(Integer.parseInt(mNo));
		
		request.setAttribute("replyList", replyList);
		
		return "main/main.jsp";
	}
}
