package com.cinema.mypage.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.tomcat.util.http.fileupload.ParameterParser;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.member.dao.*;

@Controller
public class MemberReserveListModel {
	@RequestMapping("reserveList.do")
	public String reserveList(HttpServletRequest request){
				
		String strno=request.getParameter("no");
		System.out.println(strno);
		int no=Integer.parseInt(strno);
		
		// 회원 예매내역 전부 가져오기
		List<MemberReserveListVO> list=MemberDAO.memberReserveList(no);
		
		
		/*List<MemberReserveListVO> pastlist=new ArrayList<>();
		List<MemberReserveListVO> nowlist=new ArrayList<>();
		for(MemberReserveListVO mvo : list){
			int year=mvo.getRyear();
			int month=mvo.getRmonth();
			int day=mvo.getRday();
			String date=year+"-"+month+"-"+day;
			String rDate= new SimpleDateFormat("yyyy-MM-dd").format(date);
			String tDate= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		}*/
		/*
		 *	삭제될 예정인놈
		 * String type=request.getParameter("type");
		int type2=Integer.parseInt(type);
		
		if(type2 == 0){	
			list=MemberDAO.memberReserveList(no);
			request.setAttribute("list", list);
		}
		if(type2 == 1){
			//오늘 날짜 구하기
			SimpleDateFormat fyear= new SimpleDateFormat("yyyy");
			SimpleDateFormat fmonth= new SimpleDateFormat("MM");
			SimpleDateFormat fday= new SimpleDateFormat("dd");
			Date today = new Date();
			int year =Integer.parseInt(fyear.format(today));
			int month =Integer.parseInt(fmonth.format(today));
			int day =Integer.parseInt(fday.format(today));			
		}
		 */
		
		request.setAttribute("list", list);
		
		
		request.setAttribute("jsp", "../mypage/mypage.jsp");
		request.setAttribute("jsp2", "../mypage/reserveList.jsp");
		
		return "main/main.jsp";
	}
}
