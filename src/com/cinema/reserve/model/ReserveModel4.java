package com.cinema.reserve.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.member.dao.MemberVO;
import com.cinema.reserve.dao.ReserveDAO;
import com.cinema.reserve.dao.ReserveVO;

@Controller
public class ReserveModel4 {
	
	@RequestMapping("reserve4.do")
	public String Reserve4(HttpServletRequest request){
		try{
			request.setCharacterEncoding("EUC-KR");
			
			//��¥ ����
			String year=request.getParameter("year");
			String month=request.getParameter("month");
			String checkedDay=request.getParameter("checkedDay");
			String checkedDay2=request.getParameter("checkedDay2");			
			
			//���� ����
			String tname=request.getParameter("tname");
			
			//��ȭ ����
			String grade=request.getParameter("grade");
			String title=request.getParameter("title");
			String poster=request.getParameter("poster");
			
			//�󿵽ð�
			String theaterNo=request.getParameter("theaterNo");
			String movietime=request.getParameter("movietime");
			
			//Ƽ�� �ż� �� �ݾ�
			String ticketAll=request.getParameter("ticketAll");
			String payment=request.getParameter("payment");
			
			//�¼�
			String seatNo=request.getParameter("seatNo");;
			
			//����� ����
			HttpSession session=request.getSession();
			MemberVO mvo=(MemberVO) session.getAttribute("mvo");
			
			//���� ������ �ּ� ȹ��
			String url=request.getHeader("referer");
			
			//�������� ȹ��
			String paymentId=request.getParameter("pid");
			String shopId=request.getParameter("sid");
			String serverPay=request.getParameter("sp");
			String cardOkNum=request.getParameter("cokn");
			String paytype=request.getParameter("paytype");
			
			
			//���� ���� ����			
			String rDate=year+"-"+month+"-"+checkedDay+" "+movietime;
			String strPayType=null;
			if(paytype.equals("card"))strPayType="�ſ�ī��";
			if(paytype.equals("trans"))strPayType="������ü";
			int no=mvo.getNo();
			
			Map map=new HashMap();
			map.put("theater", tname);
			map.put("theaterNo", theaterNo);
			map.put("movietime", movietime);
			int tNo=ReserveDAO.getTno(map);
			
			//���� ���� ���
			map=new HashMap();
			map.put("rDate", rDate);
			map.put("seat", seatNo);
			map.put("ticket", ticketAll);
			map.put("payType", strPayType);
			map.put("payment", payment);
			map.put("paymentId", paymentId);
			map.put("shopId", shopId);
			map.put("serverPay", serverPay);
			map.put("cardOkNum", cardOkNum);
			map.put("no", no);
			map.put("tNo", tNo);
			ReserveDAO.regReserve(map);
			
			//������ ����
			int totalReserve=ReserveDAO.getTotalReserve();
			System.out.println(totalReserve);
			int reserveNum=ReserveDAO.getReserveNum(title);
			System.out.println(reserveNum);
			double reserveRate=((double)reserveNum/totalReserve)*100;	
			System.out.println(reserveRate);
			double rank = Double.parseDouble(String.format("%.2f",reserveRate));
			System.out.println(rank);

			map=new HashMap();
			map.put("title", title);
			map.put("rank", rank);
			ReserveDAO.updateRank(map);			
			
			request.setAttribute("url", url);
			request.setAttribute("year", year);
			request.setAttribute("month", month);
			request.setAttribute("checkedDay", checkedDay);
			request.setAttribute("checkedDay2", checkedDay2);
			request.setAttribute("tname", tname);
			request.setAttribute("grade", grade);
			request.setAttribute("title", title);
			request.setAttribute("poster", poster);
			request.setAttribute("theaterNo", theaterNo);
			request.setAttribute("movietime", movietime);
			request.setAttribute("ticketAll", ticketAll);
			request.setAttribute("payment", payment);
			request.setAttribute("seatNo", seatNo);
			request.setAttribute("mvo", mvo);
			request.setAttribute("pid", paymentId);
			request.setAttribute("sid", shopId);
			
			request.setAttribute("jsp", "../reserve/reserve4.jsp");		
		}catch(Exception e){
			e.printStackTrace();
		}		
		
		return "main/main.jsp";
	}

}
