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
		String pwd = request.getParameter("pwd");
		System.out.println(pwd);

		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("mvo");
		int no = vo.getNo();
		System.out.println(no+"dbdbdbdbdbdbdb");
		String db_pwd = MemberDAO.memberGetPwd(no);
		boolean pCheck = false;

		if (db_pwd.equals(pwd)) {
			pCheck = true;
			String change_pwd=request.getParameter("change_pwd");			
			vo.setPwd(change_pwd);
			MemberDAO.memberModify(vo);
		} else {
			pCheck = false;
		}
		request.setAttribute("pCheck", pCheck);

		return "login/change_pwd_ok.jsp";
	}
}