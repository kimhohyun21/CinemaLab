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
		System.out.println(rno);
		String pid=request.getParameter("pid");
		int rNo=0;
		if(pid!=null)rNo=ReserveDAO.getRno(pid);
		if(rno!=null){
			rNo=Integer.parseInt(rno);
			ReserveVO vo=ReserveDAO.getReserveData(rNo);
			pid=vo.getPaymentId();
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
		String cancelMsg="예매가 취소되었습니다.";
		if(auth_response.getResponse()!=null){
			CancelData cancel_data = new CancelData(pid, true);
			IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
			/*if(payment_response.getResponse()!=null){*/ //개발자 모드에서 하루 지나면 자동 취소 되는 경우 때문에 주석처리
				cancelCheck=true;
				ReserveDAO.updateCancel(rNo);
			/*}else{
				cancelMsg=payment_response.getResponse().getFailReason();				
			  }	
			  
			 */				
		}
		
		//세션 정보 얻기
		HttpSession session=request.getSession();
		MemberVO mvo=(MemberVO) session.getAttribute("mvo");
		
		request.setAttribute("no", mvo.getNo());
		request.setAttribute("cancelMsg", cancelMsg);
		request.setAttribute("cancelCheck", cancelCheck);
		
		return "reserve/reserveCancel.jsp";
	}
}
