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
		String type = request.getParameter("type");
		if (type == null)
			type = "0";

		int no = Integer.parseInt(strno);
		List<MemberReserveListVO> list;
		
		if (type.equals("1")) {
			// 관람내역 가져오기
			list = MemberDAO.memberWhatchData(no);
		} else {
			// 예매내역
			list = MemberDAO.memberReserveList(no);
			request.setAttribute("check", "ok");
		}
		
		try {
			for (MemberReserveListVO vo : list) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
				String sDate = sdf.format(vo.getRdate());		
				
				vo.setListdate(sDate);
				System.out.println(sDate+"@@");
				System.out.println(vo.getListdate());
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
		}

		request.setAttribute("list", list);
		request.setAttribute("jsp", "../mypage/mypage.jsp");
		request.setAttribute("jsp2", "../mypage/reserveList.jsp");

		return "main/main.jsp";
	}
}
