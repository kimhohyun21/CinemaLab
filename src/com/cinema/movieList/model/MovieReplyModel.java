package com.cinema.movieList.model;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.member.dao.MemberVO;
import com.cinema.movieList.dao.MovieDAO;
import com.cinema.movieList.dao.MovieVO;

@Controller
public class MovieReplyModel {
	@RequestMapping("reply_ok.do")
	public String HandlerRequest(HttpServletRequest request){
		
		try {
			request.setCharacterEncoding("EUC-KR");
			
			//영화내용
			String no=request.getParameter("no");
			int b=Integer.parseInt(no);
			MovieVO vo=MovieDAO.getmoviedetail(b);
			List<MovieVO> list = MovieDAO.getmoviecharacter(b);
			String url=vo.getTrailer();
			url=url.substring(url.lastIndexOf("/")+1);
			
			request.setAttribute("url", url);
			request.setAttribute("list", list);
			request.setAttribute("vo", vo);
			
			//댓글부분
			int mNo = Integer.parseInt(no);
			String sco = request.getParameter("star-input");
			int score = Integer.parseInt(sco);
			System.out.println(score);
			String reContent = request.getParameter("content");
			HttpSession session = request.getSession();
			MemberVO vo1 = (MemberVO) session.getAttribute("mvo");
			String id = vo1.getId();
			Date regDATE = new Date();
		
			MovieVO vo2 = new MovieVO();
			vo2.setScore(score);
			vo2.setReContent(reContent);
			vo2.setRegDATE(regDATE);
			vo2.setId(id);
			vo2.setmNo(mNo);
			MovieDAO.replyInsert(vo2);

			List<MovieVO> replyList = MovieDAO.getReplyData(mNo);
			
			request.setAttribute("replyList", replyList);
			request.setAttribute("vo2", vo2);
			request.setAttribute("jsp", "../movie/moviedetail.jsp");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	
		return "main/main.jsp";
	}
}
