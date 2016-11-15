package com.cinema.customer.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.*;
import com.cinema.customer.dao.*;

@Controller
public class ContentModel{

	@RequestMapping("content.do")
	public String handlerRequest(HttpServletRequest request){
		//리스트에서 컨텐츠로 넘겨준 no값과 page값 불러오기
		String no = request.getParameter("no");
		String page= request.getParameter("page");
		
		//DAO에서 정리한 쿼리문 불러오기
		CustomerVO vo = CustomerDAO.customerContent(Integer.parseInt(no));
		request.setAttribute("no", no);
		request.setAttribute("page", page);
		request.setAttribute("vo", vo);
		request.setAttribute("jsp", "list.jsp");
		request.setAttribute("jsp", "../customer/content.jsp");
		
		return "main/main.jsp";
		
	}

}
