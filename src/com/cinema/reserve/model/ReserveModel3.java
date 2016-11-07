package com.cinema.reserve.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;

@Controller
public class ReserveModel3 {
	@RequestMapping("reserve3.do")
	public String Reserve3(HttpServletRequest request){
		//��¥ ����
		String year=request.getParameter("year");
		String month=request.getParameter("month");
		String checkedDay=request.getParameter("checkedDay");
		String checkedDay2=request.getParameter("checkedDay2");
		
		//���� ����
		String tname=request.getParameter("tname");
		
		//��ȭ ����
		String grade=request.getParameter("grade");
		String title=request.getParameter("title");
		
		//�󿵽ð�
		String theaterNo=request.getParameter("theaterNo");
		String movietime=request.getParameter("movietime");
		
		//Ƽ�� �ż�
		String ticketAll=request.getParameter("ticketAll");
		String payment=request.getParameter("payment");
		
		//�¼�
		String[] seat=request.getParameterValues("seat");
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("checkedDay", checkedDay);
		request.setAttribute("checkedDay2", checkedDay2);
		request.setAttribute("tname", tname);
		request.setAttribute("grade", grade);
		request.setAttribute("title", title);
		request.setAttribute("theaterNo", theaterNo);
		request.setAttribute("movietime", movietime);
		request.setAttribute("ticketAll", ticketAll);
		request.setAttribute("payment", payment);
		request.setAttribute("seat", seat);
		
		request.setAttribute("jsp", "../reserve/reserve3.jsp");		
		
		return "main/main.jsp";
	}
	
	@RequestMapping("reserve4.do")
	public String Reserve4(HttpServletRequest request){
		
		request.setAttribute("jsp", "../reserve/reserve4.jsp");	
		return "main/main.jsp";
	}

}
