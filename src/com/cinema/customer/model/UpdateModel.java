package com.cinema.customer.model;

import javax.servlet.http.*;
import com.cinema.controller.*;
import com.cinema.customer.dao.*;

@Controller
public class UpdateModel{

	@RequestMapping("update.do")
	public String handlerRequest(HttpServletRequest request){
		
		System.out.println("¾îµð´Ï?");
		String strPage=request.getParameter("page");
		String strNo=request.getParameter("no");
		int no=Integer.parseInt(strNo);
		customerVO vo=customerDAO.customerUpdate(no);
		request.setAttribute("vo",vo);
		System.out.println(vo.getQsubject());
		
		request.setAttribute("jsp", "../customer/update.jsp");
		
		return "main/main.jsp";
	}

}
