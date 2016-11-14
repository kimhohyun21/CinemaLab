package com.cinema.admin.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.cinema.admin.dao.AdminDAO;
import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.movieList.dao.MovieVO;

@Controller
public class AModifyMovieListModel {
	@RequestMapping("Amodifymovielist.do")
	public String modifyMovieList(HttpServletRequest request){
		String sno=(String) request.getParameter("no");	
		int no = Integer.parseInt(sno);		
		
		
		//��ȭ������ ��������
		MovieVO vo=AdminDAO.adminMovieData(no);
		
		SimpleDateFormat yearF=new SimpleDateFormat("yyyy");
		SimpleDateFormat monthF=new SimpleDateFormat("MM");
		SimpleDateFormat dayF=new SimpleDateFormat("dd");
		String year = yearF.format(vo.getOpendate());
		String month = monthF.format(vo.getOpendate());
		String day = dayF.format(vo.getOpendate());
		
		/*// �ٰŸ� ��������
		String content=vo.getContent();
		content.replaceAll("\r\n", "<br>");
		content.replaceAll("\u0020", " ");
		vo.setContent(content);*/
		
		// �󿵽ð� '��'����
		String runtime=vo.getRuntime().replaceAll("��", "");
		vo.setRuntime(runtime);
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("vo", vo);
		request.setAttribute("jsp", "../adminpage/menubar.jsp");
		request.setAttribute("jsp2", "../adminpage/moviemodify.jsp");
		return "main/main.jsp";
	}
}
