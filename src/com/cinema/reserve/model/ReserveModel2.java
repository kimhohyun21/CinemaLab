package com.cinema.reserve.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.reserve.dao.*;

import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class ReserveModel2 {
	@RequestMapping("reserve2.do")
	public String reserve2(HttpServletRequest request){
		
		//��¥ ����
		String year=request.getParameter("year");
		String month=request.getParameter("month");
		String checkedDay=request.getParameter("checkedDay");
		String checkedDay2=request.getParameter("checkedDay2");
		
		//���� ����
		String local=request.getParameter("local");
		String tname=request.getParameter("tname");
		
		//��ȭ ����
		String grade=request.getParameter("grade");
		String title=request.getParameter("title");		
		
		//�󿵽ð�
		String theaterNo=request.getParameter("theaterNo");
		String movietime=request.getParameter("movietime");
		
		//Ƽ�� �ż�
		String adult=request.getParameter("adult");
		if(adult==null)adult="0";
		int ticket1=Integer.parseInt(adult);
		String senior=request.getParameter("senior");
		if(senior==null)senior="0";
		int ticket2=Integer.parseInt(senior);
		String junior=request.getParameter("junior");
		if(junior==null)junior="0";
		int ticket3=Integer.parseInt(junior);
		int ticketAll=ticket1+ticket2+ticket3;
		
		//���� �ݾ�
		int payment=ticket1*10000+ticket2*6000+ticket3*8000;
		
		//�¼�
		String[] seat=request.getParameterValues("seat");
		
		//Ajax ���� ���� ����
		String rType=request.getParameter("rType");
		if(rType==null)rType="default";
		String movePage=null;
		if(rType.equals("default")){
			movePage="main/main.jsp";
		}else if(rType.equals("seat")){
			movePage="reserve/reserve2_Seat.jsp";
		}else if(rType.equals("result")){
			movePage="reserve/reserve2_Result.jsp";
		}
		
		//�¼� ���� ��Ȳ
		Map map=new HashMap();
		map.put("year", year);
		map.put("month", month);
		map.put("day", checkedDay);
		map.put("theater", tname);
		map.put("movietime", movietime);
		map.put("title", title);
		List<ReserveVO> rlist=ReserveDAO.reserveData(map);
		
		//���� �¼� ������ ���
		List<String> slist=new ArrayList<>();
		for(ReserveVO vo : rlist){
			String sit=vo.getSeat();
			StringTokenizer st=new StringTokenizer(sit, ",");
			while(st.hasMoreTokens()){
				 slist.add(st.nextToken());
			}			
		}
		System.out.println(slist==null);
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("checkedDay", checkedDay);
		request.setAttribute("checkedDay2", checkedDay2);
		request.setAttribute("local", local);
		request.setAttribute("tname", tname);
		request.setAttribute("grade", grade);
		request.setAttribute("title", title);
		request.setAttribute("theaterNo", theaterNo);
		request.setAttribute("movietime", movietime);
		request.setAttribute("adult", adult);
		request.setAttribute("senior", senior);
		request.setAttribute("junior", junior);
		request.setAttribute("ticketAll", ticketAll);
		request.setAttribute("payment", payment);
		request.setAttribute("seat", seat);
		request.setAttribute("slist", slist);

		request.setAttribute("jsp", "../reserve/reserve2.jsp");
		request.setAttribute("jsp2", "../reserve/reserve2_Seat.jsp");
		request.setAttribute("jsp3", "../reserve/reserve2_Result.jsp");
		
		return movePage;
	}
}