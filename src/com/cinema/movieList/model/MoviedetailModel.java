package com.cinema.movieList.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.member.dao.MemberVO;
import com.cinema.movieList.dao.*;

@Controller
public class MoviedetailModel {
	
	@RequestMapping("moviedetail.do")
	public String HandlerRequest(HttpServletRequest request){
		try{
			request.setCharacterEncoding("EUC-KR");
			
			//영화 상세 내용
			String no=request.getParameter("no");
			int b=Integer.parseInt(no);
			
			//영화 평점 구하기
			int totalScore=MovieDAO.replyTotalScore(b);
			int count=MovieDAO.replyCount(b);
			double result=(double)totalScore/count;
			double movieLike=Double.parseDouble(String.format("%.2f", result));
			Map map2=new HashMap();
			map2.put("movieLike", movieLike);
			map2.put("b", b);
			MovieDAO.movieLikeUpdate(map2);
			
			MovieVO vo=MovieDAO.getmoviedetail(b);
			List<MovieVO> list = MovieDAO.getmoviecharacter(b);
			String url=vo.getTrailer();
			url=url.substring(url.lastIndexOf("/")+1);
			
			request.setAttribute("url", url);
			request.setAttribute("list", list);
			request.setAttribute("vo", vo);
			request.setAttribute("jsp", "../movie/moviedetail.jsp");
			
			
			//페이지 설정
			int mNo=Integer.parseInt(no);
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
			
			request.setAttribute("block", block);
			request.setAttribute("frompage", frompage);
			request.setAttribute("topage", topage);
			request.setAttribute("curpage", curpage);
			request.setAttribute("totalpage", totalpage);
			request.setAttribute("replyList", replyList);
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return "main/main.jsp";
	}
}

















