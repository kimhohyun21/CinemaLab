package com.cinema.admin.model;

import java.util.*;
import javax.servlet.http.*;
import com.cinema.controller.*;
import com.cinema.admin.dao.*;

@Controller
public class ReserveListModel{

	@RequestMapping("reservelist.do")
	public String qnaList(HttpServletRequest request){
		//페이지 불러오기
		String page= request.getParameter("page");
		
		if(page == null) page = "1";
		int curpage = Integer.parseInt(page);
		int rowSize = 10;
		int start = (curpage*rowSize)-(rowSize-1);
		int end = curpage*rowSize;
		
		//한번에 최대 표시할 페이지 수
		int block = 5;
		//block에 표시된 페이지까지 같은 block 표시
		int fromPage = ((curpage-1)/block*block)+1;
		int toPage = ((curpage-1)/block*block) + block;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);

		List<ReserveListVO> list = AdminDAO.reserveList(map);
		int totalpage = AdminDAO.reserveTotal();
		
		if(toPage > totalpage)
			toPage = totalpage;
		
		request.setAttribute("fromPage", fromPage);
		request.setAttribute("toPage", toPage);
		request.setAttribute("block", block);
		request.setAttribute("list", list);
		request.setAttribute("page", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("jsp", "../adminpage/menubar.jsp");
		request.setAttribute("jsp2", "../adminpage/reservelist.jsp");
		
		return "main/main.jsp";
	}
	
}