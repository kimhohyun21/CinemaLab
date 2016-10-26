package com.cinema.reserve.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.reserve.dao.*;

import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class ReserveModel2 {
	@RequestMapping("reserve2.do")
	public String main(HttpServletRequest request){
		String checkedDay=request.getParameter("checkedDay");
		String checkedDay2=request.getParameter("checkedDay2");
		String local=request.getParameter("local");
		String tname=request.getParameter("tname");
		String title=request.getParameter("title");		
		String grade=request.getParameter("grade");
		String theaterNo=request.getParameter("theaterNo");
		String movietime=request.getParameter("movietime");
		
		request.setAttribute("grade", grade);
		request.setAttribute("title", title);
		request.setAttribute("checkedDay", checkedDay);
		request.setAttribute("checkedDay2", checkedDay2);
		request.setAttribute("movietime", movietime);
		request.setAttribute("tname", tname);
		request.setAttribute("theaterNo", theaterNo);
		request.setAttribute("local", local);
		request.setAttribute("jsp", "../reserve/reserve2.jsp");
	
		return "main/main.jsp";
	}
}