package com.cinema.reserve.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.member.dao.MemberVO;
import com.cinema.reserve.dao.ReserveDAO;
import com.cinema.reserve.dao.ReserveVO;

@Controller
public class ReserveModel4 {
	
	@RequestMapping("reserve4.do")
	public String Reserve4(HttpServletRequest request){
		try{
			request.setCharacterEncoding("EUC-KR");
			
			//날짜 관련
			String year=request.getParameter("year");
			String month=request.getParameter("month");
			String checkedDay=request.getParameter("checkedDay");
			String checkedDay2=request.getParameter("checkedDay2");
			
			//극장 관련
			String tname=request.getParameter("tname");
			
			//영화 정보
			String grade=request.getParameter("grade");
			String title=request.getParameter("title");
			String poster=request.getParameter("poster");
			
			//상영시간
			String theaterNo=request.getParameter("theaterNo");
			String movietime=request.getParameter("movietime");
			
			//티켓 매수 및 금액
			String ticketAll=request.getParameter("ticketAll");
			String payment=request.getParameter("payment");
			
			//좌석
			String seatNo=request.getParameter("seatNo");;
			
			//사용자 정보
			HttpSession session=request.getSession();
			MemberVO mvo=(MemberVO) session.getAttribute("mvo");
			
			//이전 페이지 주소 획득
			String url=request.getHeader("referer");
			
			request.setAttribute("url", url);
			request.setAttribute("year", year);
			request.setAttribute("month", month);
			request.setAttribute("checkedDay", checkedDay);
			request.setAttribute("checkedDay2", checkedDay2);
			request.setAttribute("tname", tname);
			request.setAttribute("grade", grade);
			request.setAttribute("title", title);
			request.setAttribute("poster", poster);
			request.setAttribute("theaterNo", theaterNo);
			request.setAttribute("movietime", movietime);
			request.setAttribute("ticketAll", ticketAll);
			request.setAttribute("payment", payment);
			request.setAttribute("seatNo", seatNo);
			request.setAttribute("mvo", mvo);
			
			request.setAttribute("jsp", "../reserve/reserve4.jsp");		
		}catch(Exception e){
			e.printStackTrace();
		}		
		
		return "main/main.jsp";
	}

}
