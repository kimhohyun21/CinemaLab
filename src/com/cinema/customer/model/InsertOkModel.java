package com.cinema.customer.model;

import com.cinema.customer.dao.CustomerVO;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.customer.dao.*;

@Controller
public class InsertOkModel{
	
	@RequestMapping("insert_ok.do")
	public String handlerRequest(HttpServletRequest request){		
		try {
			//불러오기
			String name = request.getParameter("name");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String strno = request.getParameter("no");
			int no=Integer.parseInt(strno);
			
			//vo 껍데기에 컬럼 넣기
			CustomerVO vo = new CustomerVO();
			vo.setName(name);
			vo.setNo(no);
			vo.setQsubject(subject);
			vo.setQcontent(content);
			CustomerDAO.customerInsert(vo);
		} catch (Exception e) {			
			System.out.println(e.getMessage());
		}
	
		
		return "customer/insert_ok.jsp";
	
	}
}
