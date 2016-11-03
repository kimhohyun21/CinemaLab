package com.cinema.customer.model;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import com.cinema.controller.*;
import com.cinema.customer.dao.*;
@Controller
public class ListModel{
	@RequestMapping("customer.do")
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
		
		System.out.println("¾È³ç");
		List<customerVO> list = customerDAO.getcustomerList(map);
		int totalpage = customerDAO.customerTotalPage();
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("jsp", "../customer/list.jsp");
		System.out.println(list==null);
		
		return "main/main.jsp";
	}
}