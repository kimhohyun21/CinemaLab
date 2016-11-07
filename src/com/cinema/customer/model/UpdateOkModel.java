package com.cinema.customer.model;

import javax.servlet.http.*;
import com.cinema.controller.*;
import com.cinema.customer.dao.*;

@Controller
public class UpdateOkModel{

	@RequestMapping("update.do")
	public String handlerRequest(HttpServletRequest request){
		
		System.out.println("¾îµð´Ï?");
		String plist=request.getParameter("list");
		String strPage=request.getParameter("page");
		String strNo=request.getParameter("no");
		int no=Integer.parseInt(strNo);
		String fs=request.getParameter("fs");
		String fi=request.getParameter("fi");
		
		customerVO vo=customerDAO.customerUpdate(no);
		request.setAttribute("jsp", "../customer/update.jsp");
		request.setAttribute("plist", plist);
		request.setAttribute("page", strPage);
		request.setAttribute("fs", fs);
		request.setAttribute("fi", fi);
		
		return "main/main.jsp";
	}

}
