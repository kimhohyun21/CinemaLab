package com.cinema.customer.model;

import javax.servlet.http.*;
import com.cinema.controller.*;
import com.cinema.customer.dao.*;

@Controller
public class DeleteModel{

	@RequestMapping("delete.do")
	public String handlerRequest(HttpServletRequest request){
		try{
			//불러오기
			String content=request.getParameter("content");
			String subject=request.getParameter("subject");
			String strNo=request.getParameter("no");
			String strPage=request.getParameter("page");
			int no=Integer.parseInt(strNo);
			
			//vo 껍데기를 만들어 컬럼 넣기
			CustomerVO vo = new CustomerVO();
			vo.setQcontent(content);
			vo.setQsubject(subject);
			vo.setQno(no);
			CustomerDAO.customerDelete(vo);
			request.setAttribute("page", strPage);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		
		return "customer/delete.jsp";
	}

}
