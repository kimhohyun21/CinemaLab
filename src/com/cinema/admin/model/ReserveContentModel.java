package com.cinema.admin.model;

import javax.servlet.http.HttpServletRequest;
import com.cinema.admin.dao.*;
import com.cinema.controller.*;

@Controller
public class ReserveContentModel{

	@RequestMapping("reservecontent.do")
	public String handlerRequest(HttpServletRequest request){
		//no값과 page값 받아오기
		String no = request.getParameter("no");
		String page= request.getParameter("page");
		ReserveListVO vo = AdminDAO.reserveContent(Integer.parseInt(no));
		request.setAttribute("no", no);
		request.setAttribute("page", page);
		request.setAttribute("vo", vo);
		request.setAttribute("jsp", "reservelist.jsp");
		request.setAttribute("jsp", "../adminpage/reservecontent.jsp");
		
		return "main/main.jsp";
		
	}

}
