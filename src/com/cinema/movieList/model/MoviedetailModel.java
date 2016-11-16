package com.cinema.movieList.model;

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
			Map map=new HashMap();
			String no=request.getParameter("no");
			int mNo = Integer.parseInt(no);
			HttpSession session = request.getSession();
			MemberVO vo1 = (MemberVO) session.getAttribute("mvo");
			
			int check=0;
			if(vo1!=null){	//로그인이 됬을 경우
				int memberNo=vo1.getNo();
				
				//댓글 기록 여부 확인
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
			String type=request.getParameter("type");
			if(page==null) page="1";
			int curpage=Integer.parseInt(page);
			int rowSize=5;
			int start=(curpage*rowSize)-(rowSize-1);
			int end=curpage*rowSize;
			
			map=new HashMap();
			map.put("start", start);
			map.put("end",end);
			map.put("mNo", mNo);
			
			//디비에 있는 댓글 뿌려주기
			List<MovieVO> replyList = MovieDAO.getReplyData(map);
			int totalpage=MovieDAO.replyTotalPage(mNo);
			
			
			int block=5;
			int frompage=((curpage-1)/block*block)+1;
			int topage=((curpage-1)/block*block)+block;
			if(topage>totalpage) topage=totalpage;
			
			request.setAttribute("url", url);
			request.setAttribute("list", list);
			request.setAttribute("vo", vo);
			request.setAttribute("jsp", "../movie/moviedetail.jsp");
			request.setAttribute("no", no);
			request.setAttribute("check", check);
			request.setAttribute("type", type);
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

















