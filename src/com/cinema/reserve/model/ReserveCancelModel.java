package com.cinema.reserve.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.member.dao.MemberVO;
import com.cinema.reserve.dao.*;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class ReserveCancelModel {
	
	@RequestMapping("reserveCancel.do")
	public String reserveCancel(HttpServletRequest request){
		//요청정보 받아오기
		String rno=request.getParameter("rNo");
		String pid=request.getParameter("pid");
		String sid=request.getParameter("sid");
		int rNo=0;
		if(rno!=null){
			rNo=Integer.parseInt(rno);
			ReserveVO vo=ReserveDAO.getReserveData(rNo);
			pid=vo.getPaymentId();
			sid=vo.getShopId();
		}		
		
		//취소를 위한 클라이언트 생성
		IamportClient client;
		String api_key = "9046148780607955";
		String api_secret = "lSLsAIFwNaaTD0Cs2dtMaYiSrZRvwEERxqk89ZEWaPQOPsgSGKEQIXI9WzFsejkLJETSEyPOnFCd8T5O";
		client = new IamportClient(api_key, api_secret);
		
		//취소 접근 권한 얻기
		IamportResponse<AccessToken> auth_response = client.getAuth();
		
		//취소 진행
		boolean cancelCheck=false;
		if(auth_response.getResponse()!=null){
			CancelData cancel_data = new CancelData(pid, true);
			IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
			if(payment_response.getResponse()!=null){
				cancelCheck=true;
				ReserveDAO.updateCancel(rNo);
			}
		}
		
		//세션 정보 얻기
		HttpSession session=request.getSession();
		MemberVO mvo=(MemberVO) session.getAttribute("mvo");
		
		request.setAttribute("no", mvo.getNo());
		request.setAttribute("cancelCheck", cancelCheck);
		
		return "reserve/reserveCancel.jsp";
	}
}
