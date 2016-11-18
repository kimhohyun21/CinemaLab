package com.cinema.customer.model;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import com.cinema.controller.*;
import com.cinema.customer.dao.*;
@Controller
public class ListModel{
	@RequestMapping("customer.do")
	public String qnaList(HttpServletRequest request){
		//page값 불러오기
		String page= request.getParameter("page");
		if(page == null) page = "1";
		int curpage = Integer.parseInt(page);
		//한 페이지에 출력할 컨텐츠 수
		int rowSize = 10;
		int start = (curpage*rowSize)-(rowSize-1);
		int end = curpage*rowSize;
		
		Map map = new HashMap();
		map.put("start", start);		
		map.put("end", end);
		
		List<CustomerVO> list = CustomerDAO.getcustomerList(map);
		int totalpage = CustomerDAO.customerTotal();
		
		request.setAttribute("list", list);
		request.setAttribute("page", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("jsp", "../customer/list.jsp");
		System.out.println(list==null);
		
		return "main/main.jsp";
	}
	
}