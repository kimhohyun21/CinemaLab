package com.cinema.mypage.model;

import java.text.ParseException;
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
	public String reserveList(HttpServletRequest request) {

		String strno = request.getParameter("no");
		//예매내역,관람내역 구분
		String type = request.getParameter("type");
		int no = Integer.parseInt(strno);
		List<MemberReserveListVO> list;
		
		//페이지 재료
		String sPage=request.getParameter("page");
		if(sPage==null) sPage="1";
		
		int page=Integer.parseInt(sPage);	// 현재페이지
		int start;							// 처음번호
		int end;							// 마지막번호
		int row=3;							// 컬럼 사이즈
		int rowCount;						// 총 내역
		int totalPage=1;					// 총 페이지
		int block;
		int fromPage;
		int toPage;
		
		if (type == null)
			type = "0";
		
		if (type.equals("1")) {
			// 관람내역 가져오기
			list = MemberDAO.memberWhatchData(no);
			//마지막페이지
			rowCount=MemberDAO.ReserveCount(no);			
		} else {
			// 예매내역
			list = MemberDAO.memberReserveList(no);
			//request.setAttribute("check", "ok");
			
			//마지막페이지
			rowCount=MemberDAO.ReserveCount2(no);
		}
		
		//리스트에서  쓸날짜구하기
		try {
			for (MemberReserveListVO vo : list) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
				String sDate = sdf.format(vo.getRdate());
				System.out.println(vo.getRdate());
				vo.setListdate(sDate);
			}
			
		} catch (Exception e) {
				System.out.println(e.getMessage());
		}
		
		// 페이지 구하기	
		start = (page*row)-(row-1); // 1, 4, 7...
		end = (page*row); // 3, 6, 9				
		totalPage=(rowCount/row)+1;
		
		// 페이지 넘버링
		block=5;
		fromPage=((page-1)/block*block)+1;
		toPage=((page-1)/block*block)+block;
		
		if(toPage>totalPage)
			toPage=totalPage;
		
		//예매취소 비교용
		Date today=new Date();
		
		request.setAttribute("fromPage", fromPage);
		request.setAttribute("toPage", toPage);
		request.setAttribute("block", block);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("page", page);		
		request.setAttribute("today", today);		
		request.setAttribute("type", type);
		request.setAttribute("list", list);
		request.setAttribute("jsp", "../mypage/mypage.jsp");
		request.setAttribute("jsp2", "../mypage/reserveList.jsp");

		return "main/main.jsp";
	}
}
