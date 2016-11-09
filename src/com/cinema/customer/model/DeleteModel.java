package com.cinema.customer.model;

import javax.servlet.http.*;
import com.cinema.controller.*;
import com.cinema.customer.dao.*;

@Controller
public class DeleteModel{

	@RequestMapping("delete.do")
	public String handlerRequest(HttpServletRequest request){
		try{
			request.setCharacterEncoding("EUC-KR");
			System.out.println("그저 바라보며");
			String content=request.getParameter("content");
			System.out.println(content);
			String subject=request.getParameter("subject");
			System.out.println(subject);
			String strNo=request.getParameter("no");
			System.out.println(strNo);
			String strPage=request.getParameter("page");
			int no=Integer.parseInt(strNo);
			
			customerVO vo = new customerVO();
			vo.setQcontent(content);
			vo.setQsubject(subject);
			vo.setQno(no);
			customerDAO.customerDelete(vo);
			request.setAttribute("page", strPage);
			System.out.println(no);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		
		return "customer/delete.jsp";
	}

}
