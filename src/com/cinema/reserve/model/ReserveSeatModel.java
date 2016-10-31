package com.cinema.reserve.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.reserve.dao.*;

import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class ReserveSeatModel {
	@RequestMapping("reserveSeat.do")
	public String reserve4(HttpServletRequest request){
		try{
			String year=request.getParameter("year");
			String checkedDay=request.getParameter("checkedDay");
			String checkedDay2=request.getParameter("checkedDay2");
			String local=request.getParameter("local");
			String tname=request.getParameter("tname");
			String title=request.getParameter("title");	
			String grade=request.getParameter("grade");
			String theaterNo=request.getParameter("theaterNo");
			String movietime=request.getParameter("movietime");
			String adult=request.getParameter("adult");
			if(adult==null)adult="0";
			int ticket1=Integer.parseInt(adult);
			String senior=request.getParameter("senior");
			if(senior==null)senior="0";
			int ticket2=Integer.parseInt(senior);
			String junior=request.getParameter("junior");
			if(junior==null)junior="0";
			int ticket3=Integer.parseInt(junior);
			
			int payment=ticket1*10000+ticket2*6000+ticket3*8000;
			System.out.println(payment);
			request.setAttribute("payment", payment);
			request.setAttribute("grade", grade);
			request.setAttribute("title", title);
			request.setAttribute("checkedDay", checkedDay);
			request.setAttribute("checkedDay2", checkedDay2);
			request.setAttribute("movietime", movietime);
			request.setAttribute("tname", tname);
			request.setAttribute("theaterNo", theaterNo);
			request.setAttribute("local", local);
			request.setAttribute("jsp3", "../reserve/reserveResult.jsp");
		
		}catch(Exception e){
			e.printStackTrace();
		}
	
		return "reserve/reserveSeat.jsp";
	}
}