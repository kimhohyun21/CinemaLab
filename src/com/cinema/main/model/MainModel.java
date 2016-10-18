package com.cinema.main.model;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.main.dao.*;

@Controller
public class MainModel {
	
	@RequestMapping("main.do")
	public String main(HttpServletRequest request){
		String strPage=request.getParameter("page");
		if(strPage==null)strPage="1";
		int curPage=Integer.parseInt(strPage);
		
		String[] plist;		
		if(curPage==1){
			 plist=new String[]{
					"http://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/201610/10707_103_1.jpg", 
					"http://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/201609/10664_103_1.jpg",
					"http://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/201609/10663_103_1.jpg",
					"http://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/201610/10668_103_1.jpg",
					"http://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/201610/10681_103_1.jpg"
				};
		}else{
			plist=new String[]{
					"http://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/201610/10801_103_1.jpg",
					"http://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/201610/10804_103_1.jpg",
					"http://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/201609/10608_103_1.jpg",
					"http://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/201609/10671_103_1.jpg",
					"http://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/201609/10611_103_1.jpg"	
				};
		}
		int totalPage=2;
		
		/*
		int totalPage=Main.DAO.getTotalPage();
		
		int cols=5;
		int start=curPage+(curPage-1)*cols;
		int end=curPage*cols;
		
		Map map=new Map();
		map.put("start", start);
		map.put("end", end);
		
		List<MainVO> plist=MainDAO.getListData(1, map);			 
		 */
		
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("plist", plist);
		request.setAttribute("jsp", "default.jsp");
		
		return "main/main.jsp";
	}
}
