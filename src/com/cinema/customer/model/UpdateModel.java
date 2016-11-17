package com.cinema.customer.model;

import javax.servlet.http.*;
import com.cinema.controller.*;
import com.cinema.customer.dao.*;

@Controller
public class UpdateModel{

	@RequestMapping("update.do")
	public String handlerRequest(HttpServletRequest request){
		
		String strPage=request.getParameter("page");
		String strNo=request.getParameter("no");
		int no=Integer.parseInt(strNo);
		
		CustomerVO vo=CustomerDAO.customerUpdate(no);
		
		request.setAttribute("vo",vo);
		request.setAttribute("no", no);
		request.setAttribute("jsp", "../customer/update.jsp");
		
		return "main/main.jsp";
	}

}
