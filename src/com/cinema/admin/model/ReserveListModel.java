package com.cinema.admin.model;

import java.util.*;
import javax.servlet.http.*;
import com.cinema.controller.*;
import com.cinema.admin.dao.*;

@Controller
public class ReserveListModel{

	@RequestMapping("reservelist.do")
	public String qnaList(HttpServletRequest request){
		String page= request.getParameter("page");
		
		if(page == null) page = "1";
		int curpage = Integer.parseInt(page);
		int rowSize = 10;
		int start = (curpage*rowSize)-(rowSize-1);
		int end = curpage*rowSize;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<ReserveListVO> list = AdminDAO.reserveList(map);
		int totalpage = AdminDAO.reserveTotal();
		
		request.setAttribute("list", list);
		request.setAttribute("page", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("jsp", "../adminpage/menubar.jsp");
		request.setAttribute("jsp2", "../adminpage/reservelist.jsp");
		System.out.println(list==null);
		
		return "main/main.jsp";
	}
	
}