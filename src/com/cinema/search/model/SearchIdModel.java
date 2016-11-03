package com.cinema.search.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;

@Controller
public class SearchIdModel {
	@RequestMapping("searchId.do")
	public String searchID(HttpServletRequest request){
		request.setAttribute("jsp", "../search/searchid.jsp");
		return "main/main.jsp";
	}
}
