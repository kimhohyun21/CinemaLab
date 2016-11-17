package com.cinema.mypage.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.member.dao.MemberDAO;
import com.cinema.member.dao.MemberVO;

@Controller
public class MemberChangePwdOkModel {
	@RequestMapping("changepwd_ok.do")
	public String ChangePwdOk(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		
		String strno=request.getParameter("no");		
		int no=Integer.parseInt(strno);
		MemberVO vo=MemberDAO.memberGetAllImfor(no);
		//입력값 가져오기
		String pwd = request.getParameter("pwd");
		
		// DB값 가져오기
		String db_pwd = vo.getPwd();
		boolean pCheck = false;
		
		if (db_pwd.equals(pwd)) {
			pCheck = true;
			// 바꿀 비밀번호
			String change_pwd=request.getParameter("change_pwd");
			vo.setNo(no);
			vo.setPwd(change_pwd);
			MemberDAO.memberChangePwd(vo);
		} else {
			pCheck = false;
		}
		request.setAttribute("pCheck", pCheck);

		return "mypage/change_pwd_ok.jsp";
	}
}