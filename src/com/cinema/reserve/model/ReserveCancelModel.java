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
		//��û���� �޾ƿ���
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
		
		//��Ҹ� ���� Ŭ���̾�Ʈ ����
		IamportClient client;
		String api_key = "9046148780607955";
		String api_secret = "lSLsAIFwNaaTD0Cs2dtMaYiSrZRvwEERxqk89ZEWaPQOPsgSGKEQIXI9WzFsejkLJETSEyPOnFCd8T5O";
		client = new IamportClient(api_key, api_secret);
		
		//��� ���� ���� ���
		IamportResponse<AccessToken> auth_response = client.getAuth();
		
		//��� ����
		boolean cancelCheck=false;
		String cancelMsg="���Ű� ��ҵǾ����ϴ�.";
		if(auth_response.getResponse()!=null){
			CancelData cancel_data = new CancelData(pid, true);
			IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
			/*if(payment_response.getResponse()!=null){*/ //������ ��忡�� �Ϸ� ������ �ڵ� ��� �Ǵ� ��� ������ �ּ�ó��
				cancelCheck=true;
				ReserveDAO.updateCancel(rNo);
			/*}else{
				cancelMsg=payment_response.getResponse().getFailReason();				
			  }	
			  
			 */				
		}
		
		//���� ���� ���
		HttpSession session=request.getSession();
		MemberVO mvo=(MemberVO) session.getAttribute("mvo");
		
		request.setAttribute("no", mvo.getNo());
		request.setAttribute("cancelMsg", cancelMsg);
		request.setAttribute("cancelCheck", cancelCheck);
		
		return "reserve/reserveCancel.jsp";
	}
}