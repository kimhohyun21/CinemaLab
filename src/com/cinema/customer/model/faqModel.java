package com.cinema.customer.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.customer.dao.customerDAO;
import com.cinema.customer.dao.customerVO;

@Controller
public class faqModel {
	@RequestMapping("faq.do")
	public String main(HttpServletRequest request){
		
		List<customerVO> list = customerDAO.getfaqList();
		request.setAttribute("list", list);
		request.setAttribute("jsp", "../customer/faq.jsp");
		
		return "main/main.jsp";
	}
}
