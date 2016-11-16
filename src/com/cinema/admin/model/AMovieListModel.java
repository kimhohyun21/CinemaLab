package com.cinema.admin.model;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cinema.admin.dao.AdminDAO;
import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.movieList.*;
import com.cinema.movieList.dao.MovieVO;

@Controller
public class AMovieListModel {
	@RequestMapping("Amovielist.do")
	public String movieList(HttpServletRequest request){
		//���� ����Ʈ �̾ƿ���
		List<MovieVO> list=AdminDAO.adminMovieAllList();
		
		// yyyy-MM-dd 00:00:00  �޺κ� �ð� �����
		for(MovieVO vo:list){
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			String Date = sdf.format(vo.getOpendate());
			vo.setDate(Date);		}
		
		//������ ����
		String sPage=request.getParameter("page");
		if(sPage==null)sPage="1";
		int page=Integer.parseInt(sPage);
		int row=10;
		int start=(row*page)-(row-1);
		int end=(row*page);
		int rowCount=AdminDAO.adminMovieCount();
		int totalPage=(rowCount/row)+1;
		int block=5;
		int fromPage=((page-1)/block*block)+1;
		int toPage=((page-1)/block*block)+block;
		if(rowCount%row==0)
			totalPage-=1;
		if(toPage>totalPage)
			toPage=totalPage;
		
		
		request.setAttribute("page",page);
		request.setAttribute("start",start);
		request.setAttribute("end",end);
		request.setAttribute("totalPage",totalPage);
		request.setAttribute("block",block);
		request.setAttribute("fromPage",fromPage);
		request.setAttribute("toPage",toPage);
		request.setAttribute("list",list);
		request.setAttribute("jsp","../adminpage/menubar.jsp");
		request.setAttribute("jsp2", "../adminpage/movielist.jsp");
		return "main/main.jsp";
	}
}
