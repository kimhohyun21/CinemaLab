package com.cinema.member.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.RequestMapping;

public class DefaultGoModel {
	@RequestMapping("dmain.do") //·Î±×ÀÎ ºä·Î~
	public String memberJoin(HttpServletRequest reqeust){
		reqeust.setAttribute("jsp", "../main/default.jsp");
		
		return "main/main.jsp";
	}
}
