package com.cinema.admin.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;

@Controller
public class AModifyOkModel {
	@RequestMapping("Amodify_Ok.do")
	public String modifyOk(HttpServletRequest request){
		
		//������������
		String title=request.getParameter("title");
		String poster=request.getParameter("poster");		
		String grade=request.getParameter("grade");
		String type=request.getParameter("type");
		String runtime=request.getParameter("runtime");
		String year=request.getParameter("year");
		String month=request.getParameter("month");
		String day=request.getParameter("day");
		// �󿵽ð� '��' �߰�
		
		//����
		
		return "main/main.jsp";
	}
}
