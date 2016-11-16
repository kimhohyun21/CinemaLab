package com.cinema.movieList.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.member.dao.MemberVO;
import com.cinema.movieList.dao.*;

@Controller
public class MoviedetailModel {
	
	@RequestMapping("moviedetail.do")
	public String HandlerRequest(HttpServletRequest request){
		try{
			Map map=new HashMap();
			String no=request.getParameter("no");
			int mNo = Integer.parseInt(no);
			HttpSession session = request.getSession();
			MemberVO vo1 = (MemberVO) session.getAttribute("mvo");
			
			int check=0;
			if(vo1!=null){	//�α����� ���� ���
				int memberNo=vo1.getNo();
				
				//��� ��� ���� Ȯ��
				map.put("mNo", mNo);
				map.put("memberNo", memberNo);
				check=MovieDAO.replyRecordCheck(map);
			}
			
			//��ȭ �� ����
			MovieVO vo=MovieDAO.getmoviedetail(mNo);
			List<MovieVO> list = MovieDAO.getmoviecharacter(mNo);
			String url=vo.getTrailer();
			url=url.substring(url.lastIndexOf("/")+1);
			
			//������ ����
			String page=request.getParameter("page");
			String type=request.getParameter("type");
			if(page==null) page="1";
			int curpage=Integer.parseInt(page);
			int rowSize=5;
			int start=(curpage*rowSize)-(rowSize-1);
			int end=curpage*rowSize;
			
			map=new HashMap();
			map.put("start", start);
			map.put("end",end);
			map.put("mNo", mNo);
			
			//��� �ִ� ��� �ѷ��ֱ�
			List<MovieVO> replyList = MovieDAO.getReplyData(map);
			int totalpage=MovieDAO.replyTotalPage(mNo);
			
			
			int block=5;
			int frompage=((curpage-1)/block*block)+1;
			int topage=((curpage-1)/block*block)+block;
			if(topage>totalpage) topage=totalpage;
			
			request.setAttribute("url", url);
			request.setAttribute("list", list);
			request.setAttribute("vo", vo);
			request.setAttribute("jsp", "../movie/moviedetail.jsp");
			request.setAttribute("no", no);
			request.setAttribute("check", check);
			request.setAttribute("type", type);
			request.setAttribute("block", block);
			request.setAttribute("frompage", frompage);
			request.setAttribute("topage", topage);
			request.setAttribute("curpage", curpage);
			request.setAttribute("totalpage", totalpage);
			request.setAttribute("replyList", replyList);
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return "main/main.jsp";
	}
}

















