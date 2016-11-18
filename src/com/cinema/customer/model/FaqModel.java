package com.cinema.customer.model;

import java.util.*;
import javax.servlet.http.*;
import com.cinema.controller.*;
import com.cinema.customer.dao.*;

@Controller
public class FaqModel {
	@RequestMapping("faq.do")
	public String main(HttpServletRequest request){
		
		List<CustomerVO> list = CustomerDAO.getfaqList();
		request.setAttribute("list", list);
		request.setAttribute("jsp", "../customer/faq.jsp");
		
		return "main/main.jsp";
	}
}
