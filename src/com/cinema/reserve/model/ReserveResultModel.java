package com.cinema.reserve.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.reserve.dao.*;

import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class ReserveResultModel {
	@RequestMapping("reserveResult.do")
	public String reserveResult(HttpServletRequest request){
		try{
			String year=request.getParameter("year");
			String month=request.getParameter("month");
			String checkedDay=request.getParameter("checkedDay");
			String checkedDay2=request.getParameter("checkedDay2");
			String local=request.getParameter("local");
			String tname=request.getParameter("tname");
			String title=request.getParameter("title");	
			String grade=request.getParameter("grade");
			String theaterNo=request.getParameter("theaterNo");
			String movietime=request.getParameter("movietime");
			String adult=request.getParameter("adult");
			String senior=request.getParameter("senior");
			String junior=request.getParameter("junior");
			String payment=request.getParameter("payment");
			String[] seat=request.getParameterValues("seat");			
			
			request.setAttribute("adult", adult);
			request.setAttribute("senior", senior);
			request.setAttribute("junior", junior);
			request.setAttribute("payment", payment);
			request.setAttribute("seat", seat);
			request.setAttribute("grade", grade);
			request.setAttribute("title", title);
			request.setAttribute("year", year);
			request.setAttribute("month", month);
			request.setAttribute("checkedDay", checkedDay);
			request.setAttribute("checkedDay2", checkedDay2);
			request.setAttribute("movietime", movietime);
			request.setAttribute("tname", tname);
			request.setAttribute("theaterNo", theaterNo);
			request.setAttribute("local", local);
		
		}catch(Exception e){
			e.printStackTrace();
		}
	
		return "reserve/reserveResult.jsp";
	}
}