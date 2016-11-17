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
			
			Map map=new HashMap();
			
			String no=request.getParameter("no");
			int mNo = Integer.parseInt(no);
			System.out.println("영화 번호 : "+mNo);
			HttpSession session = request.getSession();
			MemberVO vo1 = (MemberVO) session.getAttribute("mvo");
			String id = vo1.getId();
			int memberNo=vo1.getNo();
			
			//댓글삽입
			String sco = request.getParameter("star-input");
			String reContent = request.getParameter("content");	
			Date regDATE = new Date();
			int score=0;
			
			//평점 값을 받아온 경우
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
			
			//댓글 삭제
			String rno=request.getParameter("reNo");
			int reNo=0;
			if(rno != null){
				reNo=Integer.parseInt(rno);
				MovieDAO.replyDelete(reNo);
			}
			
			//댓글 기록했었는지 체크
			int check=0;
			if(vo1!=null){
				map.put("mNo", mNo);
				map.put("memberNo", memberNo);
				check=MovieDAO.replyRecordCheck(map);
			}
		
			//영화 상세 내용
			MovieVO vo=MovieDAO.getmoviedetail(mNo);
			List<MovieVO> list = MovieDAO.getmoviecharacter(mNo);
			String url=vo.getTrailer();
			url=url.substring(url.lastIndexOf("/")+1);
		
			
			//페이지 설정
			String page=request.getParameter("page");
			if(page==null) page="1";
			int curpage=Integer.parseInt(page);
			int rowSize=5;
			int start=(curpage*rowSize)-(rowSize-1);
			int end=curpage*rowSize;
			
			map=new HashMap();
			map.put("start", start);
			map.put("end",end);
			map.put("mNo", mNo);
			
			List<MovieVO> replyList = MovieDAO.getReplyData(map);
			int totalpage=MovieDAO.replyTotalPage(mNo);
			
			int block=5;
			int frompage=((curpage-1)/block*block)+1;
			int topage=((curpage-1)/block*block)+block;
			if(topage>totalpage) topage=totalpage;
			
			//해당 영화 평균 평점 구하기
			int totalScore=MovieDAO.replyTotalScore(mNo);
			int count=MovieDAO.replyCount(mNo);
			double result=(double)totalScore/count;
			double movieLike=Double.parseDouble(String.format("%.2f", result));
			map=new HashMap();
			map.put("movieLike", movieLike);
			map.put("mNo", mNo);
			MovieDAO.movieLikeUpdate(map);
					
			request.setAttribute("url", url);
			request.setAttribute("list", list);
			request.setAttribute("vo", vo);
			request.setAttribute("check", check);
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
