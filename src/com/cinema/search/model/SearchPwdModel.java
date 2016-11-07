package com.cinema.search.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;

@Controller
public class SearchPwdModel {
	@RequestMapping("searchPwd.do")
	public String searchPwd(HttpServletRequest request){
		request.setAttribute("jsp", "../search/searchpwd.jsp");
		return "main/main.jsp";
	}
}
