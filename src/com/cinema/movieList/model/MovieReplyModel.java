package com.cinema.movieList.model;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.member.dao.MemberVO;
import com.cinema.movieList.dao.MovieDAO;
import com.cinema.movieList.dao.MovieVO;

@Controller
public class MovieReplyModel {
	@RequestMapping("replyCheck.do")
	public String HandlerRequest(HttpServletRequest request){
		
		try {
			request.setCharacterEncoding("EUC-KR");

			//¥Ò±€ ªË¡¶
			String rno=request.getParameter("reNo");
			int reNo=0;
			if(rno != null){
				reNo=Integer.parseInt(rno);
				MovieDAO.replyDelete(reNo);
			}
			
			//øµ»≠≥ªøÎ
			String no=request.getParameter("no");
			int b=Integer.parseInt(no);
			MovieVO vo=MovieDAO.getmoviedetail(b);
			List<MovieVO> list = MovieDAO.getmoviecharacter(b);
			String url=vo.getTrailer();
			url=url.substring(url.lastIndexOf("/")+1);
			
			request.setAttribute("url", url);
			request.setAttribute("list", list);
			request.setAttribute("vo", vo);
			
			//¥Ò±€ª¿‘
			int mNo = Integer.parseInt(no);
			String sco = request.getParameter("star-input");
			int score=0;
			String reContent = request.getParameter("content");
			HttpSession session = request.getSession();
			MemberVO vo1 = (MemberVO) session.getAttribute("mvo");
			String id = vo1.getId();
			Date regDATE = new Date();
			if(sco!=null){
				score = Integer.parseInt(sco);
				MovieVO vo2 = new MovieVO();
				vo2.setScore(score);
				vo2.setReContent(reContent);
				vo2.setRegDATE(regDATE);
				vo2.setId(id);
				vo2.setmNo(mNo);
				MovieDAO.replyInsert(vo2);
			}
				
			//∆‰¿Ã¡ˆ
			String page=request.getParameter("page");
			if(page==null) page="1";
			int curpage=Integer.parseInt(page);
			int rowSize=5;
			int start=(curpage*rowSize)-(rowSize-1);
			int end=curpage*rowSize;
			
			Map map=new HashMap();
			map.put("start", start);
			map.put("end",end);
			map.put("mNo", mNo);
			
			List<MovieVO> replyList = MovieDAO.getReplyData(map);
			int totalpage=MovieDAO.replyTotalPage(mNo);
			
			int block=5;
			int frompage=((curpage-1)/block*block)+1;
			int topage=((curpage-1)/block*block)+block;
			if(topage>totalpage) topage=totalpage;
			
			
			request.setAttribute("mNo", mNo);
			request.setAttribute("block", block);
			request.setAttribute("frompage", frompage);
			request.setAttribute("topage", topage);
			request.setAttribute("curpage", curpage);
			request.setAttribute("totalpage", totalpage);
			request.setAttribute("replyList", replyList);
			request.setAttribute("id", id);
			request.setAttribute("jsp", "../movie/moviedetail.jsp");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	
		return "main/main.jsp";
	}
}
